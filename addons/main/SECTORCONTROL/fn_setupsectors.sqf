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
                [15192.6, 17336.6, 0]
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
                [6854.2,2002.99,0]
  
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
                [5074.52,3087.24,0]

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
