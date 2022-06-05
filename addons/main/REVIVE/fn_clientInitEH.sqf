/**
* Description:
*
*
* Author:
* Lord-MDB, form
*
* Arguments:
*
* Return Value:
*
* Server Only:
* No
*
* Global:
* No
*
* API:
* No
*
* Example:
* [] call FUNC(clientInitEH);
*/

#include "macros.hpp";

// Ab 0.4 wird man in ArmA 3 bewusstlos
#define MAX_DAMAGE 0.39

DFUNC(HandleDamage) =
{
    params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

    // Variablen nur übernehmen wenn sie gefüllt sind (der EH feuert diverse male - oft unvollständig)
    if !(isNull _unit) then
    {
        GVAR(Damage_unit) = _unit;
        GVAR(Damage_unit_age) = serverTime;
    };

    if !(isNull _source) then
    {
        GVAR(Damage_source) = _source;
        GVAR(Damage_source_age) = serverTime;
    };

    if (_projectile isNotEqualTo "") then
    {
        GVAR(Damage_projectile) = _projectile;
        GVAR(Damage_projectile_age) = serverTime;
    };

    if !(isNull _instigator) then
    {
        GVAR(Damage_instigator) = _instigator;
        GVAR(Damage_instigator_age) = serverTime;
    };

    // Einmalige Auslösung bei schwerer Verletzung von lebenswichtigen Körperteilen
    if (isNil QGVAR(unconsciousHandler) && _damage >= MAX_DAMAGE && !(_selection in ["arms", "hands", "legs"])) then
    {
        GVAR(unconsciousHandler) = true;

        // Spieler bewusstlos machen und weiteren Schaden ausblenden
        player setDamage 0.9;
        player allowDamage false;

        // für GPS
        _unit setVariable ["OPT_isUnconscious", 1, true];

        // Einheit aus Fahrzeug entfernen
        if (vehicle _unit != _unit) then {moveOut _unit};

        // Sprengladungen mit Totmannschalter zünden
        [_unit] call ace_explosives_fnc_onIncapacitated;

        // TFAR deaktivieren und aktive Übertragung abbrechen
        player setVariable ["tf_unable_to_use_radio", true];
        call TFAR_fnc_onSwTangentReleased;
        call TFAR_fnc_onLRTangentReleased;

        // Reisesdistanz loggen
        true call EFUNC(LOGGING,tracker);

        // Verzögert, damit möglichst alle Variablen gefüllt sind (der EH feuert zig mal, teilweise mit unvollständigen Angaben)
        [{
            // alte Variablen von vorherigen Verletzungen leeren
            private _maxAge = serverTime - 5;
            if (GVAR(Damage_unit_age) < _maxAge) then {GVAR(Damage_unit) = objNull};
            if (GVAR(Damage_source_age) < _maxAge) then {GVAR(Damage_source) = objNull};
            if (GVAR(Damage_projectile_age) < _maxAge) then {GVAR(Damage_projectile) = ""};
            if (GVAR(Damage_instigator_age) < _maxAge) then {GVAR(Damage_instigator) = objNull};

            // Source <-> Instigator Redundanz
            if (isNull GVAR(Damage_source) && !isNull GVAR(Damage_instigator)) then {GVAR(Damage_source) = GVAR(Damage_instigator)};
            if (isNull GVAR(Damage_instigator) && !isNull GVAR(Damage_source)) then {GVAR(Damage_instigator) = GVAR(Damage_source)};

            [GVAR(Damage_unit), GVAR(Damage_instigator), GVAR(Damage_source), GVAR(Damage_projectile)] remoteExecCall ["OPT_SHOP_fnc_writeKill", 2, false];

            if (GVAR(Damage_unit) isNotEqualTo GVAR(Damage_source)) then
            {
                [MLOC(KILL_MSG), format["%1", name GVAR(Damage_source)]] spawn BIS_fnc_infoText;
            }
            else
            {
                if (GVAR(Damage_unit) in [GVAR(Damage_source), GVAR(Damage_instigator)]) then
                {
                    [MLOC(KILL_MSG), MLOC(KILL_SELF)] spawn BIS_fnc_infoText;
                }
                else
                {
                    if (isNull GVAR(Damage_source)) then
                    {
                        [MLOC(KILL_MSG), MLOC(KILL_UNKNOWN)] spawn BIS_fnc_infoText;
                    };
                };
            };

            // "Secure" (Fesseln) für diese Leiche auf allen Clients deaktivieren
            [player,
            {
                private _actionID = _this getVariable ["#rev_actionID_secure", -1];
                if (_actionID isNotEqualTo -1) then
                {
                    [_this, _actionID] call bis_fnc_holdActionRemove;
                    _this setVariable ["#rev_actionID_secure", nil, true];
                };
            }] remoteExec ["call", -2, true];

            // Respawn-Dialog ausführen
            [] call FUNC(dialog);
        }, 2, ""] call CFUNC(wait);
    };

    // Maximal die MAX_DAMAGE zurückgeben, damit man quasi nie stirbt
    _damage min MAX_DAMAGE;
};

