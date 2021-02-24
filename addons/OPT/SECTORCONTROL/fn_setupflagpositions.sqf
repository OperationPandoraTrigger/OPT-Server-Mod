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

GVAR(nato_flags_pos) = [];
GVAR(csat_flags_pos) = [];
GVAR(aaf_flags_pos) = [];

// Nato flaggen
switch (GVAR(nato_sektor)) do 
{
	case 0: 
	{
	};

	case 1: 
	{
	};

	case 2: 
	{
	};

	case 3: 
	{
	};

	case 4: 
	{
	};

	case 5: 
	{
	};

	case 6: 
	{
	};

	case 7: 
	{
	};

	case 0: 
	{
	};

	case 8: 
	{
	};

	case 9: 
	{
	};

	case 10: 
	{
	};

	case 11: 
	{
	};

	case 12: 
	{
	};

	case 13: 
	{
	};

	case 14: 
	{
	};

	case 15: 
	{
	};

	case 16: 
	{
	};

	case 17: 
	{
	};

	case 18: 
	{
	};

	case 19: 
	{
	};

	case 20: 
	{
	};

	case 21: 
	{
	};

	case 22: 
	{
	};

	case 23: 
	{
	};

	case 24: 
	{
	};

	case 25: 
	{
	};

	case 26: 
	{
	};

	case 27: 
	{
	};

	case 28: 
	{
	};

	case 29: 
	{
	};

	default 
    {
	};
	
};

//CSAT Flaggen
switch (GVAR(csat_sektor)) do 
{
	case 0: 
	{
	};

	case 1: 
	{
		GVAR(csat_flags_pos) pushBack [1295,9508, east,"1_1 Bielawa",true];
		GVAR(csat_flags_pos) pushBack [1235,8955, east,"1_2 Steinbruch",true];
	};

	case 2: 
	{
		GVAR(csat_flags_pos) pushBack [3846,11657, east,"2_1 Lukow",true];
		GVAR(csat_flags_pos) pushBack [4100,10259, east,"2_2 Airfield",true];
	
	};

	case 3: 
	{
		GVAR(csat_flags_pos) pushBack [6272,10919, east,"3_1 Tümpel",true];
		GVAR(csat_flags_pos) pushBack [6264,10155, east,"3_2 Sabaotka",true];
	};

	case 4: 
	{
		GVAR(csat_flags_pos) pushBack [7930,11854, east,"4_1 nördliche Brücke",true];
		GVAR(csat_flags_pos) pushBack [8141,10848, east,"4_2 Militärkomplex (lang)",true];
	};

	case 5: 
	{
		GVAR(csat_flags_pos) pushBack [9290,11173, east,"5_1 Tarnow Nord",true];
		GVAR(csat_flags_pos) pushBack [9515,10351, east,"5_2 Tarnow Süd",true];
	};

	case 6: 
	{
		GVAR(csat_flags_pos) pushBack [1799,7685, east,"6_1 Topolin HBF",true];
		GVAR(csat_flags_pos) pushBack [3439,8997, east,"6_2 Jantar Hütte",true];
	};

	case 7: 
	{
		GVAR(csat_flags_pos) pushBack [4194,9038, east,"7_1 Brückenkampf",true];
		GVAR(csat_flags_pos) pushBack [5158,9943, east,"7_2 Gliniska",true];
	};

	case 8: 
	{
		GVAR(csat_flags_pos) pushBack [6524,9251, east,"8_1 Häusle",true];
		GVAR(csat_flags_pos) pushBack [6429,8154, east,"8_2 Kaserne Wald",true];
	};

	case 9: 
	{
		GVAR(csat_flags_pos) pushBack [7801,10082, east,"9_1 Militärstation",true];
		GVAR(csat_flags_pos) pushBack [8118,8729, east,"9_2 zerbombtes Zapadlisko",true];
	};

	case 10: 
	{
		GVAR(csat_flags_pos) pushBack [9804,8596, east,"10_1 Borek Bahnhof",true];
		GVAR(csat_flags_pos) pushBack [11042,9021, east,"10_2 Industriegebiet",true];
	};

	case 11: 
	{
		GVAR(csat_flags_pos) pushBack [1906,7086, east,"11_1 Topolin Vorort",true];
		GVAR(csat_flags_pos) pushBack [3119,6790, east,"11_2 Adamow",true];
	};

	case 12: 
	{
		GVAR(csat_flags_pos) pushBack [4865,7793, east,"12_1 Olszanka",true];
		GVAR(csat_flags_pos) pushBack [4570,6396, east,"12_2 Muratyn",true];
	};

	case 13: 
	{
		GVAR(csat_flags_pos) pushBack [7349,6466, east,"13_1 Radunin Kirche",true];
		GVAR(csat_flags_pos) pushBack [9056,6590, east,"13_2 zwischen Baracken",true];
	};

	case 14: 
	{
		GVAR(csat_flags_pos) pushBack [10320,6810, east,"14_1 Karlin",true];
		GVAR(csat_flags_pos) pushBack [11864.2,7399.04, east,"14_2 Ivetow",true];
	};

	case 15: 
	{
		GVAR(csat_flags_pos) pushBack [890,5475, east,"15_1 Bagger Zalesie",true];
		GVAR(csat_flags_pos) pushBack [2624,5453, east,"15_2 Bauernhof",true];
	};

	case 16: 
	{
		GVAR(csat_flags_pos) pushBack [4688,5613, east,"16_1 Kirche auf Hügel",true];
		GVAR(csat_flags_pos) pushBack [5618,3780, east,"16_2 Nadbor Kaserne",true];
	};

	case 17: 
	{
		GVAR(csat_flags_pos) pushBack [5962,4077, east,"17_1 Nadbor Zentrum",true];
		GVAR(csat_flags_pos) pushBack [7669,5316, east,"17_2 Roztoka Übungsgelände",true];	
	};

	case 18: 
	{
		GVAR(csat_flags_pos) pushBack [9059,4433, east,"18_1 Die Kreuzung",true];
		GVAR(csat_flags_pos) pushBack [11728,5015, east,"18_2 Friedhof",true];
	};

	case 19: 
	{
		GVAR(csat_flags_pos) pushBack [1658,3690, east,"19_1 Sägewerk",true];
		GVAR(csat_flags_pos) pushBack [2409,3815, east,"19_2 Luftlandeparadis",true];
	};

	case 20: 
	{
		GVAR(csat_flags_pos) pushBack [2799,1620, east,"20_1 Tymbark",true];
	};

	case 21: 
	{
		GVAR(csat_flags_pos) pushBack [3266,2138, east,"21_1 Polana",true];
		GVAR(csat_flags_pos) pushBack [5096,2126, east,"21_2 Swarok Radaranlage",true];
	};

	case 22: 
	{
		GVAR(csat_flags_pos) pushBack [7364,2599, east,"22_1 Factory",true];
		GVAR(csat_flags_pos) pushBack [8938,2049, east,"22_2 Funkturm",true];
	};

	case 23: 
	{
		GVAR(csat_flags_pos) pushBack [9902,3788, east,"23_1 Shootingrange",true];
		GVAR(csat_flags_pos) pushBack [10498,3129, east,"23_2 Zeltplatz",true];
	};

	case 24: 
	{
		GVAR(csat_flags_pos) pushBack [10219,2168, east,"24_1 Widok",true];
	};

	case 25: 
	{	
	};

	case 26: 
	{	
	};

	case 27: 
	{	
	};

	case 28: 
	{
	};

	case 29: 
	{		
	};

	case 30: 
	{
	};

	default 
    {
	};
	
};

