/**
* Description:
* initialize all flag poles with optionall marker and add action menu for playersNumber
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
* [] call fnc_setupflagpositions.sqf;
*/

/*
Diese Datei enthält alle Flaggenpositionen aufgeteilt in NATO und CSAT.
Jede Flagge besitzt Koordinaten (x,y) sowie die owner Seite, die im Besitz der Flagge ist.
Demnach muss nach jeder Schlacht nur der owner angepasst werden.

NATO vs CSAT
west -> Angriffsziel für CSAT
east -> Angriffsziel für NATO

AAF vs CSAT
independent -> Angriffsziel für CSAT
east -> Angriffsziel für AAF

Nato vs AAF
independent -> Angriffsziel für Nato
west -> Angriffsziel für AAF
*/

#include "macros.hpp"

GVAR(nato_flags_pos) = [
];

GVAR(csat_flags_pos) = [
	
	[5396,11810, east,"7.1 Teich am Waldrand Oetzendorf",false],
	[7482,10365, east,"7.2 Industriepark Oetzen",true],

	[7265,8819, east,"13.1 Tischlerei Stocken",false],
	[7556,9295, east,"13.2 Bei der Feuerwehr Stocken",false]  
];

GVAR(aaf_flags_pos) = [

	[8884,7698, independent,"20.1 Wollproduktion Järlitz",false],
	[10277,6931, independent,"20.2 Hohes Holz",false],

	[3911,2601, independent,"23.1 Bauernhof Kaminski",false],
	[6758,3573, independent,"23.2 Siedlung Hanstedt",true]
];

publicVariable QGVAR(nato_flags_pos);
publicVariable QGVAR(csat_flags_pos);
publicVariable QGVAR(aaf_flags_pos);

// erzeuge für alle oben gelisteten Positionen einen Flaggenmast mit korrekter Flagge vom Server aus.

if (isServer) then 
{
	{
		_x params ["_x", "_y", "_owner", "_name", "_aktiv"];
		
		if (_aktiv) then
		{
			// Objekt erzeugen
			private _flag = createVehicle ["FlagPole_F", [_x, _y],  [], 0, "CAN_COLLIDE"];
			_flag setVariable ["opt_flag", true, true];
			_flag setVariable ["start_owner", _owner, true];

			if (GVAR(flagStartNeutral)) then // Nur Fahnenmast ohne Flagge zum Start gewünscht?
			{
				_flag setVariable ["owner", sideUnknown, true];
			}
			else
			{
				_flag setFlagTexture GVAR(westflag);
				_flag setVariable ["owner", _owner, true];
			};
		};
		
	} forEach GVAR(nato_flags_pos);

	{
		_x params ["_x", "_y", "_owner", "_name", "_aktiv"];
		
		if (_aktiv) then
		{
			// Objekt erzeugen
			private _flag = createVehicle ["FlagPole_F", [_x, _y],  [], 0, "CAN_COLLIDE"];
			_flag setVariable ["opt_flag", true, true];
			_flag setVariable ["start_owner", _owner, true];

			if (GVAR(flagStartNeutral)) then // Nur Fahnenmast ohne Flagge zum Start gewünscht?
			{
				_flag setVariable ["owner", sideUnknown, true];
			}
			else
			{
				_flag setFlagTexture GVAR(eastflag);
				_flag setVariable ["owner", _owner, true];
			};
		};
	} forEach GVAR(csat_flags_pos);
	
	{
		_x params ["_x", "_y", "_owner", "_name", "_aktiv"];
		
		if (_aktiv) then
		{
			// Objekt erzeugen
			private _flag = createVehicle ["FlagPole_F", [_x, _y],  [], 0, "CAN_COLLIDE"];
			_flag setVariable ["opt_flag", true, true];
			_flag setVariable ["start_owner", _owner, true];

			if (GVAR(flagStartNeutral)) then // Nur Fahnenmast ohne Flagge zum Start gewünscht?
			{
				_flag setVariable ["owner", sideUnknown, true];
			}
			else
			{
				_flag setFlagTexture GVAR(independentflag);
				_flag setVariable ["owner", _owner, true];
			};
		};
		
	} forEach GVAR(aaf_flags_pos);
};
