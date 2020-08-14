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
* [] call FUNC(initCBAClassEvents);
*
*/
#include "macros.hpp"

//Revive Funktion 
DFUNC(revive) = 
{
    params 
    [
        ["_unit", objNull]
    ];

	GVAR(verletzter) = _unit;
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
		"Wiederbeleben"
	] call ace_common_fnc_progressBar;
};

// Stabilisieren Funktion 
DFUNC(stabilisieren) = 
{
    params 
    [
        ["_unit", objNull]
    ];

	GVAR(verletzter) = _unit;

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
		"Stabilisieren"
	] call ace_common_fnc_progressBar;

};

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

    GVAR(revive_Action_Stabilisieren) = 
    [
        "Erste Hilfe",
        "Stabilisieren",
        "",
        {[_target] call FUNC(stabilisieren)},
        {((_target getVariable ["ACE_isUnconscious", false]) and (_target getVariable ["OPT_isStabilized", 1] == 0))},
        {}

    ] call ace_interact_menu_fnc_createAction;

    GVAR(revive_Action_Wiederbeleben) = 
    [
        "Erste Hilfe",
        "Wiederbeleben",
        "",
        {[_target] call FUNC(revive)},
        {((_target getVariable ["ACE_isUnconscious", false]) or (_target getVariable ["OPT_isStabilized", 1] == 1))},
        {}

    ] call ace_interact_menu_fnc_createAction;

    GVAR(revive_Action_ziehen) = 
    [
        "Tragen/Ziehen",
        "Ziehen",
        "",
        {[player, _target] call ace_dragging_fnc_startDrag},
        {((_target getVariable ["ACE_isUnconscious", false]) or (_target getVariable ["OPT_isStabilized", 1] == 1))},
        {}

    ] call ace_interact_menu_fnc_createAction;

    GVAR(revive_Action_tragen) = 
    [
        "Tragen/Ziehen",
        "Tragen",
        "",
        {[player, _target] call ace_dragging_fnc_startCarry},
        {((_target getVariable ["ACE_isUnconscious", false]) or (_target getVariable ["OPT_isStabilized", 1] == 1))},
        {}

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
    } forEach [GVAR(revive_Action_Stabilisieren),GVAR(revive_Action_Wiederbeleben),GVAR(revive_Action_ziehen),GVAR(revive_Action_tragen)];

}, nil, nil, true] call CBA_fnc_addClassEventHandler;
