/**
* Description:
* transfers all local vehicles to headless client
* must be executed on client
* 
* Author:
* form
*
* Arguments:
*
* Return Value:
*
* Server Only:
* No
* 
* Global:
* No
* 
* API:
* No
* 
* Example:
* [] call FUNC(transfer_all_vehicles);
*/
#include "macros.hpp"

private _objs = vehicles;
private _localCount = 0;
{
    if (local _x && !(_x isKindOf "CAManBase")) then
    {
        _localCount = _localCount + 1;
        _x remoteExecCall [QFUNC(transfer), 2];
    };
} forEach _objs;

private _str = format ["Machine %1 (%2) saw %3 vehicles of which %4 were local and hopefully transfered to HC...", clientOwner, profileName, count _objs, _localCount];
["HC", "Transfer-All-Vehicles", [_str]] remoteExecCall ["OPT_LOGGING_fnc_writelog", 2, false];
