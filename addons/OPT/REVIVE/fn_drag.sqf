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
GVAR(drag_target) = _target;

// Rotation fix
[_target, 180] remoteExecCall ["setDir", -2, false];

// Add release action and save its id so it can be removed
GVAR(Addaction_id) = player addAction 
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
GVAR(PLAYER_AnimChanged_EH_ID) = player addEventHandler ["AnimChanged", {[_this select 0] call FUNC(checkplaymove)}];

[{
	params ["_args", "_handle"];

	if (!alive player || (lifeState player isEqualTo "INCAPACITATED") || !alive GVAR(drag_target) || (GVAR(drag_target) getVariable "OPT_isUnconscious" == 0) || !GVAR(OPT_isDragging) || (GVAR(drag_target) getVariable "OPT_isDragged" == 0)) then 
	{
		// Handle release action
		GVAR(OPT_isDragging) = false;

		//EH entfernen
		player removeEventHandler ["AnimChanged", GVAR(PLAYER_AnimChanged_EH_ID)];

		//Löschen der letzen Animation 
		player switchMove ""; 
			
		if (!isNull GVAR(drag_target) && alive GVAR(drag_target)) then 
		{
			GVAR(drag_target) playActionNow "Unconscious";
			GVAR(drag_target) setVariable ["OPT_isDragged", 0, true];
			detach GVAR(drag_target);
		};

		player removeAction GVAR(Addaction_id);

		// PFH entfernen
		_handle call CFUNC(removePerframeHandler);

	};

}, 1, _this] call CFUNC(addPerFrameHandler);


