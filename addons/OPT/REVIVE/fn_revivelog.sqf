/**
* Description:
* Log Eintragauslösung für die Statistik
* 
* Author:
* Lord-MDB
*
* Arguments:
* 0 <Objekt> Spieler der bewustlos ist und behandelt wird
* 1 <Objekt> Spieler der einen bewustlosen behandelt
* 2 <Number> Logmodus für Statistik
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
*/


#include "macros.hpp"

params 
[
	["_verletzter", objNull],
	["_retter" ,objNull],
	["_art" , 0]	
];

private _name1 = name _verletzter;
private _name2 = name _retter;

switch (_art) do 
{
	case 1 : 
	{	
		private _message = format 
		[
    		"%1 (%2) wurde von %3 (%4) wiederbelebt.", 
   	 		_name1, 
    		side _verletzter,
    		_name2,
			side _retter
		];

		private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
		diag_log format["(%1) Log: %2 --- %3","REVIVE",_timestamp,_message];
	};

	case 2 : 
	{	
		private _message = format 
		[
    		"%1 (%2) wurde von %3 (%4) stabilisiert.", 
   	 		_name1, 
    		side _verletzter,
    		_name2,
			side _retter
		];

		private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
		diag_log format["(%1) Log: %2 --- %3","REVIVE",_timestamp,_message];
	};

	default 
	{
		ERROR_LOG("revivelog: Fehlehalte Datenübergabe _art,Log Modus unbekannt");		
    };

};
