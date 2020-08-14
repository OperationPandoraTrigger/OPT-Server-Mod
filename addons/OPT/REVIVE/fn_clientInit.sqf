/**
* Description:
* Initialisierung Revive System 
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
* [] call FUNC(clientInit);
*/
#include "macros.hpp"

//Init Werte
GVAR(SaniKlassen) = ["OPT_NATO_Sanitaeter","OPT_CSAT_Sanitaeter","OPT_NATO_Sanitaeter_T","OPT_CSAT_Sanitaeter_T","I_medic_F"];

// Eigenversorung Funktion 
DFUNC(eigenversorgung) = 
{
	player switchmove "AinvPknlMstpSnonWrflDnon_medic";	

	[
		GVAR(Helizeiteigen),
		[],
		{
			[player, player] call ace_medical_treatment_fnc_fullHeal;
			player switchmove "";
			player action ["WeaponInHand", player];
		},
		{
			player switchmove "";
			player action ["WeaponInHand", player];	
		}, 
		"Eigenversorgung"
	] call ace_common_fnc_progressBar;

};

["missionStarted", {

// Var setzen 
player setVariable ["OPT_isUnconscious", 0, true];
player setVariable ["OPT_isStabilized", 0, true];

//Chat abschaltung bei Bewustlosigkeit
(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call FUNC(keyUnbind)}];

//ACE Interaktioneinträge 
GVAR(revive_Action_eigen) = 
[
	"Erste Hilfe",
	"Erste Hilfe",
	"",
	{[] call FUNC(eigenversorgung)},
	{(vehicle player == player)},
	{}

] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions"], GVAR(revive_Action_eigen)] call ace_interact_menu_fnc_addActionToClass;

}] call CFUNC(addEventhandler);
