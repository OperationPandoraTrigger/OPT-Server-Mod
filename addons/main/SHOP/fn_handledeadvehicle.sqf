/**
* Author: James
* log destroyed vehicle with detailed information
*
* Arguments:
* 0: <OBJECT> - Object the event handler is assigned to
* 1: <OBJECT> - Object that killed the unit. Contains the unit itself in case of collisions
* 2: <OBJECT> - Person who pulled the trigger
* 3: <BOOL> - same as useEffects in setDamage alt syntax
*
* Return Value:
* None
*
* Example:
* [car, killer, instigator] call Func(handleDeadVehicle);
*
*/
#include "macros.hpp"

// rewrite into killed and damagged EH so we have the source parameter available
params
[
    ["_veh", objNull, [objNull], 1],
    ["_source", objNull, [objNull], 1],
    ["_instigator", objNull, [objNull], 1],
    "_useEffects"
];

// Wer zuletzt (bis zu 1 Minute vorher) einen Schaden verursacht hat, wird als Täter geführt. (1 Minute wegen fehlgeschlagener Notlandung, etc.)
private _lastDamage = _veh getVariable "lastDamage";
if !(isNil "_lastDamage") then
{
    private _lastDamageAge = serverTime - (_lastDamage select 0);
    if (_lastDamageAge < 60) then
    {
        _instigator = _lastDamage select 1;
    };
};

// log destroyed vehicle and killer
[_veh, _instigator, _source] call FUNC(writeKill);

//Loging Besatzung bei Heli Abschuss
//Heli abschuwsse werden sonst nicht dem AA gutgeschrieben.
if (_veh isKindOf "Air") then
{
    (crew _veh) apply
    {
        [_x, _instigator, _source] remoteExecCall ["OPT_SHOP_fnc_writeKill", 2, false];
    };
 };

// delete all wrecks within the base safezones
if (!(_veh isKindOf "CAManBase") && {position _veh inArea "NATO_T_Zone1" || position _veh inArea "NATO_T_Zone2" || position _veh inArea "CSAT_T_Zone1" || position _veh inArea "CSAT_T_Zone2" || position _veh inArea "CSAT_T_Zone3" || position _veh inArea "CSAT_T_Zone4"}) then
{
    private _name = getText(configFile >> "CfgVehicles" >> typeOf _veh >> "displayName");
    private _txt = format["Es gab einen Unfall in der Basis.\n\n Das Wrack von %1 wurde entsorgt.", _name];

    private _entry = GVAR(RECENT_ORDERS) get (netId _veh);
    GVAR(RECENT_ORDERS) deleteAt (netId _veh);
    private _age = serverTime - (_entry select 0);
    if (_age <= 5) then
    {
        // Geld-Gutschrift
        private _gutschrift = _entry select 5;
        _txt = format["%1\n\nEs erfolgt eine Gutschrift über %2€.", _txt, _gutschrift];
        [_entry select 1, _entry select 2, _entry select 3, netId _veh, _entry select 4, _gutschrift, "+"] remoteExecCall ["OPT_GELDZEIT_fnc_updateBudget", 2, false];

        // Hardcap-Gutschrift
        private _hardcaparray = GVAR(Hardcap_pool) get (typeOf _veh);
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        GVAR(Hardcap_pool) set [typeOf _veh, [_hardcapleft + 1, _hardcaptotal]];
        publicVariable QGVAR(Hardcap_pool);
    };

    // message only for those within a 200m radius
    [_txt] remoteExecCall ["hint", playableUnits select {_x distance _veh < 200}, false];

    // Das Wrack entfernen
    deleteVehicle _veh;

    // cleanup old entries
    {
        private _age = serverTime - (_y select 0);
        if (_age > 5) then
        {
            GVAR(RECENT_ORDERS) deleteAt _x;
        };
    } forEach +GVAR(RECENT_ORDERS);
    publicVariable QGVAR(RECENT_ORDERS);
};
