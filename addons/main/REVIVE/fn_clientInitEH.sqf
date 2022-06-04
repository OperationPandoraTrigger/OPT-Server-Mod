/**
* Description:
*
*
* Author:
* Lord-MDB
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

//Funktion für EH auslösung
DFUNC(isUnconscious) =
{
    params ["_unit"];
    if (_unit isEqualTo player) then
    {
        //Var für GPS setzen
        _unit setVariable ["OPT_isUnconscious", 1, true];

        //Einheit aus Fahrzeug entfernen
        if (vehicle _unit != _unit) then
        {
            moveOut _unit;
        };

        //Sprengladungen mit Todmannschalter zünden
        [_unit] call ace_explosives_fnc_onIncapacitated;

        //TFAR ausschalten
        player setVariable ["tf_unable_to_use_radio", true];

        //Schaden ausblenden
        player allowDamage false;

        //Dialog ausführen
        [] call FUNC(dialog);
    };
};

["Respawn",
{
    params ["_data", "_args"];
    _data params ["_newPlayer", "_oldPlayer"];
    _oldPlayer removeEventHandler ["HandleDamage", GVAR(PLAYER_HANDLE_DAMAGE_EH_ID)];

    // Respawn will change the player Object. We need to reassign the Eventhandler.
    GVAR(PLAYER_HANDLE_DAMAGE_EH_ID) = _newPlayer addEventHandler ["HandleDamage", FUNC(playerHandleDamage)];

    _newPlayer setVariable ["OPT_isUnconscious", 0, true];
    _newPlayer setVariable ["OPT_isStabilized", 0, true];
    _newPlayer setVariable ["OPT_isDragged", 0, true];
    _newPlayer allowDamage true;
    _newPlayer setVariable ["tf_unable_to_use_radio", false];

    GVAR(OPT_isDragging) = false;
    OPT_REVIVE_unconsciousHandler = nil;
    OPT_REVIVE_respawnedHandler = nil;

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
inGameUISetEventHandler ["Action", '
    params ["_target"];
    private _actionID = _target getVariable [ "#rev_actionID_secure", -1 ];
    if (_actionID isNotEqualTo -1) then {
        [ _target, _actionID ] call bis_fnc_holdActionRemove;
        true;
    };
'];

//EH für Spielerabschüsslog
//Event Aüslösung bei bewustlosen Spieler.
DFUNC(playercheckINCAPACITATED) =
{
    if ((lifeState GVAR(playerHandleDamage_unit) isEqualTo "INCAPACITATED") and isNil "OPT_REVIVE_unconsciousHandler") then
    {
        true call EFUNC(LOGGING,tracker);    // Reisesdistanz loggen
        OPT_REVIVE_unconsciousHandler = true;
        [GVAR(playerHandleDamage_unit), GVAR(playerHandleDamage_instigator), GVAR(playerHandleDamage_source), GVAR(playerHandleDamage_projectile)] remoteExecCall ["OPT_SHOP_fnc_writeKill", 2, false];

        if (GVAR(playerHandleDamage_unit) == GVAR(playerHandleDamage_source)) then
        {
            [MLOC(KILL_MSG), MLOC(KILL_SELF)] spawn BIS_fnc_infoText;
        };
        if (isNull GVAR(playerHandleDamage_source) or isNil QGVAR(playerHandleDamage_source)) then
        {
            [MLOC(KILL_MSG), MLOC(KILL_UNKNOWN)] spawn BIS_fnc_infoText;
        };
        if ((GVAR(playerHandleDamage_unit) != GVAR(playerHandleDamage_source)) and not(isNull GVAR(playerHandleDamage_source) or isNil QGVAR(playerHandleDamage_source))) then
        {
            [MLOC(KILL_MSG), format["%1",name GVAR(playerHandleDamage_instigator)]] spawn BIS_fnc_infoText;
        };

        //Funktion starten wenn Spieler bewustlos ist.
        [player] call FUNC(isUnconscious);
    };
};

DFUNC(playerHandleDamage) =
{
    params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

    //Var übergabe
    GVAR(playerHandleDamage_unit) = _unit;
    //_instigator kann oft nicht übergeben werden _source ist immer vorhanden.
    GVAR(playerHandleDamage_instigator) = _source;
    GVAR(playerHandleDamage_source) = _source;
    GVAR(playerHandleDamage_projectile) = _projectile;
    GVAR(playerHandleDamage_damage) = _damage;

    private _resultingDamage = _damage;

    if ((getDammage _unit >= 0.65) or (_damage >= GVAR(MAX_DAMAGE))) then
    {
        [FUNC(playercheckINCAPACITATED), 1,""] call CLib_fnc_wait;
    };

    if (_damage >= GVAR(MAX_DAMAGE)) then
    {
        // Player will be "down" from this point on.

        // Making him invulnerable to prevent forced respawn and random damage that accumulates, if he get overkilled
        // the Revive-Function should set the desired damage after reviving the body.
        _resultingDamage = GVAR(MAX_DAMAGE);
    };
    _resultingDamage;
};

// The initial EHs are not needed and resulting in strange problems adding a new EH, so we remove any.
// still very bad practise that screams for sideeffects.
// Just look away.
for "_i" from 0 to 6 do {
    player removeEventHandler ["HandleDamage", _i];
};
// ok now you may have a peek again

// Initial assignment, Respawn Handler does not trigger on first-spawn.
GVAR(PLAYER_HANDLE_DAMAGE_EH_ID) = player addEventHandler ["HandleDamage", FUNC(playerHandleDamage)];

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
        private _name = NAME _x;
        drawIcon3D ["\a3\ui_f\data\map\MapControl\hospital_ca.paa", [0.6,0.15,0,0.8], _x, 0.5, 0.5, 0, format["%1 (%2m)", _name, ceil (player distance _x)], 0, 0.02];

    } count _nearbyUnits;
}];
