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

// leeres Template
GVAR(AllSectors) =
[
    [    // Sektor 0
        [   // Sektormarker
        ],

        [   // Flaggen-Positionen
        ],

        [   // Beam-Positionen
        ],

        [   // Sektor-Dreiecke
        ],

        [   // Sektormarker-Position
        ]
    ]
];

// Lythium
if (worldName == "altis") then
{
    GVAR(AllSectors) =
    [
        [    // Sektor 0
            [   // Sektormarker
            ],

            [   // Flaggen-Positionen
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
            ],

            [   // Sektormarker-Position
            ]
        ],
        [    // Sektor 1
            [   // Sektormarker
            ],

            [   // Flaggen-Positionen
                [18619.7, 16773.2, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
            ],

            [   // Sektormarker-Position
            ]
        ],
        [    // Sektor 2
            [   // Sektormarker
            ],

            [   // Flaggen-Positionen
                [18878.7, 16558.6, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
            ],

            [   // Sektormarker-Position
            ]
        ]
    ];
};

// Lythium
if (worldName == "lythium") then
{
    GVAR(AllSectors) =
    [
        [    // Sektor 0
            [   // Sektormarker
            ],

            [   // Flaggen-Positionen
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
            ],

            [   // Sektormarker-Position
            ]
        ],

        [    // Sektor 1
            [   // Sektormarker
            ],

            [   // Flaggen-Positionen
                [17917, 17885, 0],
                [19523, 18697, 0],
                [19852, 19876, 0],
                [17412, 14800, 0],
                [17621, 17401, 0],
                [16457, 15164, 0],
                [16457, 15164, 0],
                [17673, 9282, 0],
                [16095, 10300, 0],
                [16047, 19996, 0],
                [16274, 19531, 0],
                [15067, 19151, 0],
                [14291, 16015, 0],
                [15139, 14937, 0],
                [14815, 14739, 0],
                [15657, 7367, 0],
                [13755, 9326, 0],
                [15249, 9919, 0],
                [3990, 12566, 0],
                [4121, 12036, 0],
                [4973, 11829, 0],
                [6766, 9836, 0],
                [5197, 10342, 0],
                [5239, 10770, 0],
                [7092, 4416, 0],
                [8425, 4832, 0],
                [7487, 4242, 0],
                [5107, 3449, 0],
                [5442, 3229, 0],
                [4129, 841, 0],
                [9408, 8075, 0],
                [9456, 7279, 0],
                [9876, 6830, 0],
                [10816, 5364, 0],
                [9906, 5887, 0],
                [9915, 4163, 0],
                [10393, 3529, 0],
                [9296, 2786, 0],
                [9509, 2052, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
            ],

            [   // Sektormarker-Position
            ]
        ],

        [    // Sektor 2
            [   // Sektormarker
            ],

            [   // Flaggen-Positionen
                [3835, 17824, 0],
                [4891, 17004, 0],
                [5678, 17464, 0],
                [8042, 16429, 0],
                [8353, 16704, 0],
                [9034, 16169, 0],
                [13064, 17284, 0],
                [13220, 17668, 0],
                [13864, 17900, 0],
                [11623, 18650, 0],
                [11547, 17735, 0],
                [12584, 19046, 0],
                [2718, 16189, 0],
                [2573, 15912, 0],
                [5367, 14380, 0],
                [3794, 8908, 0],
                [8064, 12817, 0],
                [9611, 14150, 0],
                [11859, 15510, 0],
                [12428, 15473, 0],
                [12994, 15276, 0],
                [1187, 14232, 0],
                [1751, 13859, 0],
                [3290, 13192, 0],
                [10329, 10837, 0],
                [9673, 11322, 0],
                [8921, 12697, 0],
                [19683, 7062, 0],
                [17152, 7101, 0],
                [16291, 6548, 0],
                [13244, 807, 0],
                [13386, 1436, 0],
                [15965, 3096, 0],
                [19207, 3243, 0],
                [20028, 3488, 0],
                [17495, 2856, 0],
                [10668, 1283, 0],
                [11417, 2824, 0],
                [12123, 2744, 0],
                [13101, 3526, 0],
                [13966, 3414, 0],
                [15108, 4326, 0],
                [16492, 5374, 0],
                [17383, 5803, 0],
                [18058, 6018, 0],
                [11397, 3913, 0],
                [11525, 5020, 0],
                [13359, 4859, 0],
                [11948, 6141, 0],
                [11400, 6698, 0],
                [12243, 7098, 0],
                [10474, 9259, 0],
                [10703, 10108, 0],
                [11941, 8159, 0],
                [5883, 12473, 0],
                [8834, 10928, 0],
                [8327, 10219, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
            ],

            [   // Sektormarker-Position
            ]
        ]
    ];
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
GVAR(SectorNumberMarkers) = [];
private _markerID = 0;

// CBA-Settings parsen, da dies sonst erst nach dem "Durchdrücken" geschieht
GVAR(nato_allsectors) = parseSimpleArray format ["[%1]", GVAR(nato_allsectors_str)];
GVAR(csat_allsectors) = parseSimpleArray format ["[%1]", GVAR(csat_allsectors_str)];
GVAR(nato_sectors) = parseSimpleArray format ["[%1]", GVAR(nato_sectors_str)];
GVAR(csat_sectors) = parseSimpleArray format ["[%1]", GVAR(csat_sectors_str)];

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

// Sektornummern-Marker auf die Karte zeichnen
{
    private _pos = (_x # 4) # 0;
    if  (count _pos >= 2) then
    {
        private ["_color", "_icon"];

        // Fraktionsabhängige Farben
        if (_forEachIndex in GVAR(csat_allsectors)) then {_color = "colorOPFOR"}
        else {_color = "colorBLUFOR"};

        // Gewählte Sektoren bekommen ein Icon
        if (_forEachIndex in (GVAR(nato_sectors) + GVAR(csat_sectors))) then {_icon = "hd_ambush"}
        else {_icon = "EmptyIcon"};

        private _marker = createMarkerLocal [format ["SectorNumberMarker_%1", _forEachIndex], _pos];
        _marker setMarkerColorLocal _color;
        _marker setMarkerTypeLocal _icon;
        _marker setMarkerText str _forEachIndex;
        GVAR(SectorNumberMarkers) pushBack _marker;
    };
} forEach GVAR(AllSectors);
