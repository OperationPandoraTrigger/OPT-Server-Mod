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

//Waffenruhe 
DFUNC(Waffenruhe) = 
{
	// Logeintrag
	GVAR(FreeztimeEnde) = true;
	publicVariable QGVAR(FreeztimeEnde);
	["FreeztimeEnde"] remoteExecCall ["systemChat", 0, true];

	GVAR(Waffenruhestart) = true;
	publicVariable QGVAR(Waffenruhestart);
	["Waffenruhestart"] remoteExecCall ["systemChat", 0, true];

	diag_log "########## Waffenruhe hat begonnen ##########";

	//Nachablauf Waffenruhe Spielzeit auslösen
	[FUNC(Spielzeit), GVAR(TRUCETIME),""] call CLib_fnc_wait;
};

//Spielzeit
DFUNC(Spielzeit) = 
{
	// Logeintrag
	GVAR(WaffenruheEnde) = true;
	publicVariable QGVAR(WaffenruheEnde);
	["WaffenruheEnde"] remoteExecCall ["systemChat", 0, true];

	GVAR(Spielzeitstart) = true;
	publicVariable QGVAR(Spielzeitstart);
	["Spielzeitstart"] remoteExecCall ["systemChat", 0, true];

	diag_log "########## Spielzeit hat begonnen ##########";

	//Nachablauf Spielzeit Ende auslösen
	[FUNC(Mission_Ende), GVAR(PLAYTIME),""] call CLib_fnc_wait;
};

//Mission Ende
DFUNC(Mission_Ende) = 
{
	// Logeintrag
	GVAR(SpielzeitEnde) = true;
	publicVariable QGVAR(SpielzeitEnde);
	["SpielzeitEnde"] remoteExecCall ["systemChat", 0, true];

	GVAR(Endestart) = true;
	publicVariable QGVAR(Endestart);
	["Endestart"] remoteExecCall ["systemChat", 0, true];

	[EVENT_SPIELUHR_ENDBILDSCHIRM,[]] call CFUNC(globalEvent);

	switch GVAR(Fraktionauswahl) do 
	{
    	case "AAFvsCSAT" : 
		{
			private _points1 = OPT_SECTORCONTROL_aaf_points;
			private _points2 = OPT_SECTORCONTROL_csat_points;

			diag_log format ["########## Schlacht automatisch beendet. Endpunktestand: AAF %1 | CSAT %2 ##########", _points1, _points2];

		};

		case "NATOvsCSAT" : 
		{
			private _points1 = OPT_SECTORCONTROL_nato_points;
			private _points2 = OPT_SECTORCONTROL_csat_points;

			diag_log format ["########## Schlacht automatisch beendet. Endpunktestand: NATO %1 | CSAT %2 ##########", _points1, _points2];

		};

		case "NATOvsAAF" : 
		{
			private _points1 = OPT_SECTORCONTROL_nato_points;
			private _points2 = OPT_SECTORCONTROL_aaf_points;

			diag_log format ["########## Schlacht automatisch beendet. Endpunktestand: NATO %1 | AAF %2 ##########", _points1, _points2];

		};

   		default 
		{
			ERROR_LOG("Missionende: Fehlehalte Datenübergabe keine Fraktionauswahl erkannt");	
		};
	};


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
	["Missionstart"] remoteExecCall ["systemChat", 0, true];
	diag_log "########## Schlacht hat begonnen ##########";

	diag_log "########## Freeztime hat begonnen ##########";

	// Nachablauf Freeztime Waffenruhe auslösen
	[FUNC(Waffenruhe), GVAR(FREEZETIME),""] call CLib_fnc_wait;

}] call CFUNC(addEventhandler);

