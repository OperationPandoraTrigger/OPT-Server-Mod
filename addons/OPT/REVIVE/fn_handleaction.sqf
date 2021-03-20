/**
* Author: James
* call appropriate function 
*
* Arguments:
* 0: <OBJECT> target add action is attached to
* 1: <OBJECT> unit that called the add action
* 2: <STRING> action to handle
*
* Return Value:
* None
*
* Example:
* [cursorObject, player, "action_revive"] call fnc_handleAction.sqf;
*
*/
#include "macros.hpp"

params ["_target", "_caller", "_action"];

////////////////////////////////////////////////
// Handle actions
////////////////////////////////////////////////
switch (_action) do 
{
    case "action_drag": 
    {
        [_target] call FUNC(drag);
    };

    case "action_release": 
    {
        [] call FUNC(release);
    };

    default 
    {

    };
};
