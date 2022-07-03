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

DFUNC(HandleDamage) =
{
    params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
//    ["DEBUG", "DamageHandler", [_unit, _selection, _damage, _source, _projectile, _hitIndex, _instigator, _hitPoint]] remoteExec [QEFUNC(LOGGING,writelog), 2];

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

    private _damagePrev = damage _unit;
    private _damageRecieved = _damage - _damagePrev;
    private _damageAccumulated = (_unit getVariable ["OPT_damage_var",0]) + _damageRecieved;
    _unit setVariable ["OPT_damage_var",_damageAccumulated];
    systemChat format ["D:%1 DP:%2 DR:%3 AD:%4 V:%5",_damage,_damagePrev,_damageRecieved,_damageAccumulated,(_unit getVariable ["OPT_damage_var",0])];

    // Einmalige Auslösung bei schwerer Verletzung lebenswichtiger Körperteile
    if (_unit isEqualTo player && isNil QGVAR(unconsciousHandler) && _damageAccumulated >= GVAR(levelreviveaktiv) && !(_selection in ["arms", "hands", "legs"])) then
    {
        // Spieler bewusstlos machen und weiteren Schaden ausblenden
        player allowDamage false;
        player setDamage GVAR(levelreviveaktiv);
        player setUnconscious true;

        GVAR(unconsciousHandler) = true;

        // für Dragging und Chat
        _unit setVariable ["OPT_isUnconscious", 1, true];

        // TFAR deaktivieren und aktive Übertragung abbrechen
        player setVariable ["tf_unable_to_use_radio", true];
        call TFAR_fnc_onSwTangentReleased;
        call TFAR_fnc_onLRTangentReleased;

        // Einheit aus Fahrzeug entfernen
        if (vehicle _unit != _unit) then {moveOut _unit};

        //Spieler verwundet darstellen 
        player playAction "Unconscious";

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

            // Reisedistanz loggen
            true call EFUNC(LOGGING,tracker);

            // Sprengladungen mit Totmannschalter zünden
            [_unit] call ace_explosives_fnc_onIncapacitated;

            // Fremdverschulden
            if (GVAR(Damage_unit) isNotEqualTo GVAR(Damage_source)) then
            {
                private _txt = format["<t font='PuristaBold' size='1.4'>%1</t><br /><t font='PuristaBold' size='2.2'>%2</t>", MLOC(KILL_MSG), name GVAR(Damage_source)];
                [parseText _txt, true, nil, 7, 5, 0] spawn BIS_fnc_textTiles;
            }
            else
            {
                // Eigenverschulden
                if (GVAR(Damage_unit) in [GVAR(Damage_source), GVAR(Damage_instigator)]) then
                {
                    private _txt = format["<t font='PuristaBold' size='1.4'>%1</t><br /><t font='PuristaBold' size='2.2'>%2</t>", MLOC(KILL_MSG), MLOC(KILL_SELF)];
                    [parseText _txt, true, nil, 7, 5, 0] spawn BIS_fnc_textTiles;
                }
                else
                {
                    // Ursache unbekannt
                    if (isNull GVAR(Damage_source)) then
                    {
                        private _txt = format["<t font='PuristaBold' size='1.4'>%1</t><br /><t font='PuristaBold' size='2.2'>%2</t>", MLOC(KILL_MSG), MLOC(KILL_UNKNOWN)];
                        [parseText _txt, true, nil, 7, 5, 0] spawn BIS_fnc_textTiles;
                    };
                };
            };

            // "Secure" (Fesseln) dieser Leiche auf allen Clients deaktivieren
            [player,
            {
                private _actionID = _this getVariable ["#rev_actionID_secure", -1];
                if (_actionID isNotEqualTo -1) then
                {
                    [_this, _actionID] call bis_fnc_holdActionRemove;
                    _this setVariable ["#rev_actionID_secure", nil, true];
                };
            }] remoteExec ["call", -2, true];

            // Respawn-Dialog anzeigen
            [] call FUNC(dialog);
        }, 2, ""] call CFUNC(wait);
        GVAR(levelreviveaktiv);
    }
    else
    {
        // Maximal levelreviveaktiv zurückgeben, damit man nie sofort stirbt (Extremitätsverletzungen werden ignoriert)
        if (_selection in ["arms", "hands", "legs"]) then {0}
        else {_damageAccumulated min GVAR(levelreviveaktiv)};
    };
};

["Respawn",
{
    params ["_data", "_args"];
    _data params ["_newPlayer", "_oldPlayer"];

    // Respawn will change the player Object. We need to reassign the Eventhandler.
    _oldPlayer removeEventHandler ["HandleDamage", GVAR(PLAYER_HANDLE_DAMAGE_EH_ID)];
    GVAR(PLAYER_HANDLE_DAMAGE_EH_ID) = _newPlayer addEventHandler ["HandleDamage", FUNC(HandleDamage)];

    _newPlayer setVariable ["OPT_isUnconscious", 0, true];
    _newPlayer setVariable ["OPT_isStabilized", 0, true];
    _newPlayer setVariable ["OPT_isDragged", 0, true];
    _newPlayer allowDamage true;
    _newPlayer setVariable ["tf_unable_to_use_radio", false];
    _newPlayer setUnconscious false;
    _newPlayer setVariable ["OPT_damage_var",0];

    GVAR(OPT_isDragging) = false;
    GVAR(unconsciousHandler) = nil;
    GVAR(RespawnPressed) = nil;

    1 enableChannel true;
    2 enableChannel true;
    3 enableChannel true;
    4 enableChannel true;
    5 enableChannel true;

    // Shop Dialoge freigeben
    EGVAR(SHOP,LOCK) = false;

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
        (_x distance player) < 30 &&
        lifeState _x isEqualTo "INCAPACITATED" &&
        incapacitatedState _x isNotEqualTo "" &&
        _x != player &&
        ((getnumber (configFile >> "CfgVehicles" >> (typeof _x) >> "side")) isEqualTo (playerSide call BIS_fnc_sideID))
    };

    {
        drawIcon3D ["\a3\ui_f\data\map\MapControl\hospital_ca.paa", [0.6, 0.15, 0, 0.8], _x, 0.5, 0.5, 0, format ["%1 (%2m)", name _x, round (player distance _x)], 0, 0.02];
    } forEach _nearbyUnits;
}];

