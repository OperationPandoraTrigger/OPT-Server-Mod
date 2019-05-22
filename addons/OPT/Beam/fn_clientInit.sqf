/**
 * CLibRef - clientInit
 * 
 * Author: Raven
 * 
 * Description:
 * Initializes the CLibRef perFrame module on the client-side. This example uses CLib's waitUntil
 * function to mimic a repeatable, clientside trigger
 * 
 * Parameter(s):
 * 0: None <Any>
 * 
 * Return Value:
 * None <Any>
 * 
 */

#define TRIGGER_RADIUS 7

// write something to the log in order to show that this function actually got called
// Normally one would use the DUMP(MessageHere) macro for this kind of logging as the log
// messages would not be part of the final code when the ISDEV flag has not been set.
// But for demonstration purposes we always want this message to be logged
//diag_log "Successfully loaded the CLibRef/perFrame module on the client";

diag_log("TEST");

// define a new function "on the fly" aka. a variable holding code
// For function this macro should be used instead of GVAR as it might append some
// debug information to this function's code
DFUNC(triggerCond) = {
	// The condition for the trigger is whether the player is in the trigger area
	private _playerPos = getPos CLib_Player;
	private _distance = GVAR(triggerCenter) vectorDistance _playerPos;
	
	// return the bool
	_distance < TRIGGER_RADIUS;
};

DFUNC(triggerActive) = {
	// The code that should get executed whenever the trigger is activated
	GVAR(triggerMarker) setMarkerColor "ColorBlue";
	hint "You just activated the trigger!";
	
	// set up "waitUntil" for deactivation
	[FUNC(triggerDeactivated), {! ([] call FUNC(triggerCond))},[]] call CFUNC(waitUntil);
};

DFUNC(triggerDeactivated) = {
	// The code that should get executed whenever the trigger is deactivated
	GVAR(triggerMarker) setMarkerColor "ColorRed";
	hint "You just deactivated the trigger!";
	
	// set up "waitUntil" for activation
	[FUNC(triggerActive), FUNC(triggerCondition),[]] call CFUNC(waitUntil);
};


// add an EventHandler (EH) that gets called as soon as a mission starts
// This clearly shows that the calling of the clientInit may be before the mission has
// started. Therefore one often wants to wrapt the code that should be executed in such an EH
// All available Clib-Events are listed here: https://github.com/TaktiCool/CLib/wiki/Events
["missionStarted", {
	diag_log "The mission has started";
	
	// CLib_Player is a special macro that holds a reference to the current player object
	// Similarly to e.g. the ACE_Player macro this does return something different than the player
	// SQF command when e.g. the player is currently remote controlling a unit via Zeus.
	// If yoi don't have any particular reason not to, you should use this macro instead of the player command
	private _playerPos = getpos CLib_Player;
	
	GVAR(triggerCenter) = _playerPos vectorAdd [0,TRIGGER_RADIUS + 3,0];
	
	// Create a marker marking the trigger's area
	
	// QGVAR returns the quoted output of GVAR which assembles a name by also
	// taking the mod and the module into consideration -> avoids name-clashes
	GVAR(triggerMarker) = createMarker [QGVAR(triggerMarker), GVAR(triggerCenter)];
	GVAR(triggerMarker) setMarkerShape "ELLIPSE";
	GVAR(triggerMarker) setMarkerSize [TRIGGER_RADIUS, TRIGGER_RADIUS]; // make the marker have proper radius
	GVAR(triggerMarker) setMarkerColor "ColorGreen";
	GVAR(triggerMarker) setMarkerText "Trigger area";
	
	
	// set up "waitUntil" for activation
	[FUNC(triggerActive), FUNC(triggerCond),[]] call CFUNC(waitUntil);
}, []] call CFUNC(addEventHandler); // The macros CFUNC and CGVAR are similar to the FUNC and GVAR macros with the exception that
// the former ones will always refer to CLib-API functions/variables instead of this module's own functions/variables.