/**
* Author: [GNC]Lord-MDB
* Punkte erfassung in der Spielzeit
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call FUNC(punkte);
*
*/

#include "macros.hpp"

//Init
GVAR(csat_points_f)=0;
GVAR(nato_points_f)=0;
GVAR(aaf_points_f)=0;
GVAR(points_logtime) =0;

GVAR(Punktecount) = [{

	// Logge und übertrage Punktestand alle 60 Sekunden, solange Spiel noch läuft
	if ((OPT_GELDZEIT_Spielzeitstart) and (OPT_GELDZEIT_PLAYTIME - (serverTime - OPT_GELDZEIT_startTime) > 0)) then
	{
		switch OPT_GELDZEIT_Fraktionauswahl do 
		{
			case "AAFvsCSAT" : 
			{
				// Falls es einen Dominator gibt -> Erhöhe Punkte +1
				if !(GVAR(dominator) isEqualTo sideUnknown) then 
				{

					if (GVAR(dominator) isEqualTo east) then 
					{
						GVAR(csat_points_f) = GVAR(csat_points_f) + (1 / 60);	// 1 Punkt pro Minute
						publicVariable QGVAR(csat_points_f);
						if (round GVAR(csat_points_f) > GVAR(csat_points)) then
						{
							GVAR(csat_points) = round GVAR(csat_points_f);	// übernahme in bisherige integer-zählweise
							publicVariable QGVAR(csat_points);
							GVAR(points_logtime) = serverTime;
							publicVariable QGVAR(points_logtime);
							private _message = format ["CSAT +1 (AAF %1 | CSAT %2)", GVAR(aaf_points), GVAR(csat_points)];
							private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;

							//Log
							diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Fahne",_timestamp,_message];

							// New-Log
							["Mission", "State", [GVAR(nato_points), GVAR(csat_points), GVAR(aaf_points), missionName]] call OPT_LOGGING_fnc_writelog;
						};
					};

					if (GVAR(dominator) isEqualTo independent) then 
					{

						GVAR(aaf_points_f) = GVAR(aaf_points_f) + (1 / 60);	// 1 Punkt pro Minute
						publicVariable QGVAR(aaf_points_f);
						if (round GVAR(aaf_points_f) > GVAR(aaf_points)) then
						{
							GVAR(aaf_points) = round GVAR(aaf_points_f);	// übernahme in bisherige integer-zählweise
							publicVariable QGVAR(aaf_points);
							GVAR(points_logtime) = serverTime;
							publicVariable QGVAR(points_logtime);
							private _message = format ["AAF +1 (AAF %1 | CSAT %2)", GVAR(AAF_points), GVAR(csat_points)];
							private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;

							//Log
							diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Fahne",_timestamp,_message];

							// New-Log
							["Mission", "State", [GVAR(nato_points), GVAR(csat_points), GVAR(aaf_points), missionName]] call OPT_LOGGING_fnc_writelog;
						};
					};
						
				} 
				else 
				{
					if ((serverTime - GVAR(points_logtime)) >= 60) then // letzter logeintrag 1 Minute alt?
					{
						GVAR(points_logtime) = serverTime;
						publicVariable QGVAR(points_logtime);	
						private _message = format ["Kein Dominator (AAF %1 | CSAT %2)", GVAR(aaf_points), GVAR(csat_points)];
						private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;

						//Log
						diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Fahne",_timestamp,_message];

						// New-Log
						["Mission", "State", [GVAR(nato_points), GVAR(csat_points), GVAR(aaf_points), missionName]] call OPT_LOGGING_fnc_writelog;
					};
				};      
			};

			case "NATOvsCSAT" : 
			{
				// Falls es einen Dominator gibt -> Erhöhe Punkte +1
				if !(GVAR(dominator) isEqualTo sideUnknown) then 
				{

					if (GVAR(dominator) isEqualTo east) then 
					{

						GVAR(csat_points_f) = GVAR(csat_points_f) + (1 / 60);	// 1 Punkt pro Minute
						publicVariable QGVAR(csat_points_f);
						if (round GVAR(csat_points_f) > GVAR(csat_points)) then
						{
							GVAR(csat_points) = round GVAR(csat_points_f);	// übernahme in bisherige integer-zählweise
							publicVariable QGVAR(csat_points);
							GVAR(points_logtime) = serverTime;
							publicVariable QGVAR(points_logtime);
							private _message = format ["CSAT +1 (NATO %1 | CSAT %2)", GVAR(nato_points), GVAR(csat_points)];
							private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;

							//Log
							diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Fahne",_timestamp,_message];

							// New-Log
							["Mission", "State", [GVAR(nato_points), GVAR(csat_points), GVAR(aaf_points), missionName]] call OPT_LOGGING_fnc_writelog;
						};
					};

					if (GVAR(dominator) isEqualTo west) then 
					{

						GVAR(nato_points_f) = GVAR(nato_points_f) + (1 / 60);	// 1 Punkt pro Minute
						publicVariable QGVAR(nato_points_f);
						if (round GVAR(nato_points_f) > GVAR(nato_points)) then
						{
							GVAR(nato_points) = round GVAR(nato_points_f);	// übernahme in bisherige integer-zählweise
							publicVariable QGVAR(nato_points);
							GVAR(points_logtime) = serverTime;
							publicVariable QGVAR(points_logtime);
							private _message = format ["NATO +1 (NATO %1 | CSAT %2)", GVAR(nato_points), GVAR(csat_points)];
							private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;

							//Log
							diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Fahne",_timestamp,_message];

							// New-Log
							["Mission", "State", [GVAR(nato_points), GVAR(csat_points), GVAR(aaf_points), missionName]] call OPT_LOGGING_fnc_writelog;
						};
					};
						
				} 
				else 
				{
					if ((serverTime - GVAR(points_logtime)) >= 60) then // letzter logeintrag 1 Minute alt?
					{
						GVAR(points_logtime) = serverTime;
						publicVariable QGVAR(points_logtime);	
						private _message = format ["Kein Dominator (NATO %1 | CSAT %2)", GVAR(nato_points), GVAR(csat_points)];
						private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;

						//Log
						diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Fahne",_timestamp,_message];

						// New-Log
						["Mission", "State", [GVAR(nato_points), GVAR(csat_points), GVAR(aaf_points), missionName]] call OPT_LOGGING_fnc_writelog;
					};
				};
			};

			case "NATOvsAAF" : 
			{
				// Falls es einen Dominator gibt -> Erhöhe Punkte +1
				if !(GVAR(dominator) isEqualTo sideUnknown) then 
				{

					if (GVAR(dominator) isEqualTo west) then 
					{

						GVAR(nato_points_f) = GVAR(nato_points_f) + (1 / 60);	// 1 Punkt pro Minute
						publicVariable QGVAR(nato_points_f);
						if (round GVAR(nato_points_f) > GVAR(nato_points)) then
						{
							GVAR(nato_points) = round GVAR(nato_points_f);	// übernahme in bisherige integer-zählweise
							publicVariable QGVAR(nato_points);
							GVAR(points_logtime) = serverTime;
							publicVariable QGVAR(points_logtime);
							private _message = format ["NATO +1 (NATO %1 | AAF %2)", GVAR(nato_points), GVAR(aaf_points)];
							private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;

							//Log
							diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Fahne",_timestamp,_message];

							// New-Log
							["Mission", "State", [GVAR(nato_points), GVAR(csat_points), GVAR(aaf_points), missionName]] call OPT_LOGGING_fnc_writelog;
						};
					};

					if (GVAR(dominator) isEqualTo independent) then 
					{

						GVAR(aaf_points_f) = GVAR(aaf_points_f) + (1 / 60);	// 1 Punkt pro Minute
						publicVariable QGVAR(aaf_points_f);
						if (round GVAR(aaf_points_f) > GVAR(aaf_points)) then
						{
							GVAR(aaf_points) = round GVAR(aaf_points_f);	// übernahme in bisherige integer-zählweise
							publicVariable QGVAR(aaf_points);
							GVAR(points_logtime) = serverTime;
							publicVariable QGVAR(points_logtime);
							private _message = format ["AAF +1 (Nato %1 | AAF %2)", GVAR(nato_points), GVAR(aaf_points)];
							private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;

							//Log
							diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Fahne",_timestamp,_message];

							// New-Log
							["Mission", "State", [GVAR(nato_points), GVAR(csat_points), GVAR(aaf_points), missionName]] call OPT_LOGGING_fnc_writelog;
						};
					};
						
				} 
				else 
				{
					if ((serverTime - GVAR(points_logtime)) >= 60) then // letzter logeintrag 1 Minute alt?
					{
						GVAR(points_logtime) = serverTime;
						publicVariable QGVAR(points_logtime);						
						private _message = format ["Kein Dominator (NATO %1 | AAF %2)", GVAR(nato_points), GVAR(aaf_points)];
						private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;

						//Log
						diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Fahne",_timestamp,_message];

						// New-Log
						["Mission", "State", [GVAR(nato_points), GVAR(csat_points), GVAR(aaf_points), missionName]] call OPT_LOGGING_fnc_writelog;
					};
				};           
			};

			default 
			{
				ERROR_LOG("Punkte: Fehlehalte Datenübergabe keine Fraktionauswahl erkannt");
			};
		};
	};

}, 1] call CFUNC(addPerFrameHandler);
