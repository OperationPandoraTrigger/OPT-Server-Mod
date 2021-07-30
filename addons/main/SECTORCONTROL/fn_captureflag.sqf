/**
* Author: James
* script triggered when player captures flag. Write to server log and call setFlagOwner
*
* Arguments:
* 0: <OBJECT> flag
* 1: <OBJECT> unit who captured the flag
*
* Return Value:
* None
*
* Server only:
* No
*
* Public:
* No 
*
* Global:
* No
*
* API:
* No
*
* Example:
* [flag, caller, ID, arguments] call fnc_captureFlag.sqf;
*
*/
#include "macros.hpp"

if (!hasInterface) exitWith {};

params ["_flag", "_caller"];

[side _caller, _flag] remoteExecCall [QFUNC(setFlagOwner), 2, false];

// log player
[_flag, _caller] remoteExecCall [QFUNC(writeFlagCaptured), 2, false];
