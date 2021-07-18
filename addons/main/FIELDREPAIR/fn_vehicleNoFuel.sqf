/**
* Author: Senshi
* determine if vehicle has not enough fuel
*
* Arguments:
* 0: <OBJECT> vehicle
*
* Return Value:
* 0: <BOOL> true: vehicle is empty, false: not empty enough
*
* Example:
* [vehicle] call fnc_vehicleNoFuel.sqf;
*
*/
#include "macros.hpp"

params [["_veh", objNull]];

if (_veh isEqualTo objNull) exitWith {false};

private _flag = false;

// 20% Fuel is the threshold
if (fuel _veh < 0.2 && alive player && (player distance _veh) <= 7 && vehicle player == player && speed _veh < 3 && ! GVAR(mutexAction) && alive _veh) then
{
    _flag = true;
}
else
{
    _flag = false;
};

_flag