["Respawn",
{
    params ["_data", "_args"];
    _data params ["_newPlayer", "_oldPlayer"];
    _oldPlayer removeEventHandler ["HandleDamage", GVAR(PLAYER_HANDLE_DAMAGE_EH_ID)];

    // Respawn will change the player Object. We need to reassign the Eventhandler.
    GVAR(PLAYER_HANDLE_DAMAGE_EH_ID) = _newPlayer addEventHandler ["HandleDamage", FUNC(HandleDamage)];

    _newPlayer setVariable ["OPT_isUnconscious", 0, true];
    _newPlayer setVariable ["OPT_isStabilized", 0, true];
    _newPlayer setVariable ["OPT_isDragged", 0, true];
    _newPlayer allowDamage true;
    _newPlayer setVariable ["tf_unable_to_use_radio", false];

    GVAR(OPT_isDragging) = false;
    GVAR(unconsciousHandler) = nil;
    GVAR(respawnedHandler) = nil;

    1 enableChannel true;

    // Shop Dialoge freigeben
    OPT_SHOP_LOCK = false;

    // Verzögert ausführen, da es sonst zeitgleich oder leicht vor dem ACE-Gearsave läuft
    [{
        // TFAR Encryption beim Joinen neu setzen
        if (call TFAR_fnc_haveSWRadio) then
        {
            [call TFAR_fnc_activeSwRadio, EGVAR(RULES,OWN_RADIOKEY)] call TFAR_fnc_setSwRadioCode;
        };

        if (call TFAR_fnc_haveLRRadio) then
        {
            // TFAR LR-Settings wiederherstellen (incl. radio_key neu forciert)
            if (!isNil QEGVAR(RULES,TFAR_LR_SETTINGS)) then
            {
                #define TFAR_CODE_OFFSET 4
                EGVAR(RULES,TFAR_LR_SETTINGS) set [TFAR_CODE_OFFSET, EGVAR(RULES,OWN_RADIOKEY)];
                [call TFAR_fnc_activeLrRadio, EGVAR(RULES,TFAR_LR_SETTINGS)] call TFAR_fnc_setLrSettings;
            };
        }
        else
        {
            // Alte Settings löschen wenn man umgeslottet und keine LR-Funke mehr hat
            EGVAR(RULES,TFAR_LR_SETTINGS) = nil;
        };

        // Waffe neu ausrüsten (evtl. hilft das gegen den Soundbug)
        call FUNC(weaponreequip);

        // Erschöpfung und Waffenwackeln
        player enableFatigue GVAR(Fatigue);
        player enableStamina GVAR(Stamina);
        player setCustomAimCoef GVAR(CustomAimCoef);
    }, 1, ""] call CFUNC(wait);
}] call CFUNC(addEventhandler);

// Avoid Handcuffing
// by TeTeT for OPT
// (ist nur noch zur Sicherheit drin)
inGameUISetEventHandler ["Action", '
    params ["_target"];
    private _actionID = _target getVariable [ "#rev_actionID_secure", -1 ];
    if (_actionID isNotEqualTo -1) then {
        [ _target, _actionID ] call bis_fnc_holdActionRemove;
        true;
    };
'];

// Initial assignment, Respawn Handler does not trigger on first-spawn.
GVAR(PLAYER_HANDLE_DAMAGE_EH_ID) = player addEventHandler ["HandleDamage", FUNC(HandleDamage)];

// Variablen-Reset
GVAR(Damage_unit) = objNull;
GVAR(Damage_unit_age) = 0;
GVAR(Damage_source) = objNull;
GVAR(Damage_source_age) = 0;
GVAR(Damage_projectile) = "";
GVAR(Damage_projectile_age) = 0;
GVAR(Damage_instigator) = objNull;
GVAR(Damage_instigator_age) = 0;

// 3D Marker
GVAR(missionEH_draw3D) = addMissionEventHandler ["Draw3D",
{
    private _nearbyUnits = playableUnits select
    {
        (_x distance player) < 30 and
        lifeState _x isEqualTo "INCAPACITATED" and
        !(incapacitatedState _x == "") and
        _x != player and
        ((getnumber (configFile >> "CfgVehicles" >> (typeof _x) >> "side")) isEqualTo (playerSide call BIS_fnc_sideID))
    };

    {
        drawIcon3D ["\a3\ui_f\data\map\MapControl\hospital_ca.paa", [0.6, 0.15, 0, 0.8], _x, 0.5, 0.5, 0, format ["%1 (%2m)", name _x, round (player distance _x)], 0, 0.02];
    } forEach _nearbyUnits;
}];
