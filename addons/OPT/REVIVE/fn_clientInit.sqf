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

//Revive Funktion 
DFUNC(revive) = 
{
	GVAR(verletzter) = cursorTarget;
	GVAR(Helizeit) = 0;

	GVAR(Helizeit) = GVAR(Helizeitsani);

	if (!(typeOf player in GVAR(SaniKlassen))) then 
	{
		//50% längere Heilzeit bei nicht Sanitätern
		GVAR(Helizeit) = GVAR(Helizeitsani)+(GVAR(Helizeitsani)*0.5);
	};

	player switchmove "AinvPknlMstpSnonWrflDnon_medic";

	[
		GVAR(Helizeit),
		[],
		{
			[GVAR(verletzter), false, 1, true] call ace_medical_fnc_setUnconscious;
			[player, GVAR(verletzter)] call ace_medical_treatment_fnc_fullHeal;
			player switchmove "";
			player action ["WeaponInHand", player];

			//Var zurück setzen 
			GVAR(verletzter) setVariable ["OPT_isUnconscious", 0, true];
		 	GVAR(verletzter) setVariable ["OPT_isStabilized", 0, true];

			//Schaden Ausblendung Ausschalten
			GVAR(verletzter) allowDamage true;

			//Log Eintrag auslösen 
			[[GVAR(verletzter),player,1], QFUNC(revivelog), 2] call CFUNC(remoteExec);
		},
		{
			player switchmove "";
			player action ["WeaponInHand", player];
		},
		MLOC(MEDIC_REVIVE)
	] call ace_common_fnc_progressBar;
};

// Stabilisieren Funktion 
DFUNC(stabilisieren) = 
{
	GVAR(verletzter) = cursorTarget;

	player switchmove "AinvPknlMstpSnonWrflDnon_medic";

	GVAR(stabilisierungzeitnew) = 0;

	GVAR(stabilisierungzeitnew) = GVAR(stabilisierungzeit);

	if (!(typeOf player in GVAR(SaniKlassen))) then 
	{
		//50% längere Stabilisierungzeit bei nicht Sanitätern
		GVAR(stabilisierungzeitnew) = GVAR(stabilisierungzeit)+(GVAR(stabilisierungzeit)*0.5);
	};

	[
		GVAR(stabilisierungzeitnew),
		[],
		{
			player switchmove "";
			player action ["WeaponInHand", player];

			//Person bewustlos halten 
			[player, GVAR(verletzter)] call ace_medical_treatment_fnc_fullHeal;
			[GVAR(verletzter), true, 9000, true] call ace_medical_fnc_setUnconscious;

			//Var "Person ist Stabilisiert" auf eins setzen
			GVAR(verletzter) setVariable ["OPT_isStabilized", 1, true];

			//Log Eintrag auslösen 
			[[GVAR(verletzter),player,2], QFUNC(revivelog), 2] call CFUNC(remoteExec);
		},
		{
			player switchmove "";
			player action ["WeaponInHand", player];
		},
		MLOC(STABILISE)
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
		MLOC(KILL_SELF)
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
	MLOC(FIRST_AID),
	MLOC(FIRST_AID),
	"",
	{[] call FUNC(eigenversorgung)},
	{(vehicle player == player)},
	{}

] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions"], GVAR(revive_Action_eigen)] call ace_interact_menu_fnc_addActionToClass;

}] call CFUNC(addEventhandler);
