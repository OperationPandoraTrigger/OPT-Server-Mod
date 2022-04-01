/**
* Description:
* initialize and mark all sector, flag and beam positions
*
* Author:
* form
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
* [] call fnc_setupsectors.sqf;

Diese Datei enthält alle Sektoren-, Flaggen- sowie Beam-Positionen. Die Flaggenpositionen werden später durch Auswahl des Angriffssektors der entsprechenden Fraktion zugewiesen.
Jede Flagge hat eine 3D-Koordinate - Kopiert aus dem EDEN-Editor über "Log -> Log position to clipboard" - Die Z-Koordinate ist meistens 0, muss es aber nicht sein.
Auf der Karte werden noch vor Missionsstart die MineZoneMarkers sowie die Sektoren eingezeichnet (später aber wieder gelöscht und nur durch die Aktiven Fahnen ersetzt).
*/

#include "macros.hpp"

GVAR(AllSectors) = [];

if (worldName == "cup_chernarus_A3") then
{
    GVAR(AllSectors) =
    [
        [    // Sektor 0
            [   // Sektormarker
            ],

            [   // Flaggen-Positionen
                [8535,6648,0]   // TC2
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 1
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [3495,13074,0],
                [2838,12382,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 2
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [6586,14500,0],
                [3485,14756,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 3
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [8169,12726,0],
                [7946,14630,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 4
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [8655,13358,0],
                [9569,13674,0],
                [9277,13473,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 5
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [11589,14706,0],
                [10283,14151,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 6
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [12107,13531,0],
                [13941,13404,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 7
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [13323,11630,0],
                [11858,12445,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 8
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [11121,12295,0],
                [11455,11346,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 9
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [12870,10110,0],
                [12831,9971,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 10
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [11933,9094,0],
                [11970,9069,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 11
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [11455,7503,0],
                [10680,8055,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 12
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [13125,7081,0],
                [13294,6113,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 13
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [13224,5426,0],
                [12224,6266,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 14
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [13314,3238,0],
                [12082,3581,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 15
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [10126,1909,0],
                [10520,2235,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 16
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [6755,2525,0],
                [7215,3024,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 17
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [4060,3320,0],
                [4558,4513,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 18
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [2769,5295,0],
                [2470,5242,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 19
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [1329,4102,0],
                [460,5162,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 20
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [1108,6620,0],
                [1025,7630,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 21
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [3036,7859,0],
                [2171,7923,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 22
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [2720,9961,0],
                [2529,10967,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 23
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [1409,9220,0],
                [298,9396,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 24
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [530,11071,0],
                [2006,11293,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 25
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [4126,11758,0],
                [4117,11158,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 26
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [4900,12114,0],
                [4914,13027,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 27
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [6914,11398,0],
                [6816,12207,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 28
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [8538,11978,0],
                [8167,10957,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 29
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [10213,12000,0],
                [10804,12864,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 30
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [10417,9859,0],
                [9658,10437,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 31
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [9407,8837,0],
                [8112,9307,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 32
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [8737,7101,0],
                [8395,7342,0],
                [9638,6552,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 33
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [8424,6668,0],
                [8350,5983,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 34
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [10124,5491,0],
                [11194,6571,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 35
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [11295,5470,0],
                [11247,4286,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 36
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [10240,3614,0],
                [9219,3925,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 37
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [6602,5567,0],
                [6555,6092,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 38
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [4448,6459,0],
                [3691,5998,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 39
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [5378,8524,0],
                [3801,8848,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 40
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [4618,9664,0],
                [4753,10356,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 41
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [5975,10322,0],
                [6741,10705,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 42
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
                [7089,7674,0],
                [6094,7738,0],
                [6566,9235,0]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 43 - NATO Main-Base unten links
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 44 - CSAT Main-Base oben links
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 45 - NATO Sekundär-Base oben rechts
            [   // Sektormarker

            ],

            [   // Flaggen-Positionen
            ],

            [   // Beam-Positionen
            ]
        ]
    ]; // letztes Komma löschen!!
};

publicVariable QGVAR(AllSectors);

// Create MineZoneMarker for all possible flags (will be deleted after Waffenruhe)
GVAR(PreMineZoneMarkers) = [];
private _PreMineZoneMarkerID = 0;
if (isServer && GVAR(flagFreeMineZoneMarkerOn)) then
{
    {
        {
            _PreMineZoneMarkerID = _PreMineZoneMarkerID + 1;
            private _markerName = format["PreMineZoneMarker_%1", _PreMineZoneMarkerID];
            private _marker = createMarkerLocal [_markerName, _x];
            GVAR(PreMineZoneMarkers) pushBack _marker;
            _marker setMarkerShapeLocal "ELLIPSE";
            _marker setMarkerBrushLocal "Solid";
            _marker setMarkerColorLocal "ColorRed";
            _marker setMarkerAlphaLocal 0.5;
            _marker setMarkerSize [GVAR(flagFreeMineZoneRadius), GVAR(flagFreeMineZoneRadius)];
        } forEach (_x select 1); // all flags
    } forEach GVAR(AllSectors); // all sectors
};
publicVariable QGVAR(PreMineZoneMarkers);

// Sector-Markers
GVAR(NATOSectorMarkers) = [];
GVAR(CSATSectorMarkers) = [];
GVAR(BorderMarkers) = [];
private _markerID = 0;

// CBA-Settings parsen, da dies sonst erst nach dem "Durchdrücken" geschieht
GVAR(nato_allsectors) = parseSimpleArray format ["[%1]", GVAR(nato_allsectors_str)];
GVAR(csat_allsectors) = parseSimpleArray format ["[%1]", GVAR(csat_allsectors_str)];

// Sektormarker zeichnen
{
    {
        _markerID = _markerID + 1;
        private _markername = format ["SectorMarker_%1", _markerID];
        [_x, "ColorBlack", 8, _markername] call FUNC(drawline);
        GVAR(NATOSectorMarkers) pushBack _markername;
    } forEach ((GVAR(AllSectors) select _x) select 0);
} forEach GVAR(nato_allsectors);

{
    {
        _markerID = _markerID + 1;
        private _markername = format ["SectorMarker_%1", _markerID];
        [_x, "ColorBlack", 8, _markername] call FUNC(drawline);
        GVAR(CSATSectorMarkers) pushBack _markername;
    } forEach ((GVAR(AllSectors) select _x) select 0);
} forEach GVAR(csat_allsectors);

// Grenzlinien
// Wenn sich zwei feindliche Sektormarker-Linien sehr nah sind -> Grenzlinie dazwischen zeichnen
{
    private _pos1 = getMarkerPos _x;
    {
        private _pos2 = getMarkerPos _x;
        if ((_pos1 distance2D _pos2) < 50) then
        {
            private _grenzlinie = (_pos1 vectorAdd _pos2) vectorMultiply 0.5;   // Position zwischen den beiden betroffenen Markern
            _markerID = _markerID + 1;
            private _markername = format ["BorderMarker_%1", _markerID];
            GVAR(BorderMarkers) pushBack _markername;

            private _mrk = createMarkerLocal [_markername, _grenzlinie];
            _mrk setMarkerDirLocal markerDir _x;
            _mrk setMarkerShapeLocal "RECTANGLE";
            _mrk setMarkerBrushLocal "SolidFull";
            _mrk setMarkerColorLocal "ColorRed";
            _mrk setMarkerSize [10, (markerSize _x) select 1];   // Letzter Markerbefehl nicht-local (für serverweiten Broadcast)
        };
    } forEach GVAR(CSATSectorMarkers)
} forEach GVAR(NATOSectorMarkers);

// Karten Umrandung
//private _worldsize = (worldName call BIS_fnc_mapSize);
//[[[0, _worldsize], [_worldsize, _worldsize]], "ColorRed", 24, "MapBorder1"] call FUNC(drawline);
//[[[_worldsize, _worldsize], [_worldsize, 0]], "ColorRed", 24, "MapBorder2"] call FUNC(drawline);
//[[[_worldsize, 0], [0, 0]], "ColorRed", 24, "MapBorder3"] call FUNC(drawline);
//[[[0, 0], [0, _worldsize]], "ColorRed", 24, "MapBorder4"] call FUNC(drawline);

// Karten Umrandung
[[[0, worldSize], [worldSize, worldSize]], "ColorRed", 24, "MapBorder1"] call FUNC(drawline);
[[[worldSize, worldSize], [worldSize, 0]], "ColorRed", 24, "MapBorder2"] call FUNC(drawline);
[[[worldSize, 0], [0, 0]], "ColorRed", 24, "MapBorder3"] call FUNC(drawline);
[[[0, 0], [0, worldSize]], "ColorRed", 24, "MapBorder4"] call FUNC(drawline);
