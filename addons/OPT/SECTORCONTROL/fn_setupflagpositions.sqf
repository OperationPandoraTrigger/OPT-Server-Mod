/**
* Description:
* initialize all flag poles
* 
* Author:
* Lord-MDB, form
*
* Arguments:
*
* Return Value:
*
* Server Only:
* No
* 
* Global:
* No
* 
* API:
* No
* 
* Example:
* [] call fnc_setupflagpositions.sqf;

Diese Datei enthält alle Flaggenpositionen. Sie werden durch Auswahl des Angriffssektors der entsprechenden Fraktion zugewiesen.
Jede Flagge besitzt eine X- und Y- Koordinate.
*/

#include "macros.hpp"

private _flags =
[
	[	// Sektor 0
		[],
	],

	[	// Sektor 1
		[1295, 9508],	// 1_1 Bielawa
		[1235, 8955],	// 1_2 Steinbruch
	],

	[	// Sektor 2
		[3846, 11657],	// 2_1 Lukow
		[4100, 10259],	// 2_2 Airfield
	],

	[	// Sektor 3
		[6272, 10919],	// 3_1 Tümpel
		[6264, 10155],	// 3_2 Sabaotka
	],

	[	// Sektor 4
		[7930, 11854],	// 4_1 nördliche Brücke
		[8141, 10848],	// 4_2 Militärkomplex (lang)
	],

	[	// Sektor 5
		[9290, 11173],	// 5_1 Tarnow Nord
		[9515, 10351],	// 5_2 Tarnow Süd
	],

	[	// Sektor 6
		[1799, 7685],	// 6_1 Topolin HBF
		[3439, 8997],	// 6_2 Jantar Hütte
	],

	[	// Sektor 7
		[4194, 9038],	// 7_1 Brückenkampf
		[5158, 9943],	// 7_2 Gliniska
	],

	[	// Sektor 8
		[6524, 9251],	// 8_1 Häusle
		[6429, 8154],	// 8_2 Kaserne Wald
	],

	[	// Sektor 9
		[7801, 10082],	// 9_1 Militärstation
		[8118, 8729],	// 9_2 zerbombtes Zapadlisko
	],

	[	// Sektor 10
		[9804, 8596],	// 10_1 Borek Bahnhof
		[11042, 9021],	// 10_2 Industriegebiet
	],

	[	// Sektor 11
		[1906, 7086],	// 11_1 Topolin Vorort
		[3119, 6790],	// 11_2 Adamow
	],

	[	// Sektor 12
		[4865, 7793],	// 12_1 Olszanka
		[4570, 6396],	// 12_2 Muratyn
	],

	[	// Sektor 13
		[7349, 6466],	// 13_1 Radunin Kirche
		[9056, 6590],	// 13_2 zwischen Baracken
	],

	[	// Sektor 14
		[10320, 6810],	// 14_1 Karlin
		[11864.2, 7399.04],	// 14_2 Ivetow
	],

	[	// Sektor 15
		[890, 5475],	// 15_1 Bagger Zalesie
		[2624, 5453],	// 15_2 Bauernhof
	],

	[	// Sektor 16
		[4688, 5613],	// 16_1 Kirche auf Hügel
		[5618, 3780],	// 16_2 Nadbor Kaserne
	],

	[	// Sektor 17
		[5962, 4077],	// 17_1 Nadbor Zentrum
		[7669, 5316],	// 17_2 Roztoka Übungsgelände	
	],

	[	// Sektor 18
		[9059, 4433],	// 18_1 Die Kreuzung
		[11728, 5015],	// 18_2 Friedhof
	],

	[	// Sektor 19
		[1658, 3690],	// 19_1 Sägewerk
		[2409, 3815],	// 19_2 Luftlandeparadis
	],

	[	// Sektor 20
		[2799, 1620],	// 20_1 Tymbark
	],

	[	// Sektor 21
		[3266, 2138],	// 21_1 Polana
		[5096, 2126],	// 21_2 Swarok Radaranlage
	],

	[	// Sektor 22
		[7364, 2599],	// 22_1 Factory
		[8938, 2049],	// 22_2 Funkturm
	],

	[	// Sektor 23
		[9902, 3788],	// 23_1 Shootingrange
		[10498, 3129],	// 23_2 Zeltplatz
	],

	[	// Sektor 24
		[10219, 2168],	// 24_1 Widok
	],
];


// NATO Flaggen
GVAR(nato_flags_pos) = [];
{
	GVAR(nato_flags_pos) pushBack _x;

	if (isServer) then 
	{
		_x params ["_x", "_y"];

		// Objekt erzeugen
		private _flag = createVehicle ["FlagPole_F", [_x, _y],  [], 0, "CAN_COLLIDE"];
		_flag setVariable ["opt_flag", true, true];
		_flag setVariable ["start_owner", west, true];

		if (GVAR(flagStartNeutral)) then // Nur Fahnenmast ohne Flagge zum Start gewünscht?
		{
			_flag setVariable ["owner", sideUnknown, true];
		}
		else
		{
			_flag setFlagTexture GVAR(westflag);
			_flag setVariable ["owner", west, true];
		};
	};
}
forEach _flags select GVAR(nato_sektor);
publicVariable QGVAR(nato_flags_pos);

//CSAT Flaggen
GVAR(csat_flags_pos) = [];
{
	GVAR(csat_flags_pos) pushBack _x;

	if (isServer) then 
	{
		_x params ["_x", "_y"];

		// Objekt erzeugen
		private _flag = createVehicle ["FlagPole_F", [_x, _y],  [], 0, "CAN_COLLIDE"];
		_flag setVariable ["opt_flag", true, true];
		_flag setVariable ["start_owner", east, true];

		if (GVAR(flagStartNeutral)) then // Nur Fahnenmast ohne Flagge zum Start gewünscht?
		{
			_flag setVariable ["owner", sideUnknown, true];
		}
		else
		{
			_flag setFlagTexture GVAR(eastflag);
			_flag setVariable ["owner", east, true];
		};
	};
}
forEach _flags select GVAR(csat_sektor);
publicVariable QGVAR(csat_flags_pos);

// AAF Flaggen
GVAR(aaf_flags_pos) = [];
{
	GVAR(aaf_flags_pos) pushBack _x;

	if (isServer) then 
	{
		_x params ["_x", "_y"];

		// Objekt erzeugen
		private _flag = createVehicle ["FlagPole_F", [_x, _y],  [], 0, "CAN_COLLIDE"];
		_flag setVariable ["opt_flag", true, true];
		_flag setVariable ["start_owner", independent, true];

		if (GVAR(flagStartNeutral)) then // Nur Fahnenmast ohne Flagge zum Start gewünscht?
		{
			_flag setVariable ["owner", sideUnknown, true];
		}
		else
		{
			_flag setFlagTexture GVAR(independentflag);
			_flag setVariable ["owner", independent, true];
		};
	};
}
forEach _flags select GVAR(aaf_sektor);
publicVariable QGVAR(aaf_flags_pos);
