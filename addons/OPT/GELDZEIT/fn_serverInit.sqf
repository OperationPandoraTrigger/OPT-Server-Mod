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

private _time = systemTime;
["Logging", "Start", [7, OPT_GELDZEIT_Fraktionauswahl, format ["%1-%2-%3 %4:%5:%6", _time select 0, _time select 1, _time select 2, _time select 3, _time select 4, _time select 5]]] call OPT_LOGGING_fnc_writelog;
["Mission", "Load", [0, 0, 0, missionName]] call OPT_LOGGING_fnc_writelog;

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

GVAR(playerList) = [];

//Waffenruhe 
DFUNC(Waffenruhe) = 
{
	// Logeintrag
	GVAR(FreeztimeEnde) = true;
	publicVariable QGVAR(FreeztimeEnde);

	GVAR(Waffenruhestart) = true;
	publicVariable QGVAR(Waffenruhestart);

	["Mission", "Truce", [0, 0, 0, missionName]] call OPT_LOGGING_fnc_writelog;

	//Nachablauf Waffenruhe Spielzeit auslösen
	[FUNC(Spielzeit), GVAR(TRUCETIME),""] call CLib_fnc_wait;
};

//Spielzeit
DFUNC(Spielzeit) = 
{
	// Logeintrag
	GVAR(WaffenruheEnde) = true;
	publicVariable QGVAR(WaffenruheEnde);

	GVAR(Spielzeitstart) = true;
	publicVariable QGVAR(Spielzeitstart);

	// Missionsstart loggen
	["Mission", "Start", [0, 0, 0, missionName]] call OPT_LOGGING_fnc_writelog;

	// Nach Ablauf der Waffenruhe die Sektorenmarker von der Karte entfernen
	[] call OPT_SECTORCONTROL_fnc_deletesectormarkers;

	GVAR(PLAYTIMENETTO) = 0;

	GVAR(PLAYTIMENETTO) = (GVAR(PLAYTIME) - GVAR(TRUCETIME) - GVAR(FREEZETIME));	

	//Nachablauf Spielzeit Ende auslösen
	[FUNC(Mission_Ende), GVAR(PLAYTIMENETTO),""] call CLib_fnc_wait;
};

//Mission Ende
DFUNC(Mission_Ende) = 
{
	GVAR(SpielzeitEnde) = true;
	publicVariable QGVAR(SpielzeitEnde);

	GVAR(Endestart) = true;
	publicVariable QGVAR(Endestart);

	[] call FUNC(writePlayerList);

	// Endpunktestand loggen
	["Mission", "End", [OPT_SECTORCONTROL_nato_points, OPT_SECTORCONTROL_csat_points, OPT_SECTORCONTROL_aaf_points, missionName]] call OPT_LOGGING_fnc_writelog;

	[EVENT_SPIELUHR_ENDBILDSCHIRM,[]] call CFUNC(globalEvent);
};

["missionStarted", {
	// SERVER ONLY
	// nicht time! time ist 0, da time Zeit von Missionsbeginn mitteilt. serverTime hingegen wird
	// immer synchronisiert und beinhaltet Zeit seit Serverstart

	GVAR(startTime) = serverTime;
	publicVariable QGVAR(startTime); // gibt allen Clients die Startzeit des Servers bekannt

	GVAR(Mission_start) = true;
	publicVariable QGVAR(Mission_start);

	// Nach Ablauf der Freeztime die Waffenruhe auslösen
	[FUNC(Waffenruhe), GVAR(FREEZETIME),""] call CLib_fnc_wait;

}] call CFUNC(addEventhandler);
