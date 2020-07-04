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

//Waffenruhe 
DFUNC(Waffenruhe) = 
{
// Logeintrag

//Spielzeit
private _Spielzeit = (GVAR(startTime) + GVAR(FREEZETIME) + GVAR(TRUCETIME));

//Nachablauf Waffenruhe Spielzeit auslösen
[FUNC(Spielzeit), {_Spielzeit == serverTime},[]] call CFUNC(waitUntil);
};

//Spielzeit
DFUNC(Spielzeit) = 
{
// Logeintrag

//Spielzeit
private _Endezeit = (GVAR(startTime) + GVAR(FREEZETIME) + GVAR(TRUCETIME) + GVAR(PLAYTIME));

//Nachablauf Spielzeit Ende auslösen
[FUNC(Ende), {_Endezeit == serverTime},[]] call CFUNC(waitUntil);
};

//Ende
DFUNC(Ende) = 
{

};

["missionStarted", {

// SERVER ONLY
// nicht time! time ist 0, da time Zeit von Missionsbeginn mitteilt. serverTime hingegen wird
// immer synchronisiert und beinhaltet Zeit seit Serverstart

GVAR(startTime) = serverTime;
publicVariable QGVAR(startTime); // gibt allen Clients die Startzeit des Servers bekannt

// Logeintrag

//Freeztime 
private _Freeztime = (GVAR(startTime) + GVAR(FREEZETIME));

// Nachablauf Freeztime Waffenruhe auslösen
[FUNC(Waffenruhe), {_Freeztime == serverTime},[]] call CFUNC(waitUntil);

}] call CFUNC(addEventhandler);

