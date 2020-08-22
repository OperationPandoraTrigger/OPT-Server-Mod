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

diag_log format ["[%1] (%2) %3 %4 %5","OPT","Mission","####################",missionName,"####################"];
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
	["FreeztimeEnde"] remoteExecCall ["systemChat", 0, true];

	GVAR(Waffenruhestart) = true;
	publicVariable QGVAR(Waffenruhestart);
	["Waffenruhestart"] remoteExecCall ["systemChat", 0, true];

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
	["WaffenruheEnde"] remoteExecCall ["systemChat", 0, true];

	GVAR(Spielzeitstart) = true;
	publicVariable QGVAR(Spielzeitstart);
	["Spielzeitstart"] remoteExecCall ["systemChat", 0, true];

	private _timeElapsed = serverTime - OPT_GELDZEIT_startTime;
	private _log_msg = format["Beginn Rest-Spielzeit: %1 min", (GVAR(PLAYTIME) - _timeElapsed) / 60];
	diag_log format ["[%1] (%2) %3","OPT","Mission",_log_msg];
	["Mission", "Start", [0, 0, 0, missionName]] call OPT_LOGGING_fnc_writelog;

	GVAR(PLAYTIMENETTO) = 0;

	GVAR(PLAYTIMENETTO) = (GVAR(PLAYTIME) - GVAR(TRUCETIME) - GVAR(FREEZETIME));	

	//Nachablauf Spielzeit Ende auslösen
	[FUNC(Mission_Ende), GVAR(PLAYTIMENETTO),""] call CLib_fnc_wait;
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

	[] call FUNC(writePlayerList);

	switch GVAR(Fraktionauswahl) do 
	{
    	case "AAFvsCSAT" : 
		{			
			private _points1 = OPT_SECTORCONTROL_aaf_points;
			private _points2 = OPT_SECTORCONTROL_csat_points;

			_timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
			diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Mission",_timestamp,"Missionzeit abgelaufen"];

			_message = format ["Endbudget: (AAF:%1 | CSAT:%2)",GVAR(aaf_budget),GVAR(csat_budget)];
			diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Budget",_timestamp,_message];

			_message = format ["Endpunktestand: (AAF:%1 | CSAT:%2)",_points1, _points2];
			diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Punkte",_timestamp,_message];
		};

		case "NATOvsCSAT" : 
		{
			private _points1 = OPT_SECTORCONTROL_nato_points;
			private _points2 = OPT_SECTORCONTROL_csat_points;

			_timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
			diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Mission",_timestamp,"Missionzeit abgelaufen"];

			_message = format ["Endbudget: (NATO:%1 | CSAT:%2)",GVAR(nato_budget),GVAR(csat_budget)];
			diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Budget",_timestamp,_message];

			_message = format ["Endpunktestand: (NATO:%1 | CSAT:%2)",_points1, _points2];
			diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Punkte",_timestamp,_message];
		};

		case "NATOvsAAF" : 
		{
			private _points1 = OPT_SECTORCONTROL_nato_points;
			private _points2 = OPT_SECTORCONTROL_aaf_points;

			_timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
			diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Mission",_timestamp,"Missionzeit abgelaufen"];

			_message = format ["Endbudget: (NATO:%1 | AAF:%2)",GVAR(nato_budget),GVAR(aaf_budget)];
			diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Budget",_timestamp,_message];

			_message = format ["Endpunktestand: (NATO:%1 | AAF:%2)",_points1, _points2];
			diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Punkte",_timestamp,_message];
		};

   		default 
		{
			ERROR_LOG("Missionende: Fehlehalte Datenübergabe keine Fraktionauswahl erkannt");	
		};
	};
	["Mission", "End", [GVAR(nato_points), GVAR(csat_points), GVAR(aaf_points), missionName]] call OPT_LOGGING_fnc_writelog;

};

["missionStarted", {

	// SERVER ONLY
	// nicht time! time ist 0, da time Zeit von Missionsbeginn mitteilt. serverTime hingegen wird
	// immer synchronisiert und beinhaltet Zeit seit Serverstart

	GVAR(startTime) = serverTime;
	publicVariable QGVAR(startTime); // gibt allen Clients die Startzeit des Servers bekannt

	switch GVAR(Fraktionauswahl) do 
	{
    	case "AAFvsCSAT" : 
		{
			private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
			private _message = format ["Startbudget: AAF:%1 - CSAT:%2",GVAR(aaf_budget),GVAR(csat_budget)];
			diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Budget",_timestamp,_message];

			_timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
			_message = format ["Beginn Waffenruhe: %1 min",(GVAR(TRUCETIME) + GVAR(FREEZETIME)) / 60];
			diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Budget",_timestamp,_message];
		};

		case "NATOvsCSAT" : 
		{
			private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
			private _message = format ["Startbudget: NATO:%1 - CSAT:%2",GVAR(nato_budget),GVAR(csat_budget)];
			diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Budget",_timestamp,_message];

			_timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
			_message = format ["Beginn Waffenruhe: %1 min",(GVAR(TRUCETIME) + GVAR(FREEZETIME)) / 60];
			diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Budget",_timestamp,_message];		
		};

		case "NATOvsAAF" : 
		{
			private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
			private _message = format ["Startbudget: NATO:%1 - AAF:%2",GVAR(nato_budget),GVAR(aaf_budget)];
			diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Budget",_timestamp,_message];

			_timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
			_message = format ["Beginn Waffenruhe: %1 min",(GVAR(TRUCETIME) + GVAR(FREEZETIME)) / 60];
			diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Budget",_timestamp,_message];
		};

   		default 
		{
			ERROR_LOG("Missionbeginn: Fehlehalte Datenübergabe keine Fraktionauswahl erkannt");	
		};
	};

	// Logeintrag
	GVAR(Mission_start) = true;
	publicVariable QGVAR(Mission_start);
	["Missionstart"] remoteExecCall ["systemChat", 0, true];

	// Nachablauf Freeztime Waffenruhe auslösen
	[FUNC(Waffenruhe), GVAR(FREEZETIME),""] call CLib_fnc_wait;

}] call CFUNC(addEventhandler);