// AAF Flaggen
switch (GVAR(aaf_sektor)) do 
{
	case 0: 
	{
	};

	case 1: 
	{
		GVAR(aaf_flags_pos) pushBack [1295,9508, independent,"1_1 Bielawa",true];
		GVAR(aaf_flags_pos) pushBack [1235,8955, independent,"1_2 Steinbruch",true];
	};

	case 2: 
	{
		GVAR(aaf_flags_pos) pushBack [3846,11657, independent,"2_1 Lukow",true];
		GVAR(aaf_flags_pos) pushBack [4100,10259, independent,"2_2 Airfield",true];
	
	};

	case 3: 
	{
		GVAR(aaf_flags_pos) pushBack [6272,10919, independent,"3_1 Tümpel",true];
		GVAR(aaf_flags_pos) pushBack [6264,10155, independent,"3_2 Sabaotka",true];
	};

	case 4: 
	{
		GVAR(aaf_flags_pos) pushBack [7930,11854, independent,"4_1 nördliche Brücke",true];
		GVAR(aaf_flags_pos) pushBack [8141,10848, independent,"4_2 Militärkomplex (lang)",true];
	};

	case 5: 
	{
		GVAR(aaf_flags_pos) pushBack [9290,11173, independent,"5_1 Tarnow Nord",true];
		GVAR(aaf_flags_pos) pushBack [9515,10351, independent,"5_2 Tarnow Süd",true];
	};

	case 6: 
	{
		GVAR(aaf_flags_pos) pushBack [1799,7685, independent,"6_1 Topolin HBF",true];
		GVAR(aaf_flags_pos) pushBack [3439,8997, independent,"6_2 Jantar Hütte",true];
	};

	case 7: 
	{
		GVAR(aaf_flags_pos) pushBack [4194,9038, independent,"7_1 Brückenkampf",true];
		GVAR(aaf_flags_pos) pushBack [5158,9943, independent,"7_2 Gliniska",true];
	};

	case 8: 
	{
		GVAR(aaf_flags_pos) pushBack [6524,9251, independent,"8_1 Häusle",true];
		GVAR(aaf_flags_pos) pushBack [6429,8154, independent,"8_2 Kaserne Wald",true];
	};

	case 9: 
	{
		GVAR(aaf_flags_pos) pushBack [7801,10082, independent,"9_1 Militärstation",true];
		GVAR(aaf_flags_pos) pushBack [8118,8729, independent,"9_2 zerbombtes Zapadlisko",true];
	};

	case 10: 
	{
		GVAR(aaf_flags_pos) pushBack [9804,8596, independent,"10_1 Borek Bahnhof",true];
		GVAR(aaf_flags_pos) pushBack [11042,9021, independent,"10_2 Industriegebiet",true];
	};

	case 11: 
	{
		GVAR(aaf_flags_pos) pushBack [1906,7086, independent,"11_1 Topolin Vorort",true];
		GVAR(aaf_flags_pos) pushBack [3119,6790, independent,"11_2 Adamow",true];
	};

	case 12: 
	{
		GVAR(aaf_flags_pos) pushBack [4865,7793, independent,"12_1 Olszanka",true];
		GVAR(aaf_flags_pos) pushBack [4570,6396, independent,"12_2 Muratyn",true];
	};

	case 13: 
	{
		GVAR(aaf_flags_pos) pushBack [7349,6466, independent,"13_1 Radunin Kirche",true];
		GVAR(aaf_flags_pos) pushBack [9056,6590, independent,"13_2 zwischen Baracken",true];
	};

	case 14: 
	{
		GVAR(aaf_flags_pos) pushBack [10320,6810, independent,"14_1 Karlin",true];
		GVAR(csat_flags_pos) pushBack [11864.2,7399.04, independent,"14_2 Ivetow",true];
	};

	case 15: 
	{
		GVAR(aaf_flags_pos) pushBack [890,5475, independent,"15_1 Bagger Zalesie",true];
		GVAR(aaf_flags_pos) pushBack [2624,5453, independent,"15_2 Bauernhof",true];
	};

	case 16: 
	{
		GVAR(aaf_flags_pos) pushBack [4688,5613, independent,"16_1 Kirche auf Hügel",true];
		GVAR(aaf_flags_pos) pushBack [5618,3780, independent,"16_2 Nadbor Kaserne",true];
	};

	case 17: 
	{
		GVAR(aaf_flags_pos) pushBack [5962,4077, independent,"17_1 Nadbor Zentrum",true];
		GVAR(aaf_flags_pos) pushBack [7669,5316, independent,"17_2 Roztoka Übungsgelände",true];	
	};

	case 18: 
	{
		GVAR(aaf_flags_pos) pushBack [9059,4433, independent,"18_1 Die Kreuzung",true];
		GVAR(aaf_flags_pos) pushBack [11728,5015, independent,"18_2 Friedhof",true];
	};

	case 19: 
	{
		GVAR(aaf_flags_pos) pushBack [1658,3690, independent,"19_1 Sägewerk",true];
		GVAR(aaf_flags_pos) pushBack [2409,3815, independent,"19_2 Luftlandeparadis",true];
	};

	case 20: 
	{
		GVAR(aaf_flags_pos) pushBack [2799,1620, independent,"20_1 Tymbark",true];
	};

	case 21: 
	{
		GVAR(aaf_flags_pos) pushBack [3266,2138, independent,"21_1 Polana",true];
		GVAR(aaf_flags_pos) pushBack [5096,2126, independent,"21_2 Swarok Radaranlage",true];
	};

	case 22: 
	{
		GVAR(aaf_flags_pos) pushBack [7364,2599, independent,"22_1 Factory",true];
		GVAR(aaf_flags_pos) pushBack [8938,2049, independent,"22_2 Funkturm",true];
	};

	case 23: 
	{
		GVAR(aaf_flags_pos) pushBack [9902,3788, independent,"23_1 Shootingrange",true];
		GVAR(aaf_flags_pos) pushBack [10498,3129, independent,"23_2 Zeltplatz",true];
	};

	case 24: 
	{
		GVAR(aaf_flags_pos) pushBack [10219,2168, independent,"24_1 Widok",true];
	};

	case 25: 
	{	
	};

	case 26: 
	{		
	};

	case 27: 
	{	
	};

	case 28: 
	{
	};

	case 29: 
	{
	};

	case 30: 
	{
	};

	default 
    {
	};
	
};

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
