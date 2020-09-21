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
	};

	case 2: 
	{
		GVAR(csat_flags_pos) pushBack [5637,13038, east,"2.1 Ferienbauernhof Oetzendorf",true];
		GVAR(csat_flags_pos) pushBack [6941,14538, east,"2.2 Höver Tierschutzhof",true];		
	};

	case 3: 
	{
		GVAR(csat_flags_pos) pushBack [9127,14842, east,"3.1 Weste Hexenplatz",true];
		GVAR(csat_flags_pos) pushBack [10191,13361, east,"3.2 Testorfer Doppelbuche",true];		
	};

	case 4: 
	{	
	};

	case 5: 
	{
		GVAR(csat_flags_pos) pushBack [1992,11734, east,"5.1 Heitbracker Kartoffelhof",true];
		GVAR(csat_flags_pos) pushBack [707,11322, east,"5.2 Walmstorfer Bergsiedlung",true];		
	};

	case 6: 
	{
		GVAR(csat_flags_pos) pushBack [5749,10582, east,"6.1 Absunder Checkpoint",true];
		GVAR(csat_flags_pos) pushBack [4423,9712, east,"6.2 Landgasthaus Masendorf",true];		
	};

	case 7: 
	{
		GVAR(csat_flags_pos) pushBack [5396,11810, east,"7.1 Teich am Waldrand Oetzendorf",true];
		GVAR(csat_flags_pos) pushBack [7482,10365, east,"7.2 Industriepark Oetzen",true];		
	};

	case 8: 
	{
		GVAR(csat_flags_pos) pushBack [10845,11535, east,"8.1 Katenhof am Steinberg",true];
		GVAR(csat_flags_pos) pushBack [8239,11776, east,"8.2 Oetzen Silos",true];		
	};

	case 9: 
	{
		GVAR(csat_flags_pos) pushBack [12159,11664, east,"9.1 Alte Sandgrube",true];
		GVAR(csat_flags_pos) pushBack [14087,11422, east,"9.2 Barvy's Jugendclub",true];		
	};

	case 10: 
	{
		GVAR(csat_flags_pos) pushBack [806,7258, east,"10.1 Ripdorfer Hof",true];
		GVAR(csat_flags_pos) pushBack [2417,9334, east,"10.2 Martha's Bioladen",true];		
	};

	case 11: 
	{
		GVAR(csat_flags_pos) pushBack [2950,9185, east,"11.1 Grundschule Molzen",true];
		GVAR(csat_flags_pos) pushBack [3021,7072, east,"11.2 Paintball Woltersburg ",true];		
	};

	case 12: 
	{
		GVAR(csat_flags_pos) pushBack [5558,8276, east,"12.1 Kriegsdenkmal Riestedt",true];
		GVAR(csat_flags_pos) pushBack [6026,8079, east,"12.2 Riestedter Ferienwohnungen",true];		
	};

	case 13: 
	{
		GVAR(csat_flags_pos) pushBack [7265,8819, east,"13.1 Tischlerei Stocken",true];
		GVAR(csat_flags_pos) pushBack [7556,9295, east,"13.2 Bei der Feuerwehr Stocken",true];	
	};

	case 14: 
	{
		GVAR(csat_flags_pos) pushBack [9543,8798, east,"14.1 Baum- und Gartenpflege Nielsen",true];
		GVAR(csat_flags_pos) pushBack [9037,9838, east,"14.2 Suttorfer Beschichtungen",true];		
	};

	case 15: 
	{
		GVAR(csat_flags_pos) pushBack [9796,10606, east,"15.1 Schreinerei Dörmte",true];
		GVAR(csat_flags_pos) pushBack [10906,9764, east,"15.2 Neumühler Hundeschule",true];		
	};

	case 16: 
	{
		GVAR(csat_flags_pos) pushBack [13550,9605, east,"16.1 Entsorgungsunternehmen Borg",true];
		GVAR(csat_flags_pos) pushBack [13130,8444, east,"16.2 Bioforschungslabor Katzien",true];		
	};

	case 17: 
	{
		GVAR(csat_flags_pos) pushBack [1557,5432, east,"17.1 Junky's Junkyard",true];
		GVAR(csat_flags_pos) pushBack [2563,5296, east,"17.2 Agrargemeinschaft Uelzen",true];		
	};

	case 18: 
	{
		GVAR(csat_flags_pos) pushBack [3727,6530, east,"18.1 Biorinderzucht Pieperhöfen",true];
		GVAR(csat_flags_pos) pushBack [4244,4996, east,"18.2 Modellflugplatz Tatern",true];		
	};

	case 19: 
	{
		GVAR(csat_flags_pos) pushBack [7245,5622, east,"19.1 Seilerei Mikkel Rätzlingen",true];
		GVAR(csat_flags_pos) pushBack [7997,5873, east,"19.2 TV Rätzlingen",true];		
	};

	case 20: 
	{
		GVAR(csat_flags_pos) pushBack [8884,7698, east,"20.1 Wollproduktion Järlitz",true];
		GVAR(csat_flags_pos) pushBack [10277,6931, east,"20.2 Hohes Holz",true];
	};

	case 21: 
	{
		GVAR(csat_flags_pos) pushBack [12887,6564, east,"21.1 Schlademann Kies- und Baggerbetrieb Rosche",true];
		GVAR(csat_flags_pos) pushBack [12238,6873, east,"21.2 Hauptfriedhof Rosche",true];		
	};

	case 22: 
	{
		GVAR(csat_flags_pos) pushBack [2886,3566, east,"22.1 Sven's Fahrradverleih Groß Liedern",true];
		GVAR(csat_flags_pos) pushBack [2967,4577, east,"22.2 Westernhof Liedern",true];		
	};

	case 23: 
	{
		GVAR(csat_flags_pos) pushBack [3911,2601, east,"23.1 Bauernhof Kaminski",true];
		GVAR(csat_flags_pos) pushBack [6758,3573, east,"23.2 Siedlung Hanstedt",true];
	};

	case 24: 
	{
		GVAR(csat_flags_pos) pushBack [6654,5245, east,"24.1 Alte Lehrwerkstatt",true];
		GVAR(csat_flags_pos) pushBack [8320,3630, east,"24.2 Geheime Protomolekülforschungseinrichtung",true];		
	};

	case 25: 
	{
		GVAR(csat_flags_pos) pushBack [9973,5387, east,"25.1 Am Funkmast Klein Malchau",true];
		GVAR(csat_flags_pos) pushBack [10363,2441, east,"25.2 Eisfabrik Wellendorf",true];		
	};

	case 26: 
	{
		GVAR(csat_flags_pos) pushBack [14858,5866, east,"26.1 Uhrmacher Tannhaus Teyendorf",true];
		GVAR(csat_flags_pos) pushBack [13152,3236, east,"26.2 Saatgut Batensen",true];		
	};

	case 27: 
	{	
	};

	case 28: 
	{
		GVAR(csat_flags_pos) pushBack [5277,572, east,"28.1 Bio-Feinkostladen Lehmke",true];
		GVAR(csat_flags_pos) pushBack [6481,1123, east,"28.2 Pilzwald",true];		
	};

	case 29: 
	{
		GVAR(csat_flags_pos) pushBack [7986,808, east,"29.1 Zwischen den Rüben Kahlstorf",true];
		GVAR(csat_flags_pos) pushBack [9135,868, east,"29.2 Am Einsiedler Klein Pretzier",true];		
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
	};

	case 2: 
	{
		GVAR(aaf_flags_pos) pushBack [5637,13038, independent,"2.1 Ferienbauernhof Oetzendorf",true];
		GVAR(aaf_flags_pos) pushBack [6941,14538, independent,"2.2 Höver Tierschutzhof",true];		
	};

	case 3: 
	{
		GVAR(aaf_flags_pos) pushBack [9127,14842, independent,"3.1 Weste Hexenplatz",true];
		GVAR(aaf_flags_pos) pushBack [10191,13361, independent,"3.2 Testorfer Doppelbuche",true];		
	};

	case 4: 
	{	
	};

	case 5: 
	{
		GVAR(aaf_flags_pos) pushBack [1992,11734, independent,"5.1 Heitbracker Kartoffelhof",true];
		GVAR(aaf_flags_pos) pushBack [707,11322, independent,"5.2 Walmstorfer Bergsiedlung",true];		
	};

	case 6: 
	{
		GVAR(aaf_flags_pos) pushBack [5749,10582, independent,"6.1 Absunder Checkpoint",true];
		GVAR(aaf_flags_pos) pushBack [4423,9712, independent,"6.2 Landgasthaus Masendorf",true];		
	};

	case 7: 
	{
		GVAR(aaf_flags_pos) pushBack [5396,11810, independent,"7.1 Teich am Waldrand Oetzendorf",true];
		GVAR(aaf_flags_pos) pushBack [7482,10365, independent,"7.2 Industriepark Oetzen",true];		
	};

	case 8: 
	{
		GVAR(aaf_flags_pos) pushBack [10845,11535, independent,"8.1 Katenhof am Steinberg",true];
		GVAR(aaf_flags_pos) pushBack [8239,11776, independent,"8.2 Oetzen Silos",true];		
	};

	case 9: 
	{
		GVAR(aaf_flags_pos) pushBack [12159,11664, independent,"9.1 Alte Sandgrube",true];
		GVAR(aaf_flags_pos) pushBack [14087,11422, independent,"9.2 Barvy's Jugendclub",true];		
	};

	case 10: 
	{
		GVAR(aaf_flags_pos) pushBack [806,7258, independent,"10.1 Ripdorfer Hof",true];
		GVAR(aaf_flags_pos) pushBack [2417,9334, independent,"10.2 Martha's Bioladen",true];		
	};

	case 11: 
	{
		GVAR(aaf_flags_pos) pushBack [2950,9185, independent,"11.1 Grundschule Molzen",true];
		GVAR(aaf_flags_pos) pushBack [3021,7072, independent,"11.2 Paintball Woltersburg ",true];		
	};

	case 12: 
	{
		GVAR(aaf_flags_pos) pushBack [5558,8276, independent,"12.1 Kriegsdenkmal Riestedt",true];
		GVAR(aaf_flags_pos) pushBack [6026,8079, independent,"12.2 Riestedter Ferienwohnungen",true];		
	};

	case 13: 
	{
		GVAR(aaf_flags_pos) pushBack [7265,8819, independent,"13.1 Tischlerei Stocken",true];
		GVAR(aaf_flags_pos) pushBack [7556,9295, independent,"13.2 Bei der Feuerwehr Stocken",true];	
	};

	case 14: 
	{
		GVAR(aaf_flags_pos) pushBack [9543,8798, independent,"14.1 Baum- und Gartenpflege Nielsen",true];
		GVAR(aaf_flags_pos) pushBack [9037,9838, independent,"14.2 Suttorfer Beschichtungen",true];		
	};

	case 15: 
	{
		GVAR(aaf_flags_pos) pushBack [9796,10606, independent,"15.1 Schreinerei Dörmte",true];
		GVAR(aaf_flags_pos) pushBack [10906,9764, independent,"15.2 Neumühler Hundeschule",true];		
	};

	case 16: 
	{
		GVAR(aaf_flags_pos) pushBack [13550,9605, independent,"16.1 Entsorgungsunternehmen Borg",true];
		GVAR(aaf_flags_pos) pushBack [13130,8444, independent,"16.2 Bioforschungslabor Katzien",true];		
	};

	case 17: 
	{
		GVAR(aaf_flags_pos) pushBack [1557,5432, independent,"17.1 Junky's Junkyard",true];
		GVAR(aaf_flags_pos) pushBack [2563,5296, independent,"17.2 Agrargemeinschaft Uelzen",true];		
	};

	case 18: 
	{
		GVAR(aaf_flags_pos) pushBack [3727,6530, independent,"18.1 Biorinderzucht Pieperhöfen",true];
		GVAR(aaf_flags_pos) pushBack [4244,4996, independent,"18.2 Modellflugplatz Tatern",true];		
	};

	case 19: 
	{
		GVAR(aaf_flags_pos) pushBack [7245,5622, independent,"19.1 Seilerei Mikkel Rätzlingen",true];
		GVAR(aaf_flags_pos) pushBack [7997,5873, independent,"19.2 TV Rätzlingen",true];		
	};

	case 20: 
	{
		GVAR(aaf_flags_pos) pushBack [8884,7698, independent,"20.1 Wollproduktion Järlitz",true];
		GVAR(aaf_flags_pos) pushBack [10277,6931, independent,"20.2 Hohes Holz",true];
	};

	case 21: 
	{
		GVAR(aaf_flags_pos) pushBack [12887,6564, independent,"21.1 Schlademann Kies- und Baggerbetrieb Rosche",true];
		GVAR(aaf_flags_pos) pushBack [12238,6873, independent,"21.2 Hauptfriedhof Rosche",true];		
	};

	case 22: 
	{
		GVAR(aaf_flags_pos) pushBack [2886,3566, independent,"22.1 Sven's Fahrradverleih Groß Liedern",true];
		GVAR(aaf_flags_pos) pushBack [2967,4577, independent,"22.2 Westernhof Liedern",true];		
	};

	case 23: 
	{
		GVAR(aaf_flags_pos) pushBack [3911,2601, independent,"23.1 Bauernhof Kaminski",true];
		GVAR(aaf_flags_pos) pushBack [6758,3573, independent,"23.2 Siedlung Hanstedt",true];
	};

	case 24: 
	{
		GVAR(aaf_flags_pos) pushBack [6654,5245, independent,"24.1 Alte Lehrwerkstatt",true];
		GVAR(aaf_flags_pos) pushBack [8320,3630, independent,"24.2 Geheime Protomolekülforschungseinrichtung",true];		
	};

	case 25: 
	{
		GVAR(aaf_flags_pos) pushBack [9973,5387, independent,"25.1 Am Funkmast Klein Malchau",true];
		GVAR(aaf_flags_pos) pushBack [10363,2441, independent,"25.2 Eisfabrik Wellendorf",true];		
	};

	case 26: 
	{
		GVAR(aaf_flags_pos) pushBack [14858,5866, independent,"26.1 Uhrmacher Tannhaus Teyendorf",true];
		GVAR(aaf_flags_pos) pushBack [13152,3236, independent,"26.2 Saatgut Batensen",true];		
	};

	case 27: 
	{	
	};

	case 28: 
	{
		GVAR(aaf_flags_pos) pushBack [5277,572, independent,"28.1 Bio-Feinkostladen Lehmke",true];
		GVAR(aaf_flags_pos) pushBack [6481,1123, independent,"28.2 Pilzwald",true];		
	};

	case 29: 
	{
		GVAR(aaf_flags_pos) pushBack [7986,808, independent,"29.1 Zwischen den Rüben Kahlstorf",true];
		GVAR(aaf_flags_pos) pushBack [9135,868, independent,"29.2 Am Einsiedler Klein Pretzier",true];		
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
