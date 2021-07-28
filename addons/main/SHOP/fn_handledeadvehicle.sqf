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
if (!(_veh isKindOf "CAManBase") && {position _veh inArea "NATO_T_Zone1" || position _veh inArea "NATO_T_Zone2" || position _veh inArea "CSAT_T_Zone1" || position _veh inArea "CSAT_T_Zone2"}) then
{
    private _name = getText(configFile >> "CfgVehicles" >> typeOf _veh >> "displayName");
    private _txt = format["Es gab einen Unfall in der Basis.\n\n Das Wrack von %1 wurde entsorgt.", _name];

    private _entry = GVAR(RECENT_ORDERS) get (netId _veh);
    GVAR(RECENT_ORDERS) deleteAt (netId _veh);
    private _age = serverTime - (_entry select 0);
    private _gutschrift = _entry select 5;
    if (_age <= 5) then
    {
        _txt = format["%1\n\nEs erfolgt eine Gutschrift über %2€.", _txt, _gutschrift];
        [_entry select 1, _entry select 2, _entry select 3, netId _veh, _entry select 4, _gutschrift, "+"] remoteExecCall ["OPT_GELDZEIT_fnc_updateBudget", 2, false];
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
