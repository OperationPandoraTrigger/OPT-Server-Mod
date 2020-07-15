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
	[7987,806, east,"000 Kahlstorf Kübis Farm",true]
];

GVAR(aaf_flags_pos) = [
	[7182,1206, independent,"001 Schrecki's Jagdhütte",true] 
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
