/**
* Author: James
* log transport distance from a unit that has left a transport helicopter
*
* Arguments:
* 0: <OBJECT> transport vehicle
* 1: <STRING> the vehicle position the unit had occupied
* 2: <OBJECT> unit that left vehicle  
*
* Return Value:
* None
*
* Example:
* [heli, "cargo", player] call func(writeTransportDistance);
*
* Server only:
* yes
*
* Global:
* no
*
* Public:
* no
*/
#include "macros.hpp"

params [
   ["_vec", objNull, [objNull], 1],
   ["_pos", "s", ["s"], 1],
   ["_unit", objNull, [objNull], 1]
];

private _distanceFromBase = 1000;

//if (_vec isEqualTo objNull or _unit isEqualTo objNull) exitWith{};

//if (isPlayer) exitWith{};

private _pilot = _vec getVariable [QGVAR(transport_pilot), objNull];

// end script if either player or pilot is unconscious
private _condition = (lifeState _unit isEqualTo "INCAPACITATED") or (lifeState _pilot isEqualTo "INCAPACITATED");
if (_condition) exitWith {};

private _dis = (getPos _vec) distance2D (_unit getVariable QGVAR(transport_start_loc));

if (_pos in ["cargo", "gunner"] and (_dis > _distanceFromBase)) then 
{
    // Log Flugdistanz
    ["Transport", "Fly", [getPlayerUID _unit, name _unit, side _unit, getPlayerUID _pilot, name _pilot, side _pilot, _dis]] remoteExecCall ["OPT_LOGGING_fnc_writelog", 2, false];
};
