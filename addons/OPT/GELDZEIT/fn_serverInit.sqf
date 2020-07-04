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

GVAR(Missionstart) = false;
GVAR(FreeztimeEnde) = false;
GVAR(Waffenruhestart) = false;
GVAR(WaffenruheEnde) = false;
GVAR(Spielzeitstart) = false;
GVAR(SpielzeitEnde) = false;
GVAR(Endestart) = false;

publicVariable GVAR(Missionstart);
publicVariable GVAR(FreeztimeEnde);
publicVariable GVAR(Waffenruhestart);
publicVariable GVAR(WaffenruheEnde);
publicVariable GVAR(Spielzeitstart);
publicVariable GVAR(SpielzeitEnde);
publicVariable GVAR(Endestart);

//Waffenruhe 
DFUNC(Waffenruhe) = 
{
	// Logeintrag
	GVAR(FreeztimeEnde) = true;
	publicVariable GVAR(FreeztimeEnde);

	GVAR(Waffenruhestart) = true;
	publicVariable GVAR(Waffenruhestart);

	//Spielzeit
	private _Spielzeit = (GVAR(startTime) + GVAR(FREEZETIME) + GVAR(TRUCETIME));

	//Nachablauf Waffenruhe Spielzeit auslösen
	[FUNC(Spielzeit), {_Spielzeit == serverTime},[]] call CFUNC(waitUntil);
};

//Spielzeit
DFUNC(Spielzeit) = 
{
	// Logeintrag
	GVAR(WaffenruheEnde) = true;
	publicVariable GVAR(WaffenruheEnde);

	GVAR(Spielzeitstart) = true;
	publicVariable GVAR(Spielzeitstart);

	//Spielzeit
	private _Endezeit = (GVAR(startTime) + GVAR(FREEZETIME) + GVAR(TRUCETIME) + GVAR(PLAYTIME));

	//Nachablauf Spielzeit Ende auslösen
	[FUNC(Ende), {_Endezeit == serverTime},[]] call CFUNC(waitUntil);
};

//Ende
DFUNC(Ende) = 
{
	// Logeintrag
	GVAR(SpielzeitEnde) = true;
	publicVariable GVAR(SpielzeitEnde);

	GVAR(Endestart) = true;
	publicVariable GVAR(Endestart);

};

["missionStarted", {

	// SERVER ONLY
	// nicht time! time ist 0, da time Zeit von Missionsbeginn mitteilt. serverTime hingegen wird
	// immer synchronisiert und beinhaltet Zeit seit Serverstart

	GVAR(startTime) = serverTime;
	publicVariable QGVAR(startTime); // gibt allen Clients die Startzeit des Servers bekannt

	// Logeintrag
	GVAR(Missionstart) = true;
	publicVariable GVAR(Missionstart);

	//Freeztime 
	private _Freeztime = (GVAR(startTime) + GVAR(FREEZETIME));

	// Nachablauf Freeztime Waffenruhe auslösen
	[FUNC(Waffenruhe), {_Freeztime == serverTime},[]] call CFUNC(waitUntil);

}] call CFUNC(addEventhandler);

