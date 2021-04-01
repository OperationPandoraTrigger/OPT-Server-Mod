/**
* Description:
* initialize and mark all flag positions
* 
* Author:
* form
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

Diese Datei enthält alle Flaggenpositionen. Sie werden später durch Auswahl des Angriffssektors der entsprechenden Fraktion zugewiesen.
Jede Flagge besitzt eine X- und Y- Koordinate, ein Boolean zur Aktivierung sowie einen Namen.
Auf der Karte werden noch vor Missionsstart die MineZoneMarkers eingezeichnet (später aber wieder gelöscht und nur durch die Aktiven Fahnen ersetzt).
*/

#include "macros.hpp"

GVAR(AllFlags) =
[
    [    // Sektor 0
    ],

    [    // Sektor 1
        [1295, 9508, true, "1_1 Bielawa"],
        [1235, 8955, true, "1_2 Steinbruch"]
    ],

    [    // Sektor 2
        [3846, 11657, true, "2_1 Lukow"],
        [4100, 10259, true, "2_2 Airfield"]
    ],

    [    // Sektor 3
        [6272, 10919, true, "3_1 Tümpel"],
        [6264, 10155, true, "3_2 Sabaotka"]
    ],

    [    // Sektor 4
        [7930, 11854, true, "4_1 nördliche Brücke"],
        [8141, 10848, true, "4_2 Militärkomplex (lang)"]
    ],

    [    // Sektor 5
        [9290, 11173, true, "5_1 Tarnow Nord"],
        [9515, 10351, true, "5_2 Tarnow Süd"]
    ],

    [    // Sektor 6
        [1799, 7685, true, "6_1 Topolin HBF"],
        [3439, 8997, true, "6_2 Jantar Hütte"]
    ],

    [    // Sektor 7
        [4194, 9038, true, "7_1 Brückenkampf"],
        [5158, 9943, true, "7_2 Gliniska"]
    ],

    [    // Sektor 8
        [6524, 9251, true, "8_1 Häusle"],
        [6429, 8154, true, "8_2 Kaserne Wald"]
    ],

    [    // Sektor 9
        [7801, 10082, true, "9_1 Militärstation"],
        [8118, 8729, true, "9_2 zerbombtes Zapadlisko"]
    ],

    [    // Sektor 10
        [9804, 8596, true, "10_1 Borek Bahnhof"],
        [11042, 9021, true, "10_2 Industriegebiet"]
    ],

    [    // Sektor 11
        [1906, 7086, true, "11_1 Topolin Vorort"],
        [3119, 6790, true, "11_2 Adamow"]
    ],

    [    // Sektor 12
        [4865, 7793, true, "12_1 Olszanka"],
        [4570, 6396, true, "12_2 Muratyn"]
    ],

    [    // Sektor 13
        [7349, 6466, true, "13_1 Radunin Kirche"],
        [9056, 6590, true, "13_2 zwischen Baracken"]
    ],

    [    // Sektor 14
        [10320, 6810, true, "14_1 Karlin"],
        [11864.2, 7399.04, true, "14_2 Ivetow"]
    ],

    [    // Sektor 15
        [890, 5475, true, "15_1 Bagger Zalesie"],
        [2624, 5453, true, "15_2 Bauernhof"]
    ],

    [    // Sektor 16
        [4688, 5613, true, "16_1 Kirche auf Hügel"],
        [5618, 3780, true, "16_2 Nadbor Kaserne"]
    ],

    [    // Sektor 17
        [5962, 4077, true, "17_1 Nadbor Zentrum"],
        [7669, 5316, true, "17_2 Roztoka Übungsgelände"]
    ],

    [    // Sektor 18
        [9059, 4433, true, "18_1 Die Kreuzung"],
        [11728, 5015, true, "18_2 Friedhof"]
    ],

    [    // Sektor 19
        [1658, 3690, true, "19_1 Sägewerk"],
        [2409, 3815, true, "19_2 Luftlandeparadis"]
    ],

    [    // Sektor 20
        [2799, 1620, true, "20_1 Tymbark"]
    ],

    [    // Sektor 21
        [3266, 2138, true, "21_1 Polana"],
        [5096, 2126, true, "21_2 Swarok Radaranlage"]
    ],

    [    // Sektor 22
        [7364, 2599, true, "22_1 Factory"],
        [8938, 2049, true, "22_2 Funkturm"]
    ],

    [    // Sektor 23
        [9902, 3788, true, "23_1 Shootingrange"],
        [10498, 3129, true, "23_2 Zeltplatz"]
    ],

    [    // Sektor 24
        [10219, 2168, true, "24_1 Widok"]
    ]
];
publicVariable QGVAR(AllFlags);

// Create MineZoneMarker for all possible flags (will be deleted after Waffenruhe)
GVAR(PreMineZoneMarkers) = [];
if (isServer && GVAR(flagFreeMineZoneMarkerOn)) then 
{
    {
        {
            _x params ["_posX", "_posY", "_aktiv", "_name"];
            if (_aktiv) then
            {
                private _markerName = format["PreMineZoneMarker_%1_%2", _posX, _posY];
                private _marker = createMarker [_markerName, [_posX, _posY]];
                GVAR(PreMineZoneMarkers) pushBack _marker;
                _marker setMarkerShape "ELLIPSE";
                _marker setMarkerBrush "Solid";
                _marker setMarkerColor "ColorRed";
                _marker setMarkerAlpha 0.5;
                _marker setMarkerSize [GVAR(flagFreeMineZoneRadius), GVAR(flagFreeMineZoneRadius)];
            };
        } forEach _x; // all flags
    } forEach GVAR(AllFlags); // all sectors
};
publicVariable QGVAR(PreMineZoneMarkers);
