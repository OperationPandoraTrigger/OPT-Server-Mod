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

/* CODE BODY */
private _name = name _unit;
private _side = side  _unit;
private _message = "";

// determine side of player and flag and log with correct message
switch (_side) do 
{
    case west: 
	{
        if (_flag in GVAR(nato_flags)) then 
		{
            _message = format ["NATO Flagge gesichert von %1", _name];
        }; 
		if (_flag in GVAR(cast_flags)) then 
		{
            _message = format ["NATO Flagge erobert von %1", _name];
        };
		if (_flag in GVAR(aaf_flags)) then 
		{
            _message = format ["NATO Flagge erobert von %1", _name];
        }; 
    };

    case east: 
	{
        if (_flag in GVAR(cast_flags)) then 
		{
            _message = format ["CSAT Flagge gesichert von %1", _name];
        }; 
		if (_flag in GVAR(nato_flags)) then 
		{
            _message = format ["CSAT Flagge erobert von %1", _name];
        };
		if (_flag in GVAR(aaf_flags)) then 
		{
            _message = format ["CSAT Flagge erobert von %1", _name];
        }; 
    };
	case independent: 
	{
        if (_flag in GVAR(aaf_flags)) then 
		{
            _message = format ["AAF Flagge gesichert von %1", _name];
        }; 
		if (_flag in GVAR(cast_flags)) then 
		{
            _message = format ["AAF Flagge erobert von %1", _name];
        };
		if (_flag in GVAR(nato_flags)) then 
		{
            _message = format ["AAF Flagge erobert von %1", _name];
        }; 
    };

    default {};
};

private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;

diag_log format["(%1) Log: %2 --- %3","Fahne",_timestamp,_message];