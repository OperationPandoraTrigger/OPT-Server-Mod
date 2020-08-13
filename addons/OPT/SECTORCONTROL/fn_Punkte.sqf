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

						GVAR(csat_points) = GVAR(csat_points) + 1;
						publicVariable QGVAR(csat_points);
						private _message = format ["CSAT +1 (AAF %1 | CSAT %2)", GVAR(aaf_points), GVAR(csat_points)];
						private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
						[_message] remoteExecCall ["systemChat", 0, true];

						//Log
						diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Fahne",_timestamp,_message];

					};

					if (GVAR(dominator) isEqualTo independent) then 
					{

						GVAR(aaf_points) = GVAR(aaf_points)  + 1;
						publicVariable QGVAR(aaf_points);
						private _message = format ["AAF +1 (AAF %1 | CSAT %2)", GVAR(AAF_points), GVAR(csat_points)];
						private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
						[_message] remoteExecCall ["systemChat", 0, true];

						//Log
						diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Fahne",_timestamp,_message];
					};
						
				} 
				else 
				{

						private _message = format [localize "STR_POINT_NO_DOMINATOR_AAFvCSAT", GVAR(aaf_points), GVAR(csat_points)];
						private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
						[_message] remoteExecCall ["systemChat", 0, true];

						//Log
						diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Fahne",_timestamp,_message];

				};      
			};

			case "NATOvsCSAT" : 
			{
				// Falls es einen Dominator gibt -> Erhöhe Punkte +1
				if !(GVAR(dominator) isEqualTo sideUnknown) then 
				{

					if (GVAR(dominator) isEqualTo east) then 
					{

						GVAR(csat_points) = GVAR(csat_points) + 1;
						publicVariable QGVAR(csat_points);
						private _message = format ["CSAT +1 (NATO %1 | CSAT %2)", GVAR(nato_points), GVAR(csat_points)];
						private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
						[_message] remoteExecCall ["systemChat", 0, true];

						//Log
						diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Fahne",_timestamp,_message];

					};

					if (GVAR(dominator) isEqualTo west) then 
					{

						GVAR(nato_points) = GVAR(nato_points)  + 1;
						publicVariable QGVAR(nato_points);
						private _message = format ["NATO +1 (NATO %1 | CSAT %2)", GVAR(nato_points), GVAR(csat_points)];
						private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
						[_message] remoteExecCall ["systemChat", 0, true];

						//Log
						diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Fahne",_timestamp,_message];
					};
						
				} 
				else 
				{

						private _message = format [localize "STR_POINT_NO_DOMINATOR_NATOvCSAT", GVAR(nato_points), GVAR(csat_points)];
						private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
						[_message] remoteExecCall ["systemChat", 0, true];

						//Log
						diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Fahne",_timestamp,_message];

				};
			};

			case "NATOvsAAF" : 
			{
				// Falls es einen Dominator gibt -> Erhöhe Punkte +1
				if !(GVAR(dominator) isEqualTo sideUnknown) then 
				{

					if (GVAR(dominator) isEqualTo west) then 
					{

						GVAR(nato_points) = GVAR(nato_points) + 1;
						publicVariable QGVAR(nato_points);
						private _message = format ["NATO +1 (NATO %1 | AAF %2)", GVAR(nato_points), GVAR(aaf_points)];
						private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
						[_message] remoteExecCall ["systemChat", 0, true];

						//Log
						diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Fahne",_timestamp,_message];

					};

					if (GVAR(dominator) isEqualTo independent) then 
					{

						GVAR(aaf_points) = GVAR(aaf_points)  + 1;
						publicVariable QGVAR(aaf_points);
						private _message = format ["AAF +1 (Nato %1 | AAF %2)", GVAR(nato_points), GVAR(aaf_points)];
						private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
						[_message] remoteExecCall ["systemChat", 0, true];

						//Log
						diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Fahne",_timestamp,_message];

					};
						
				} 
				else 
				{

						private _message = format [localize "STR_POINT_NO_DOMINATOR_NATOvAAF", GVAR(nato_points), GVAR(aaf_points)];
						private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
						[_message] remoteExecCall ["systemChat", 0, true];

						//Log
						diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Fahne",_timestamp,_message];

				};           
			};

			default 
			{
				ERROR_LOG("Punkte: Fehlehalte Datenübergabe keine Fraktionauswahl erkannt");
			};
		};
	};

}, 60] call CFUNC(addPerFrameHandler);
