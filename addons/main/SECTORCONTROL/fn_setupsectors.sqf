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
Jede Flagge besitzt eine X- und Y- Koordinate, ein Boolean zur Aktivierung sowie einen Namen.
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
            ]
        ],

        [    // Sektor 1
            [   // Sektormarker
                [[16.0652, 11005], [2232.78, 11003.3]],
                [[2232.78, 11003.3], [3877.61, 9674.36]],
                [[3877.61, 9674.36], [3798.26, 9598.03]],
                [[3798.26, 9598.03], [1393.25, 8266.92]],
                [[1393.25, 8266.92], [22.511, 9268.51]],
                [[22.511, 9268.51], [16.0652, 11005]]
            ],

            [   // Flaggen-Positionen
                [1295, 9508, true, "1_1 Bielawa"],
                [1235, 8955, true, "1_2 Steinbruch"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 2
            [   // Sektormarker
                [[2246.05, 12780.7], [4685.85, 12781.2]],
                [[4685.85, 12781.2], [5203.38, 10932]],
                [[5203.38, 10932], [3887.43, 9688.45]],
                [[3887.43, 9688.45], [2244.94, 11021.5]],
                [[2244.94, 11021.5], [2246.05, 12780.7]]
            ],

            [   // Flaggen-Positionen
                [3846, 11657, true, "2_1 Lukow"],
                [4100, 10259, true, "2_2 Airfield"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 3
            [   // Sektormarker
                [[4703.91, 12782.1], [7025.29, 12780.7]],
                [[7025.29, 12780.7], [6967.86, 10085.4]],
                [[6967.86, 10085.4], [6333.91, 9766.69]],
                [[6333.91, 9766.69], [5782.46, 9320.02]],
                [[5782.46, 9320.02], [5781.05, 10423.6]],
                [[5781.05, 10423.6], [5224.08, 10937.1]],
                [[5224.08, 10937.1], [4703.91, 12782.1]]
            ],

            [   // Flaggen-Positionen
                [6272, 10919, true, "3_1 Tümpel"],
                [6264, 10155, true, "3_2 Sabaotka"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 4
            [   // Sektormarker
                [[7042.73, 12782.7], [8533.35, 12780.8]],
                [[8533.35, 12780.8], [8663.94, 10627.3]],
                [[8663.94, 10627.3], [7714.78, 10680.8]],
                [[7714.78, 10680.8], [6984.39, 10099]],
                [[6984.39, 10099], [7042.73, 12782.7]]
            ],

            [   // Flaggen-Positionen
                [7930, 11854, true, "4_1 nördliche Brücke"],
                [8141, 10848, true, "4_2 Militärkomplex (lang)"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 5
            [   // Sektormarker
                [[8552.25, 12782.4], [10644, 12797.3]],
                [[10644, 12797.3], [10661.4, 11015.1]],
                [[10661.4, 11015.1], [10077.4, 9873.41]],
                [[10077.4, 9873.41], [8926.35, 9622.28]],
                [[8926.35, 9622.28], [8686.83, 10619.2]],
                [[8686.83, 10619.2], [8552.25, 12782.4]]
            ],

            [   // Flaggen-Positionen
                [9290, 11173, true, "5_1 Tarnow Nord"],
                [9515, 10351, true, "5_2 Tarnow Süd"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 6
            [   // Sektormarker
                [[21.9443, 9240.98], [1395.18, 8246.98]],
                [[1395.18, 8246.98], [3794.86, 9576.94]],
                [[3794.86, 9576.94], [3709.24, 8063.76]],
                [[3709.24, 8063.76], [3707.98, 7631.59]],
                [[3707.98, 7631.59], [1833.71, 7317.43]],
                [[1833.71, 7317.43], [28.264, 7633.41]],
                [[28.264, 7633.41], [21.9443, 9240.98]]
            ],

            [   // Flaggen-Positionen
                [1799, 7685, true, "6_1 Topolin HBF"],
                [3439, 8997, true, "6_2 Jantar Hütte"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 7
            [   // Sektormarker
                [[3812.53, 9588.55], [3899.19, 9670.91]],
                [[3899.19, 9670.91], [5213.02, 10919.4]],
                [[5213.02, 10919.4], [5764.29, 10417.4]],
                [[5764.29, 10417.4], [5764.06, 9306.01]],
                [[5764.06, 9306.01], [3724.96, 7642.48]],
                [[3724.96, 7642.48], [3725.53, 8064.87]],
                [[3725.53, 8064.87], [3812.53, 9588.55]]
            ],

            [   // Flaggen-Positionen
                [4194, 9038, true, "7_1 Brückenkampf"],
                [5158, 9943, true, "7_2 Gliniska"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 8
            [   // Sektormarker
                [[5783.1, 9297.8], [6344.62, 9753.79]],
                [[6344.62, 9753.79], [6972.93, 10068.4]],
                [[6972.93, 10068.4], [8042.55, 8098.32]],
                [[8042.55, 8098.32], [5733.99, 7107.04]],
                [[5733.99, 7107.04], [5734.67, 7645.75]],
                [[5734.67, 7645.75], [5783.1, 9297.8]]
            ],

            [   // Flaggen-Positionen
                [6524, 9251, true, "8_1 Häusle"],
                [6429, 8154, true, "8_2 Kaserne Wald"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 9
            [   // Sektormarker
                [[6992.09, 10081.3], [7727.31, 10669]],
                [[7727.31, 10669], [8672.06, 10610]],
                [[8672.06, 10610], [8912.81, 9608.99]],
                [[8912.81, 9608.99], [9273.53, 8103.23]],
                [[9273.53, 8103.23], [8060.61, 8105]],
                [[8060.61, 8105], [6992.09, 10081.3]]
            ],

            [   // Flaggen-Positionen
                [7801, 10082, true, "9_1 Militärstation"],
                [8118, 8729, true, "9_2 zerbombtes Zapadlisko"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 10
            [   // Sektormarker
                [[8932.91, 9606.25], [10090.1, 9859.72]],
                [[10090.1, 9859.72], [10676.4, 11006.3]],
                [[10676.4, 11006.3], [12791.5, 11005]],
                [[12791.5, 11005], [12790.8, 8104.83]],
                [[12790.8, 8104.83], [9291.45, 8104.61]],
                [[9291.45, 8104.61], [8932.91, 9606.25]]
            ],

            [   // Flaggen-Positionen
                [9804, 8596, true, "10_1 Borek Bahnhof"],
                [11042, 9021, true, "10_2 Industriegebiet"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 11
            [   // Sektormarker
                [[29.9673, 7613.92], [1835.51, 7301.77]],
                [[1835.51, 7301.77], [3710.75, 7615.11]],
                [[3710.75, 7615.11], [4173.9, 6117.26]],
                [[4173.9, 6117.26], [36.9373, 6119.57]],
                [[36.9373, 6119.57], [29.9673, 7613.92]]
            ],

            [   // Flaggen-Positionen
                [1906, 7086, true, "11_1 Topolin Vorort"],
                [3119, 6790, true, "11_2 Adamow"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 12
            [   // Sektormarker
                [[3727.7, 7622.75], [5762.83, 9283.37]],
                [[5762.83, 9283.37], [5715.68, 7646.19]],
                [[5715.68, 7646.19], [5716.34, 7090.38]],
                [[5716.34, 7090.38], [5914.13, 5932.5]],
                [[5914.13, 5932.5], [5186.9, 6117.73]],
                [[5186.9, 6117.73], [4192.35, 6119.15]],
                [[4192.35, 6119.15], [3727.7, 7622.75]]
            ],

            [   // Flaggen-Positionen
                [4865, 7793, true, "12_1 Olszanka"],
                [4570, 6396, true, "12_2 Muratyn"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 13
            [   // Sektormarker
                [[5734.64, 7087.47], [8060.57, 8087.33]],
                [[8060.57, 8087.33], [9277.53, 8087.14]],
                [[9277.53, 8087.14], [9607.43, 5842.78]],
                [[9607.43, 5842.78], [9051.31, 5841.18]],
                [[9051.31, 5841.18], [8366.07, 5843.07]],
                [[8366.07, 5843.07], [5932.92, 5930.53]],
                [[5932.92, 5930.53], [5734.64, 7087.47]]
            ],

            [   // Flaggen-Positionen
                [7349, 6466, true, "13_1 Radunin Kirche"],
                [9056, 6590, true, "13_2 zwischen Baracken"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 14
            [   // Sektormarker
                [[9295.28, 8087.58], [12791.4, 8086.42]],
                [[12791.4, 8086.42], [12791.9, 5963.99]],
                [[12791.9, 5963.99], [10178.3, 5842.18]],
                [[10178.3, 5842.18], [9623.99, 5842.22]],
                [[9623.99, 5842.22], [9295.28, 8087.58]]
            ],

            [   // Flaggen-Positionen
                [10320, 6810, true, "14_1 Karlin"],
                [11864.2, 7399.04, true, "14_2 Ivetow"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 15
            [   // Sektormarker
                [[40.0211, 6100.47], [4174.56, 6099.95]],
                [[4174.56, 6099.95], [3610.37, 4462.32]],
                [[3610.37, 4462.32], [1460.59, 4905.42]],
                [[1460.59, 4905.42], [38.415, 4227.62]],
                [[38.415, 4227.62], [40.0211, 6100.47]]
            ],

            [   // Flaggen-Positionen
                [890, 5475, true, "15_1 Bagger Zalesie"],
                [2624, 5453, true, "15_2 Bauernhof"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 16
            [   // Sektormarker
                [[4193.88, 6101.33], [5187.36, 6101.59]],
                [[5187.36, 6101.59], [5917.64, 5914.94]],
                [[5917.64, 5914.94], [5735.05, 4212.75]],
                [[5735.05, 4212.75], [6116.18, 2978.24]],
                [[6116.18, 2978.24], [4378.36, 3695.5]],
                [[4378.36, 3695.5], [3628.01, 4456.63]],
                [[3628.01, 4456.63], [4193.88, 6101.33]]
            ],

            [   // Flaggen-Positionen
                [4688, 5613, true, "16_1 Kirche auf Hügel"],
                [5618, 3780, true, "16_2 Nadbor Kaserne"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 17
            [   // Sektormarker
                [[5935.16, 5912.81], [8368.81, 5825.72]],
                [[8368.81, 5825.72], [9036.6, 5825.92]],
                [[9036.6, 5825.92], [7704.05, 4457.68]],
                [[7704.05, 4457.68], [6673.01, 2100.61]],
                [[6673.01, 2100.61], [6137.38, 2968.18]],
                [[6137.38, 2968.18], [5751.91, 4216.2]],
                [[5751.91, 4216.2], [5935.16, 5912.81]]
            ],

            [   // Flaggen-Positionen
                [5962, 4077, true, "17_1 Nadbor Zentrum"],
                [7669, 5316, true, "17_2 Roztoka Übungsgelände"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 18
            [   // Sektormarker
                [[9061.42, 5826.41], [9618.55, 5826.24]],
                [[9618.55, 5826.24], [10180.5, 5826.03]],
                [[10180.5, 5826.03], [12791.7, 5947.39]],
                [[12791.7, 5947.39], [12790.6, 4079.21]],
                [[12790.6, 4079.21], [10284.7, 4773.41]],
                [[10284.7, 4773.41], [8357, 3483.21]],
                [[8357, 3483.21], [7722.18, 4453.22]],
                [[7722.18, 4453.22], [9061.42, 5826.41]]
            ],

            [   // Flaggen-Positionen
                [9059, 4433, true, "18_1 Die Kreuzung"],
                [11728, 5015, true, "18_2 Friedhof"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 19
            [   // Sektormarker
                [[39.0542, 4209.76], [1463.93, 4888.53]],
                [[1463.93, 4888.53], [3605.35, 4447.36]],
                [[3605.35, 4447.36], [2650.99, 1888.41]],
                [[2650.99, 1888.41], [1239.03, 1651.29]],
                [[1239.03, 1651.29], [11.4601, 1651.89]],
                [[11.4601, 1651.89], [39.0542, 4209.76]]
            ],

            [   // Flaggen-Positionen
                [1658, 3690, true, "19_1 Sägewerk"],
                [2409, 3815, true, "19_2 Luftlandeparadis"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 20
            [   // Sektormarker
                [[1250.72, 1636.37], [2655.8, 1872.19]],
                [[2655.8, 1872.19], [4879.89, 11.7027]],
                [[4879.89, 11.7027], [1250.6, 12.7777]],
                [[1250.6, 12.7777], [1250.72, 1636.37]]
            ],

            [   // Flaggen-Positionen
                [2799, 1620, true, "20_1 Tymbark"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 21
            [   // Sektormarker
                [[3620.16, 4438.27], [4369, 3680.57]],
                [[4369, 3680.57], [6124.45, 2957.07]],
                [[6124.45, 2957.07], [6666.23, 2078.06]],
                [[6666.23, 2078.06], [6901.92, 12.326]],
                [[6901.92, 12.326], [4907.66, 12.4146]],
                [[4907.66, 12.4146], [2668.14, 1883.97]],
                [[2668.14, 1883.97], [3620.16, 4438.27]]
            ],

            [   // Flaggen-Positionen
                [3266, 2138, true, "21_1 Polana"],
                [5096, 2126, true, "21_2 Swarok Radaranlage"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 22
            [   // Sektormarker
                [[7713.23, 4435.98], [8349.6, 3465.73]],
                [[8349.6, 3465.73], [8881.6, 2693.42]],
                [[8881.6, 2693.42], [9408.63, 1929]],
                [[9408.63, 1929], [8133.86, 11.9164]],
                [[8133.86, 11.9164], [6920.76, 11.908]],
                [[6920.76, 11.908], [6683.12, 2079.88]],
                [[6683.12, 2079.88], [7713.23, 4435.98]]
            ],

            [   // Flaggen-Positionen
                [7364, 2599, true, "22_1 Factory"],
                [8938, 2049, true, "22_2 Funkturm"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 23
            [   // Sektormarker
                [[8368.94, 3469.47], [10290.2, 4757.8]],
                [[10290.2, 4757.8], [12792.1, 4060.88]],
                [[12792.1, 4060.88], [12792.3, 1178.43]],
                [[12792.3, 1178.43], [10946.8, 1179.53]],
                [[10946.8, 1179.53], [10832.6, 2588.91]],
                [[10832.6, 2588.91], [8890.52, 2708.36]],
                [[8890.52, 2708.36], [8368.94, 3469.47]]
            ],

            [   // Flaggen-Positionen
                [9902, 3788, true, "23_1 Shootingrange"],
                [10498, 3129, true, "23_2 Zeltplatz"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 24
            [   // Sektormarker
                [[8903.69, 2691.08], [10818.6, 2572.58]],
                [[10818.6, 2572.58], [10931.2, 1169.43]],
                [[10931.2, 1169.43], [10978.3, 11.7462]],
                [[10978.3, 11.7462], [8154.31, 11.2289]],
                [[8154.31, 11.2289], [9425.77, 1930.45]],
                [[9425.77, 1930.45], [8903.69, 2691.08]]
            ],

            [   // Flaggen-Positionen
                [10219, 2168, true, "24_1 Widok"]
            ],

            [   // Beam-Positionen
            ]
        ]
    ];
};

// Virolahti
if (worldName == "vt7") then
{
    GVAR(AllSectors) =
    [
        [    // Sektor 0
            [   // Sektormarker
            ],

            [   // Flaggen-Positionen
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 1
            [   // Sektormarker
                [[14.1793, 11002.4], [2231.42, 11002.4]],
                [[2231.42, 11002.4], [3874.71, 9672.97]],
                [[3874.71, 9672.97], [3795, 9599.99]],
                [[3795, 9599.99], [1388.63, 8268.2]],
                [[1388.63, 8268.2], [21.7881, 9267.47]],
                [[21.7881, 9267.47], [14.1793, 11002.4]]
            ],

            [   // Flaggen-Positionen
                [1295, 9508, true, "1_1 Bielawa"],
                [1235, 8955, true, "1_2 Steinbruch"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 2
            [   // Sektormarker
                [[2245.11, 12779.9], [4685.72, 12781.1]],
                [[4685.72, 12781.1], [5201.49, 10932.8]],
                [[5201.49, 10932.8], [3891.49, 9689.85]],
                [[3891.49, 9689.85], [2243.96, 11021.5]],
                [[2243.96, 11021.5], [2245.11, 12779.9]]
            ],

            [   // Flaggen-Positionen
                [3846, 11657, true, "2_1 Lukow"],
                [4100, 10259, true, "2_2 Airfield"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 3
            [   // Sektormarker
                [[4703.7, 12782], [7023.69, 12779.9]],
                [[7023.69, 12779.9], [6968.57, 10086.5]],
                [[6968.57, 10086.5], [6334.05, 9767.27]],
                [[6334.05, 9767.27], [5781.94, 9320.58]],
                [[5781.94, 9320.58], [5779.41, 10428.3]],
                [[5779.41, 10428.3], [5219.23, 10938.6]],
                [[5219.23, 10938.6], [4703.7, 12782]]
            ],

            [   // Flaggen-Positionen
                [6272, 10919, true, "3_1 Tümpel"],
                [6264, 10155, true, "3_2 Sabaotka"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 4
            [   // Sektormarker
                [[7042.05, 12782.3], [8533.27, 12779.9]],
                [[8533.27, 12779.9], [8661.24, 10630.3]],
                [[8661.24, 10630.3], [7716.59, 10676.2]],
                [[7716.59, 10676.2], [6988.38, 10108.1]],
                [[6988.38, 10108.1], [7042.05, 12782.3]]
            ],

            [   // Flaggen-Positionen
                [7930, 11854, true, "4_1 nördliche Brücke"],
                [8141, 10848, true, "4_2 Militärkomplex (lang)"]
            ],

            [   // Beam-Positionen
            ]
        ]
    ];
};

publicVariable QGVAR(AllSectors);

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
        } forEach (_x select 1); // all flags
    } forEach GVAR(AllSectors); // all sectors
};
publicVariable QGVAR(PreMineZoneMarkers);

// Sector-Markers
GVAR(NATOSectorMarkers) = [];
GVAR(CSATSectorMarkers) = [];
GVAR(AAFSectorMarkers) = [];
GVAR(BorderMarkers) = [];
private _markerID = 0;

// CBA-Settings parsen, da dies sonst erst nach dem "Durchdrücken" geschieht
GVAR(nato_allsectors) = parseSimpleArray format ["[%1]", GVAR(nato_allsectors_str)]; 
GVAR(csat_allsectors) = parseSimpleArray format ["[%1]", GVAR(csat_allsectors_str)]; 
GVAR(aaf_allsectors) = parseSimpleArray format ["[%1]", GVAR(aaf_allsectors_str)]; 

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

{
    {
        _markerID = _markerID + 1;
        private _markername = format ["SectorMarker_%1", _markerID];
        [_x, "ColorBlack", 8, _markername] call FUNC(drawline);
        GVAR(AAFSectorMarkers) pushBack _markername;
    } forEach ((GVAR(AllSectors) select _x) select 0);
} forEach GVAR(aaf_allsectors);

// Grenzlinien
switch OPT_GELDZEIT_Fraktionauswahl do 
{
        case "AAFvsCSAT":
        {
            GVAR(Side1SectorMarkers) = GVAR(AAFSectorMarkers);
            GVAR(Side2SectorMarkers) = GVAR(CSATSectorMarkers);
        };

        case "NATOvsCSAT":
        {
            GVAR(Side1SectorMarkers) = GVAR(NATOSectorMarkers);
            GVAR(Side2SectorMarkers) = GVAR(CSATSectorMarkers);
        };

        case "NATOvsAAF":
        {
            GVAR(Side1SectorMarkers) = GVAR(NATOSectorMarkers);
            GVAR(Side2SectorMarkers) = GVAR(AAFSectorMarkers);
        };

           default 
        {
            ERROR_LOG("setupsectors: Fehlerhafte Datenuebergabe - Keine Fraktionauswahl erkannt");
        };
};

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
    } forEach GVAR(Side2SectorMarkers)
} forEach GVAR(Side1SectorMarkers);

// Karten Umrandung
[[[0, worldSize], [worldSize, worldSize]], "ColorBlack", 8, "MapBorder1"] call FUNC(drawline);
[[[worldSize, worldSize], [worldSize, 0]], "ColorBlack", 8, "MapBorder2"] call FUNC(drawline);
[[[worldSize, 0], [0, 0]], "ColorBlack", 8, "MapBorder3"] call FUNC(drawline);
[[[0, 0], [0, worldSize]], "ColorBlack", 8, "MapBorder4"] call FUNC(drawline);
