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
GVAR(Helizeiteigen) = 20;
GVAR(Helizeitsani) = 20;
GVAR(stabilisierungzeit) = 20;
GVAR(Sani) = ["OPT_NATO_Sanitaeter","OPT_CSAT_Sanitaeter"];

//Revive Funktion 
DFUNC(revive) = 
{
	GVAR(verletzter) = cursorTarget;

	player switchmove "AinvPknlMstpSnonWrflDnon_medic";

	[
		GVAR(Helizeitsani),
		[],
		{
			[GVAR(verletzter), false, 1, true] call ace_medical_fnc_setUnconscious;
			[player, GVAR(verletzter)] call ace_medical_treatment_fnc_fullHeal;
			player switchmove "";
			player action ["WeaponInHand", player];

			//Var zurück setzen 
			GVAR(verletzter) setVariable ["FAR_isUnconscious", 0, true];
		 	GVAR(verletzter) setVariable ["FAR_isStabilized", 0, true];

			//Schaden Ausblendung Ausschalten
			GVAR(verletzter) allowDamage true;
		},
		{
			player switchmove "";
			player action ["WeaponInHand", player];
		},
		"Wiederbeleben"
	] call ace_common_fnc_progressBar;
};

// Stabilisieren Funktion 
DFUNC(stabilisieren) = 
{
	GVAR(verletzter) = cursorTarget;

	player switchmove "AinvPknlMstpSnonWrflDnon_medic";

	[
		GVAR(stabilisierungzeit),
		[],
		{
			player switchmove "";
			player action ["WeaponInHand", player];

			//Person bewustlos halten 
			[player, GVAR(verletzter)] call ace_medical_treatment_fnc_fullHeal;
			[GVAR(verletzter), true, 9000, true] call ace_medical_fnc_setUnconscious;

			//Var "Person ist Stabilisiert" auf eins setzen
			GVAR(verletzter) setVariable ["FAR_isStabilized", 1, true];
		},
		{
			player switchmove "";
			player action ["WeaponInHand", player];
		},
		"Stabilisieren"
	] call ace_common_fnc_progressBar;

};

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
player setVariable ["FAR_isUnconscious", 0, true];
player setVariable ["FAR_isStabilized", 0, true];

//ACE Interaktioneinträge 
revive_Action_eigen = 
[
	"Erste Hilfe",
	"Erste Hilfe",
	"",
	{[] call FUNC(eigenversorgung)},
	{true},
	{}

] call ace_interact_menu_fnc_createAction;

revive_Action_fremd1 = 
[
	"Erste Hilfe",
	"Stabilisieren",
	"",
	{[] call FUNC(stabilisieren)},
	{((cursorTarget getVariable ["ACE_isUnconscious", false]) and (cursorTarget getVariable ["FAR_isStabilized", 1] == 0))},
	{}

] call ace_interact_menu_fnc_createAction;

revive_Action_fremd2 = 
[
	"Erste Hilfe",
	"Wiederbeleben",
	"",
	{[] call FUNC(revive)},
	{(((cursorTarget getVariable ["ACE_isUnconscious", false]) or (cursorTarget getVariable ["FAR_isStabilized", 1] == 1)) and (typeOf player in GVAR(Sani)))},
	{}

] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions"], revive_Action_eigen] call ace_interact_menu_fnc_addActionToClass;
[player, 0, ["ACE_MainActions"],revive_Action_fremd1] call ace_interact_menu_fnc_addActionToObject;
[player, 0, ["ACE_MainActions"],revive_Action_fremd2] call ace_interact_menu_fnc_addActionToObject;

//Test Einträge
[p1, 0, ["ACE_MainActions"],revive_Action_fremd1] call ace_interact_menu_fnc_addActionToObject;

[p2, 0, ["ACE_MainActions"],revive_Action_fremd1] call ace_interact_menu_fnc_addActionToObject;

[p1, 0, ["ACE_MainActions"],revive_Action_fremd2] call ace_interact_menu_fnc_addActionToObject;

[p2, 0, ["ACE_MainActions"],revive_Action_fremd2] call ace_interact_menu_fnc_addActionToObject;
 

}] call CFUNC(addEventhandler);
