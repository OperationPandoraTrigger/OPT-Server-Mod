/**
* Author: James
* determine whether vehicle needs repair
*
* Arguments:
* 0: <OBJECT> vehicle
*
* Return Value:
* 0: <BOOL> true: needs repair, false: not
*
* Example:
* [vehicle] call func(needRepair);
*
*/
#include "macros.hpp"

params [["_veh", objNull]];
private _ret = false;

if (_veh isEqualTo objNull) exitWith {_ret};

private _dmged = [_veh] call FUNC(vehicleDamaged);
_ret = (alive player and {(player distance _veh) <= 7} and {(vehicle player == player)} and {speed _veh < 3} and {not GVAR(mutexAction)} and {_dmged} and {alive _veh});

_ret
