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

//["DEBUG", "VehicleDestroyed", [_veh, _instigator, _source]] call EFUNC(LOGGING,writelog);

// Wer zuletzt (bis zu 1 Minute vorher) einen Schaden verursacht hat, wird als Täter geführt. (1 Minute wegen fehlgeschlagener Notlandung, etc.)
private _lastDamageShooter = _veh getVariable "lastDamageShooter";
if !(isNil "_lastDamageShooter") then
{
    private _lastDamageShooterAge = serverTime - (_lastDamageShooter select 0);
    if (_lastDamageShooterAge < 60) then
    {
        _instigator = _lastDamageShooter select 1;
    };
};

private _projectile = "";
private _lastDamageProjectile = _veh getVariable "lastDamageProjectile";
if !(isNil "_lastDamageProjectile") then
{
    private _lastDamageProjectileAge = serverTime - (_lastDamageProjectile select 0);
    if (_lastDamageProjectileAge < 60) then
    {
        _projectile = _lastDamageProjectile select 1;
    };
};

//["DEBUG", "VehicleDestroyed2", [_veh, _instigator, _source, _projectile]] call EFUNC(LOGGING,writelog);

// log destroyed vehicle
[_veh, _instigator, _source, _projectile] call FUNC(writeKill);

// log destroyed crew
{
    [_x, _instigator, _source, _projectile] call FUNC(writeKill);
} forEach (crew _veh);

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

        // Hardcap-Gutschrift (nur für Objekte mit Hardcap)
        if (typeOf _veh in GVAR(Hardcap_pool)) then
        {
            private _hardcaparray = GVAR(Hardcap_pool) get (typeOf _veh);
            private _hardcapleft = _hardcaparray select 0;
            private _hardcaptotal = _hardcaparray select 1;
            GVAR(Hardcap_pool) set [typeOf _veh, [_hardcapleft + 1, _hardcaptotal]];
            publicVariable QGVAR(Hardcap_pool);
        };
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
