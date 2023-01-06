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

// Livonia
if (worldName == "Enoch") then
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
                [[3969, 12800], [0, 12800]],
                [[0, 12800], [0, 10498]],
                [[0, 10498], [2513, 9908]],
                [[2513, 9908], [3969, 12800]]
            ],

            [   // Flaggen-Positionen
                [1030, 11395, 0],
                [3128, 11934, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [0, 12800], [2513, 9908], [3969, 12800],
                [0, 12800], [0, 10498], [2513, 9908]
            ],

            [   // Sektormarker-Position
                [1279, 11382]
            ]
        ],

        [    // Sektor 2
            [   // Sektormarker
                [[3969, 12800], [2513, 9908]],
                [[2513, 9908], [4751, 9664]],
                [[4751, 9664], [4809, 10947]],
                [[4809, 10947], [5610, 11614]],
                [[5610, 11614], [5610, 12800]],
                [[5610, 12800], [3969, 12800]]
            ],

            [   // Flaggen-Positionen
                [3846, 11657, 0],
                [4100, 10259, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [3969, 12800], [2513, 9908], [4809, 10947],
                [3969, 12800], [4809, 10947], [5610, 11614],
                [3969, 12800], [5610, 11614], [5610, 12800],
                [2513, 9908], [4751, 9664], [4809, 10947]
            ],

            [   // Sektormarker-Position
                [3895, 11148]
            ]
        ],

        [    // Sektor 3
            [   // Sektormarker
                [[5610, 12800], [5610, 11614]],
                [[5610, 11614], [5706, 10895]],
                [[5706, 10895], [6886, 10402]],
                [[6886, 10402], [7508, 10973]],
                [[7508, 10973], [9496, 12800]],
                [[9496, 12800], [5610, 12800]]
            ],

            [   // Flaggen-Positionen
                [6272, 10919, 0],
                [7930, 11854, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [9496, 12800], [5610, 12800], [7508, 10973],
                [7508, 10973], [5610, 12800], [5610, 11614],
                [5706, 10895], [7508, 10973], [5610, 11614],
                [5706, 10895], [6886, 10402], [7508, 10973]
            ],

            [   // Sektormarker-Position
                [6699, 11758]
            ]
        ],

        [    // Sektor 4
            [   // Sektormarker
                [[9496, 12800], [7508, 10973]],
                [[7508, 10973], [8457, 10177]],
                [[8457, 10177], [10861, 11761]],
                [[10861, 11761], [11554, 12800]],
                [[11554, 12800], [9496, 12800]]
            ],

            [   // Flaggen-Positionen
                [8141, 10848, 0],
                [9290, 11173, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [7508, 10973], [8457, 10177], [9496, 12800],
                [9496, 12800], [8457, 10177], [10861, 11761],
                [9496, 12800], [10861, 11761], [11554, 12800]
            ],

            [   // Sektormarker-Position
                [9104, 11676]
            ]
        ],

        [    // Sektor 5
            [   // Sektormarker
                [[9047, 9414], [9335, 8453]],
                [[9335, 8453], [9905, 7009]],
                [[9905, 7009], [10996, 10131]],
                [[10996, 10131], [12800, 10793]],
                [[12800, 10793], [12800, 12800]],
                [[12800, 12800], [11554, 12800]],
                [[11554, 12800], [10861, 11761]],
                [[10861, 11761], [8457, 10177]],
                [[8457, 10177], [9047, 9414]]
            ],

            [   // Flaggen-Positionen
                [ 9515, 10351, 0],
                [10684, 11093, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [10861, 11761], [8457, 10177], [10996, 10131],
                [10861, 11761], [10996, 10131], [12800, 10793],
                [11554, 12800], [10861, 11761], [12800, 10793],
                [11554, 12800], [12800, 10793], [12800, 12800],
                [10996, 10131], [8457, 10177], [9047, 9414],
                [9047, 9414], [9335, 8453], [10996, 10131],
                [9335, 8453], [9905, 7009], [10996, 10131]
            ],

            [   // Sektormarker-Position
                [10536, 10702]
            ]
        ],

        [    // Sektor 6
            [   // Sektormarker
                [[6886, 10402], [7771, 7606]],
                [[7771, 7606], [9335, 8453]],
                [[9335, 8453], [9047, 9414]],
                [[9047, 9414], [8457, 10177]],
                [[8457, 10177], [7508, 10973]],
                [[7508, 10973], [6886, 10402]]
            ],

            [   // Flaggen-Positionen
                [7801, 10082, 0],
                [8118, 8729, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [7508, 10973], [6886, 10402], [8457, 10177],
                [6886, 10402], [7771, 7606], [8457, 10177],
                [8457, 10177], [7771, 7606], [9047, 9414],
                [9047, 9414], [7771, 7606], [9335, 8453]
            ],

            [   // Sektormarker-Position
                [7778, 9353]
            ]
        ],

        [    // Sektor 7
            [   // Sektormarker
                [[5706, 8741], [5931, 7311]],
                [[5931, 7311], [7771, 7606]],
                [[7771, 7606], [6886, 10402]],
                [[6886, 10402], [5706, 8741]]
            ],

            [   // Flaggen-Positionen
                [6524, 9251, 0],
                [6429, 8154, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [6886, 10402], [5706, 8741], [7771, 7606],
                [5706, 8741], [5931, 7311], [7771, 7606]
            ],

            [   // Sektormarker-Position
                [6387, 8615]
            ]
        ],

        [    // Sektor 8
            [   // Sektormarker
                [[5610, 11614], [4809, 10947]],
                [[4809, 10947], [4751, 9664]],
                [[4751, 9664], [4924, 8741]],
                [[4924, 8741], [5706, 8741]],
                [[5706, 8741], [6886, 10402]],
                [[6886, 10402], [5706, 10895]],
                [[5706, 10895], [5610, 11614]]
            ],

            [   // Flaggen-Positionen
                [5158, 9943, 0],
                [6264, 10155, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [4809, 10947], [4751, 9664], [5706, 10895],
                [5610, 11614], [4809, 10947], [5706, 10895],
                [5706, 10895], [4751, 9664], [5706, 8741],
                [5706, 10895], [5706, 8741], [6886, 10402],
                [4751, 9664], [4924, 8741], [5706, 8741]
            ],

            [   // Sektormarker-Position
                [5350, 9963]
            ]
        ],

        [    // Sektor 9
            [   // Sektormarker
                [[2513, 9908], [1936, 8273]],
                [[1936, 8273], [4924, 8741]],
                [[4924, 8741], [4751, 9664]],
                [[4751, 9664], [2513, 9908]]
            ],

            [   // Flaggen-Positionen
                [4194, 9038, 0],
                [3439, 8997, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [4924, 8741], [2513, 9908], [1936, 8273],
                [4751, 9664], [2513, 9908], [4924, 8741]
            ],

            [   // Sektormarker-Position
                [3296, 9124]
            ]
        ],

        [    // Sektor 10
            [   // Sektormarker
                [[2513, 9908], [0, 10498]],
                [[0, 10498], [0, 8132]],
                [[0, 8132], [1936, 8273]],
                [[1936, 8273], [2513, 9908]]
            ],

            [   // Flaggen-Positionen
                [1461, 9732, 0],
                [1235, 8955, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [0, 10498], [1936, 8273], [2513, 9908],
                [0, 10498], [0, 8132], [1936, 8273]
            ],

            [   // Sektormarker-Position
                [920, 9264]
            ]
        ],

        [    // Sektor 11
            [   // Sektormarker
                [[4924, 8741], [1936, 8273]],
                [[1936, 8273], [2385, 6561]],
                [[2385, 6561], [3744, 5971]],
                [[3744, 5971], [4924, 8741]]
            ],

            [   // Flaggen-Positionen
                [4037, 7886, 0],
                [3119, 6790, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [1936, 8273], [2385, 6561], [4924, 8741],
                [2385, 6561], [3744, 5971], [4924, 8741]
            ],

            [   // Sektormarker-Position
                [3124, 7415]
            ]
        ],

        [    // Sektor 12
            [   // Sektormarker
                [[4924, 8741], [3744, 5971]],
                [[3744, 5971], [6226, 6099]],
                [[6226, 6099], [5931, 7311]],
                [[5931, 7311], [5706, 8741]],
                [[5706, 8741], [4924, 8741]]
            ],

            [   // Flaggen-Positionen
                [4865, 7793, 0],
                [4570, 6396, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [4924, 8741], [3744, 5971], [5931, 7311],
                [5706, 8741], [4924, 8741], [5931, 7311],
                [5931, 7311], [3744, 5971], [6226, 6099]
            ],

            [   // Sektormarker-Position
                [4823, 7125]
            ]
        ],

        [    // Sektor 13
            [   // Sektormarker
                [[3744, 5971], [4219, 4747]],
                [[4219, 4747], [6950, 3451]],
                [[6950, 3451], [6226, 6099]],
                [[6226, 6099], [3744, 5971]]
            ],

            [   // Flaggen-Positionen
                [4688, 5613, 0],
                [5962, 4077, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [3744, 5971], [4219, 4747], [6226, 6099],
                [6226, 6099], [4219, 4747], [6950, 3451]
            ],

            [   // Sektormarker-Position
                [5113, 5039]
            ]
        ],

        [    // Sektor 14
            [   // Sektormarker
                [[6226, 6099], [6950, 3451]],
                [[6950, 3451], [8597, 3618]],
                [[8597, 3618], [8466, 5563]],
                [[8466, 5563], [7771, 7606]],
                [[7771, 7606], [5931, 7311]],
                [[5931, 7311], [6226, 6099]]
            ],

            [   // Flaggen-Positionen
                [7349, 6466, 0],
                [7669, 5316, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [5931, 7311], [6226, 6099], [7771, 7606],
                [7771, 7606], [6226, 6099], [8466, 5563],
                [6226, 6099], [6950, 3451], [8466, 5563],
                [8466, 5563], [6950, 3451], [8597, 3618]
            ],

            [   // Sektormarker-Position
                [7134, 5620]
            ]
        ],

        [    // Sektor 15
            [   // Sektormarker
                [[9335, 8453], [7771, 7606]],
                [[7771, 7606], [8466, 5563]],
                [[8466, 5563], [8597, 3618]],
                [[8597, 3618], [10581, 4987]],
                [[10581, 4987], [9905, 7009]],
                [[9905, 7009], [9335, 8453]]
            ],

            [   // Flaggen-Positionen
                [9056, 6590, 0],
                [9059, 4433, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [9335, 8453], [7771, 7606], [9905, 7009],
                [7771, 7606], [8466, 5563], [9905, 7009],
                [9905, 7009], [8466, 5563], [10581, 4987],
                [8466, 5563], [8597, 3618], [10581, 4987]
            ],

            [   // Sektormarker-Position
                [8994, 5910]
            ]
        ],

        [    // Sektor 16
            [   // Sektormarker
                [[11596, 4487], [10581, 4987]],
                [[10581, 4987], [8597, 3618]],
                [[8597, 3618], [9643, 2649]],
                [[9643, 2649], [12800, 2649]],
                [[12800, 2649], [11596, 4487]]
            ],

            [   // Flaggen-Positionen
                [9902, 3788, 0],
                [10498, 3129, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [8597, 3618], [9643, 2649], [10581, 4987],
                [10581, 4987], [9643, 2649], [11596, 4487],
                [11596, 4487], [9643, 2649], [12800, 2649]
            ],

            [   // Sektormarker-Position
                [10381, 3631]
            ]
        ],

        [    // Sektor 17
            [   // Sektormarker
                [[12800, 0], [12800, 2649]],
                [[12800, 2649], [9643, 2649]],
                [[9643, 2649], [9382, 0]],
                [[9382, 0], [12800, 0]]
            ],

            [   // Flaggen-Positionen
                [10219, 2168, 0],
                [11256, 703, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [9643, 2649], [9382, 0], [12800, 0],
                [9643, 2649], [12800, 0], [12800, 2649]
            ],

            [   // Sektormarker-Position
                [10854, 1352]
            ]
        ],

        [    // Sektor 18
            [   // Sektormarker
                [[5071, 861], [5071, 0]],
                [[5071, 0], [9382, 0]],
                [[9382, 0], [9643, 2649]],
                [[9643, 2649], [8597, 3618]],
                [[8597, 3618], [6950, 3451]],
                [[6950, 3451], [5629, 861]],
                [[5629, 861], [5071, 861]]
            ],

            [   // Flaggen-Positionen
                [7621, 2630, 0],
                [8938, 2049, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [5629, 861], [5071, 861], [5071, 0],
                [9382, 0], [5629, 861], [5071, 0],
                [6950, 3451], [5629, 861], [9382, 0],
                [9643, 2649], [6950, 3451], [9382, 0],
                [8597, 3618], [6950, 3451], [9643, 2649]
            ],

            [   // Sektormarker-Position
                [7414, 1610]
            ]
        ],

        [    // Sektor 19
            [   // Sektormarker
                [[4219, 4747], [4219, 3612]],
                [[4219, 3612], [4603, 861]],
                [[4603, 861], [5071, 861]],
                [[5071, 861], [5629, 861]],
                [[5629, 861], [6950, 3451]],
                [[6950, 3451], [4219, 4747]]
            ],

            [   // Flaggen-Positionen
                [5618, 3780, 0],
                [5096, 2126, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [4219, 3612], [6950, 3451], [4219, 4747],
                [5629, 861], [6950, 3451], [4219, 3612],
                [4219, 3612], [5071, 861], [5629, 861],
                [5071, 861], [4219, 3612], [4603, 861]
            ],

            [   // Sektormarker-Position
                [5006, 2771]
            ]
        ],

        [    // Sektor 20
            [   // Sektormarker
                [[0, 1932], [0, 0]],
                [[0, 0], [5071, 0]],
                [[5071, 0], [5071, 861]],
                [[5071, 861], [4603, 861]],
                [[4603, 861], [4219, 3612]],
                [[4219, 3612], [0, 1932]]
            ],

            [   // Flaggen-Positionen
                [3266, 2138, 0],
                [2799, 1620, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [4219, 3612], [0, 1932], [4603, 861],
                [0, 1932], [0, 0], [4603, 861],
                [4603, 861], [0, 0], [5071, 0],
                [4603, 861], [5071, 0], [5071, 861]
            ],

            [   // Sektormarker-Position
                [2210, 1362]
            ]
        ],

        [    // Sektor 21 - Östliche Basis
            [   // Sektormarker
                [[10996, 10131], [9905, 7009]],
                [[9905, 7009], [10581, 4987]],
                [[10581, 4987], [11596, 4487]],
                [[11596, 4487], [12800, 2649]],
                [[12800, 2649], [12800, 10793]],
                [[12800, 10793], [10996, 10131]]
            ],

            [   // Flaggen-Positionen
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [12800, 10793], [10996, 10131], [9905, 7009],
                [12800, 10793], [9905, 7009], [11596, 4487],
                [11596, 4487], [12800, 2649], [12800, 10793],
                [11596, 4487], [9905, 7009], [10581, 4987]
            ],

            [   // Sektormarker-Position
            ]
        ],

        [    // Sektor 22 - Westliche Basis
            [   // Sektormarker
                [[1936, 8273], [0, 8132]],
                [[0, 8132], [0, 1932]],
                [[0, 1932], [4219, 3612]],
                [[4219, 3612], [4219, 4747]],
                [[4219, 4747], [3744, 5971]],
                [[3744, 5971], [2385, 6561]],
                [[2385, 6561], [1936, 8273]]
            ],

            [   // Flaggen-Positionen
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [1936, 8273], [0, 8132], [2385, 6561],
                [0, 8132], [0, 1932], [2385, 6561],
                [2385, 6561], [0, 1932], [4219, 3612],
                [4219, 3612], [4219, 4747], [2385, 6561],
                [3744, 5971], [2385, 6561], [4219, 4747]
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
