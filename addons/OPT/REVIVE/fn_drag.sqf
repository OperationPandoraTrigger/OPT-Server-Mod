/**
* Author: James
* drag action
*
* Arguments:
* 0: <OBJECT> target the player wants to drag
*
* Return Value:
* None
*
* Example:
* [cursorObject] call fnc_handleAction.sqf;
*
*/
#include "macros.hpp"

params ["_target"];
GVAR(OPT_isDragging) = true;

_target attachTo [player, [0, 1.1, 0.092]];
_target setVariable ["OPT_isDragged", 1, true];
player playMove "AcinPknlMwlkSnonWnonDb";

// Rotation fix
[_target, 180] remoteExecCall ["setDir", -2, false];

// Add release action and save its id so it can be removed
_id = player addAction 
[
	"<t color=""#C90000"">" + "Ablegen" + "</t>",
	{_caller = _this select 1; [cursorTarget, _caller, "action_release"] call FUNC(handleAction);},
	[], 
	10, 
	true, 
	true, 
	"", 
	"true"
];

//Playmove check
player addEventHandler ["AnimChanged", {[_this select 0] call FUNC(checkplaymove)}];

// Wait until release action is used
[FUNC(releaseaction), {(!alive player || (lifeState player isEqualTo "INCAPACITATED") || !alive _target || _target getVariable "OPT_isUnconscious" == 0 || !GVAR(OPT_isDragging) || _target getVariable "OPT_isDragged" == 0 )}, "Awesome Delay"] call CLib_fnc_waitUntil;

DFUNC(releaseaction) = 
{
	// Handle release action
	GVAR(OPT_isDragging) = false;

	//EH entfernen
	player removeEventHandler ["AnimChanged", 0];

	//Löschen der letzen Animation 
	player switchMove ""; 
		
	if (!isNull _target && alive _target) then 
	{
		_target playActionNow "Unconscious";
		_target setVariable ["OPT_isDragged", 0, true];
		detach _target;
	};

	player removeAction _id;

	true
};	