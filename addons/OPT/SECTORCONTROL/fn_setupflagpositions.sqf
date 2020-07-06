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
west -> Angriffsziel für CSAT
east -> Angriffsziel für NATO
*/

#include "macros.hpp"

GVAR(nato_flags_pos) = [
	[11663,2696, west,"092 - Lijn- Hafen",true],
	[10382,2656, west,"093 - Blerick",true],
	[12250,1849, west,"124 - Taga",true]  
];

GVAR(csat_flags_pos) = [
	[11355,4204, east,"012 - Checkpoint Papa Tango",true],
	[12487,3997, east,"050 - Forest Clearing",true],
	[13248,2930, east,"110 - Bua Bua",true]
];

GVAR(aaf_flags_pos) = [
	[11663,2696, independent,"092 - Lijn- Hafen",true],
	[10382,2656, independent,"093 - Blerick",true],
	[12250,1849, independent,"124 - Taga",true]  
];


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

			if (OPT_sectorcontrol_flagStartNeutral) then // Nur Fahnenmast ohne Flagge zum Start gewünscht?
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

			if (OPT_sectorcontrol_flagStartNeutral) then // Nur Fahnenmast ohne Flagge zum Start gewünscht?
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

			if (OPT_sectorcontrol_flagStartNeutral) then // Nur Fahnenmast ohne Flagge zum Start gewünscht?
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
