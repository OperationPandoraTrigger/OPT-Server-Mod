/**
* Description:
* Initializes Vars für Client und Server
*
* Author:
* [GNC]Lord-MDB
*
* Arguments:
*
* Return Value:
*
* Server Only:
* no
*
* Global:
* yes
*
* API:
* No
*
* Example:
*/
#include "macros.hpp"

//Dateneinlesen
[] call FUNC(config);

// add killed EH to all kind of vehicles, either on map or later spawned via crteateVehicle arrayIntersect
// -> log kill and delete if near base
["LandVehicle", "killed",
{
    _this remoteExecCall [QFUNC(handleDeadVehicle), 2, false];
}] call CBA_fnc_addClassEventHandler;

["Air", "killed",
{
    _this remoteExecCall [QFUNC(handleDeadVehicle), 2, false];
}] call CBA_fnc_addClassEventHandler;

["Ship", "killed",
{
    _this remoteExecCall [QFUNC(handleDeadVehicle), 2, false];
}] call CBA_fnc_addClassEventHandler;

["OPT_B_Slingload_01_Ammo_F", "killed",
{
    _this remoteExecCall [QFUNC(handleDeadVehicle), 2, false];
}] call CBA_fnc_addClassEventHandler;

["OPT_B_Slingload_01_Fuel_F", "killed",
{
    _this remoteExecCall [QFUNC(handleDeadVehicle), 2, false];
}] call CBA_fnc_addClassEventHandler;
