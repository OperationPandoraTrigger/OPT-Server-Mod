/**
* Description:
* logs object count (global and local)
* can be executed on client OR server
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
* [] call FUNC(stats);
*/
#include "macros.hpp"

// collect objects
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
    };
} forEach _objs;

private _str = format ["Machine %1 (%2) sees %3 objects of which %4 are local.", clientOwner, profileName, count _objs, _localCount];
["HC", "Stats", [_str]] remoteExecCall ["OPT_LOGGING_fnc_writelog", 2, false];
