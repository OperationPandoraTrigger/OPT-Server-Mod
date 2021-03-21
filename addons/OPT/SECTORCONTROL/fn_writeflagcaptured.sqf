/**
* Author: James
* log changed capture status of given flag
*
* Arguments:
* 0: <OBJECT> flag that was captured
* 1: <OBJECT> unit that captured the flag
*
* Return Value:
* None
*
* Example:
* [flag, player] call writeFlagCaptured.sqf;
*
* Server only:
* yes
*
* Public:
* no
*/

#include "macros.hpp"

/* PARAMS */
params [
   ["_flag", objNull, [objNull], 1],
   ["_unit", objNull, [objNull], 1]
];

/* VALIDATION */
if (_flag isEqualTo objNull or _unit isEqualTo objNull) exitWith{};
if !(_side isEqualTo west or _side isEqualTo east or _side isEqualTo independent) exitWith{};
if !(_flag in GVAR(nato_flags) or _flag in GVAR(csat_flags) or _flag in GVAR(aaf_flags)) exitWith{};

// Logge Fahnen-Eroberung
["Flag", "Conquer", [_flag, getPlayerUID _unit, name _unit, side _unit, _flag distance2D _unit]] call OPT_LOGGING_fnc_writelog;
