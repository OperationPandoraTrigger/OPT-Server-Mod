/**
* Description:
* transfers all local objects (except humans) to headless client
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
* [] call FUNC(transfer_all);
*/
#include "macros.hpp"

private _objs = allMissionObjects "";
_objs append entities [[], ["CAManBase"], false, false];
_objs append vehicles;

// filter unique elements
_objs = _objs arrayIntersect _objs;

private _localCount = 0;
{
    if (local _x && !(_x isKindOf "CAManBase")) then
    {
        _localCount = _localCount + 1;
        _x remoteExecCall [QFUNC(transfer), 2];
    };
} forEach _objs;

private _str = format ["Machine %1 (%2) saw %3 objects of which %4 were local and hopefully transfered to HC...", clientOwner, profileName, count _objs, _localCount];
["HC", "Transfer-All", [_str]] remoteExecCall ["OPT_LOGGING_fnc_writelog", 2, false];
