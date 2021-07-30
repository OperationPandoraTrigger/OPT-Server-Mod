/**
* Author: James
* initialize CBA class event HandleRating
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initCBAClassEvents.sqf;
*
*/
#include "macros.hpp"

["CAManBase", "init", 
{
    params ["_unit"];

    /*
    * Argument:
    * 0: Action name <STRING>
    * 1: Name of the action shown in the menu <STRING>
    * 2: Icon <STRING>
    * 3: Statement <CODE>
    * 4: Condition <CODE>
    * 5: Insert children code <CODE> (Optional)
    * 6: Action parameters <ANY> (Optional)
    * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
    * 8: Distance <NUMBER> (Optional)
    * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
    * 10: Modifier function <CODE> (Optional)
    */
    private _action_drag =
    [
        "OPT_REVIVE_DRAG",
        MLOC(DRAG),
        "z\ace\addons\dragging\UI\icons\person_drag.paa",
        {
            params ["_target", "_player", "_params"];
            [_target, _player, "action_drag"] call FUNC(handleAction);
        },
        {
            params ["_target", "_player", "_params"];
            [_target, _player] call FUNC(checkDragging);
        }
    ] call ace_interact_menu_fnc_createAction;

    /*
    * Argument:
    * 0: Object the action should be assigned to <OBJECT>
    * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
    * 2: Parent path of the new action <ARRAY> (Example: `["ACE_SelfActions", "ACE_Equipment"]`)
    * 3: Action <ARRAY>
    */
    {
        [
            _unit,
            0,
            ["ACE_MainActions"],
            _x
        ] call ace_interact_menu_fnc_addActionToObject;
    } forEach [ _action_drag];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;
