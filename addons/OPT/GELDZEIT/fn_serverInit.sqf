/**
* Description:
* Init Server Zeit und Geldsystem
* 
* Author:
* Lord-MDB
*
* Arguments:
*
* Return Value:
*
* Server Only:
* Yes
* 
* Global:
* No
* 
* API:
* No
* 
* Example:
* [] call FUNC(serverInit);
*/

#include "macros.hpp"

//Init Statussignale

GVAR(Mission_start) = false;
GVAR(FreeztimeEnde) = false;
GVAR(Waffenruhestart) = false;
GVAR(WaffenruheEnde) = false;
GVAR(Spielzeitstart) = false;
GVAR(SpielzeitEnde) = false;
GVAR(Endestart) = false;

publicVariable QGVAR(Mission_start);
publicVariable QGVAR(FreeztimeEnde);
publicVariable QGVAR(Waffenruhestart);
publicVariable QGVAR(WaffenruheEnde);
publicVariable QGVAR(Spielzeitstart);
publicVariable QGVAR(SpielzeitEnde);
publicVariable QGVAR(Endestart);

#define ZWISCHENZEIT 30

//Waffenruhe 
DFUNC(Waffenruhe) = 
{
	// Logeintrag
	GVAR(FreeztimeEnde) = true;
	publicVariable QGVAR(FreeztimeEnde);
	systemChat "FreeztimeEnde";

	GVAR(Waffenruhestart) = true;
	publicVariable QGVAR(Waffenruhestart);
	systemChat "Waffenruhestart";

	//Nachablauf Waffenruhe Spielzeit auslösen
	[FUNC(Spielzeit), GVAR(TRUCETIME),""] call CLib_fnc_wait;
};

//Spielzeit
DFUNC(Spielzeit) = 
{
	// Logeintrag
	GVAR(WaffenruheEnde) = true;
	publicVariable QGVAR(WaffenruheEnde);
	systemChat "WaffenruheEnde";

	GVAR(Spielzeitstart) = true;
	publicVariable QGVAR(Spielzeitstart);
	systemChat "Spielzeitstart";

	//Nachablauf Spielzeit Ende auslösen
	[FUNC(Ende), GVAR(PLAYTIME),""] call CLib_fnc_wait;
};

//Ende
DFUNC(Ende) = 
{
	// Logeintrag
	GVAR(SpielzeitEnde) = true;
	publicVariable QGVAR(SpielzeitEnde);
	systemChat "SpielzeitEnde";

	GVAR(Endestart) = true;
	publicVariable QGVAR(Endestart);
	systemChat "Endestart";

	//Nach Ablauf Zwischenzeit Mission Ende
	[FUNC(MissionEnde),ZWISCHENZEIT,""] call CLib_fnc_wait;

};

//Mission Ende
DFUNC(MissionEnde) = 
{
	// Logeintrag
	GVAR(Mission_Ende) = true;
	publicVariable QGVAR(Mission_Ende);
	systemChat "Mission Ende";

};

["missionStarted", {

	// SERVER ONLY
	// nicht time! time ist 0, da time Zeit von Missionsbeginn mitteilt. serverTime hingegen wird
	// immer synchronisiert und beinhaltet Zeit seit Serverstart

	GVAR(startTime) = serverTime;
	publicVariable QGVAR(startTime); // gibt allen Clients die Startzeit des Servers bekannt

	// Logeintrag
	GVAR(Mission_start) = true;
	publicVariable QGVAR(Mission_start);
	systemChat "Missionstart";

	// Nachablauf Freeztime Waffenruhe auslösen
	[FUNC(Waffenruhe), GVAR(FREEZETIME),""] call CLib_fnc_wait;

}] call CFUNC(addEventhandler);

