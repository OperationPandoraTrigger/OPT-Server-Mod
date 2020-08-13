/**
* Description:
* Setzen einiger Standartwerte für die Mission
*
* Author:
* Lord-MDB
*
* Arguments:
* None
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
* [] call FUNC(playerinit);
*/
#include "macros.hpp"

// new command since 1.52 - to disable the player raycasts in PvP cause not needed functionality but a lot of cpu calcuation
disableRemoteSensors true;
setTerrainGrid 3.125;
enableEnvironment true;
enableRadio false;
//0 fadeRadio 0;	<-- produce the mysterie bug ;-P
player disableConversation true;
enableSentences false;
oldSubs = showSubtitles false;
enableSaving [false, false];
enableTeamswitch false;

[] call FUNC(briefing);

["missionStarted", {

	// setup earplug ace menu
	private _action_earplug = [
		localize "STR_ACE_EQIP",
		localize "STR_ACE_EQIP_EARPLUGS",
		"",
		{
			params ["_target", "_player", "_params"]; 

			[] call FUNC(earplugs);
		},
		{
			true
		}
	] call ace_interact_menu_fnc_createAction;

	[
		player, 
		1, 
		["ACE_SelfActions", "ACE_Equipment"],
		_action_earplug
	] call ace_interact_menu_fnc_addActionToObject;

}] call CFUNC(addEventhandler);