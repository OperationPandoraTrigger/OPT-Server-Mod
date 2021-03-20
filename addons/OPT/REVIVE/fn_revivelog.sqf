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
	["_retter", objNull],
	["_art", 0]	
];

switch (_art) do 
{
	case 1 : 
	{	
		// Log Wiederbelebung
		["Health", "Revive", [getPlayerUID _verletzter, name _verletzter, side _verletzter, getPlayerUID _retter, name _retter, side _retter, _verletzter distance2D _retter]] call OPT_LOGGING_fnc_writelog;
	};

	case 2 : 
	{	
		// Log Stabilisierung
		["Health", "Stabilize", [getPlayerUID _verletzter, name _verletzter, side _verletzter, getPlayerUID _retter, name _retter, side _retter, _verletzter distance2D _retter]] call OPT_LOGGING_fnc_writelog;
	};

	default 
	{
		ERROR_LOG("revivelog: Fehlehalte Datenübergabe _art,Log Modus unbekannt");		
    };
};
