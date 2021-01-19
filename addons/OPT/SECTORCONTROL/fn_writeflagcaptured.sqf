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

/* VALIDATION */
if !(_side isEqualTo west or _side isEqualTo east or _side isEqualTo independent) exitWith{};
private _knownFlag = true;

// determine side of flag and log with correct message
if (_flag in GVAR(nato_flags)) then 
{
    _message = format ["NATO Flagge gesichert von %1", _name];
}
else
{
    if (_flag in GVAR(csat_flags)) then 
    {
        _message = format ["CSAT Flagge erobert von %1", _name];
    }
    else
    {
        if (_flag in GVAR(aaf_flags)) then 
        {
            _message = format ["AAF Flagge erobert von %1", _name];
        }
        else
        {
            _knownFlag = false;
        };
    };
};

if (_knownFlag) then
{
    private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;

    //Log
    diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Fahne",_timestamp,_message];
    ["Flag", "Conquer", [_flag, getPlayerUID _unit, _name, _side, _flag distance2D _unit]] call OPT_LOGGING_fnc_writelog;
};
