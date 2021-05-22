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
        ],

        [    // Sektor 5
            [   // Sektormarker
                [[8552.6, 12780.6], [10643.7, 12793.9]],
                [[10643.7, 12793.9], [10660.6, 11011.6]],
                [[10660.6, 11011.6], [10071, 9872.63]],
                [[10071, 9872.63], [8926.27, 9629.99]],
                [[8926.27, 9629.99], [8688.62, 10629.8]],
                [[8688.62, 10629.8], [8552.6, 12780.6]]
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
                [[25.838, 9237.2], [1403.02, 8252.85]],
                [[1403.02, 8252.85], [3790.87, 9572.88]],
                [[3790.87, 9572.88], [3707.52, 8061.74]],
                [[3707.52, 8061.74], [3703.1, 7633.83]],
                [[3703.1, 7633.83], [1829.84, 7318.53]],
                [[1829.84, 7318.53], [28.5511, 7636.04]],
                [[28.5511, 7636.04], [25.838, 9237.2]]
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
                [[3819.35, 9590.16], [5214.6, 10911.4]],
                [[5214.6, 10911.4], [5766.59, 10413.3]],
                [[5766.59, 10413.3], [5761.76, 9302.59]],
                [[5761.76, 9302.59], [3726.01, 7647.43]],
                [[3726.01, 7647.43], [3725.2, 8069.87]],
                [[3725.2, 8069.87], [3819.35, 9590.16]]
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
                [[5785.6, 9301.38], [6352.06, 9758.41]],
                [[6352.06, 9758.41], [6976.46, 10067.4]],
                [[6976.46, 10067.4], [8042.61, 8094.41]],
                [[8042.61, 8094.41], [5734.1, 7115.17]],
                [[5734.1, 7115.17], [5736.49, 7648.43]],
                [[5736.49, 7648.43], [5785.6, 9301.38]]
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
                [[6991.67, 10080.7], [7726.5, 10669.4]],
                [[7726.5, 10669.4], [8671.19, 10607.8]],
                [[8671.19, 10607.8], [9270.85, 8104.32]],
                [[9270.85, 8104.32], [8063.35, 8106.15]],
                [[8063.35, 8106.15], [6991.67, 10080.7]]
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
                [[8937.7, 9606.06], [10094.5, 9860.12]],
                [[10094.5, 9860.12], [10684, 11004.1]],
                [[10684, 11004.1], [12793.6, 10999.8]],
                [[12793.6, 10999.8], [12788.8, 8101.69]],
                [[12788.8, 8101.69], [9293.98, 8106.44]],
                [[9293.98, 8106.44], [8937.7, 9606.06]]
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
                [[36.7323, 7609.03], [1840.18, 7302.39]],
                [[1840.18, 7302.39], [3709.79, 7611.58]],
                [[3709.79, 7611.58], [4173.76, 6120]],
                [[4173.76, 6120], [37.2176, 6119.14]],
                [[37.2176, 6119.14], [36.7323, 7609.03]]
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
                [[3727.52, 7622.04], [5763.28, 9283.63]],
                [[5763.28, 9283.63], [5716.05, 7645.81]],
                [[5716.05, 7645.81], [5716.38, 7091.02]],
                [[5716.38, 7091.02], [5914.7, 5930.91]],
                [[5914.7, 5930.91], [5185.04, 6115.54]],
                [[5185.04, 6115.54], [4192.95, 6119.96]],
                [[4192.95, 6119.96], [3727.52, 7622.04]]
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
                [[5735.3, 7087.41], [8062.21, 8084.86]],
                [[8062.21, 8084.86], [9277.42, 8085.86]],
                [[9277.42, 8085.86], [9601.98, 5842.75]],
                [[9601.98, 5842.75], [8365.26, 5842.59]],
                [[8365.26, 5842.59], [5932.88, 5931.45]],
                [[5932.88, 5931.45], [5735.3, 7087.41]]
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
                [[9294.78, 8087.25], [12792, 8085.68]],
                [[12792, 8085.68], [12791.9, 5966.05]],
                [[12791.9, 5966.05], [10177.9, 5843.81]],
                [[10177.9, 5843.81], [9624.67, 5843.64]],
                [[9624.67, 5843.64], [9294.78, 8087.25]]
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
                [[36.8133, 6100.97], [4174.86, 6101.6]],
                [[4174.86, 6101.6], [3609.31, 4462.82]],
                [[3609.31, 4462.82], [1461.14, 4905.22]],
                [[1461.14, 4905.22], [37.7257, 4230.45]],
                [[37.7257, 4230.45], [36.8133, 6100.97]]
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
                [[4195.61, 6101.03], [5188.41, 6101.88]],
                [[5188.41, 6101.88], [5917.55, 5915.04]],
                [[5917.55, 5915.04], [5735.42, 4213.63]],
                [[5735.42, 4213.63], [6115.73, 2978.74]],
                [[6115.73, 2978.74], [4379.31, 3695.97]],
                [[4379.31, 3695.97], [3627.75, 4455.92]],
                [[3627.75, 4455.92], [4195.61, 6101.03]]
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
                [[5934.28, 5913.24], [8368.43, 5826.23]],
                [[8368.43, 5826.23], [9035.87, 5826.04]],
                [[9035.87, 5826.04], [7705.14, 4457.88]],
                [[7705.14, 4457.88], [6672.36, 2100.96]],
                [[6672.36, 2100.96], [6137.28, 2968.96]],
                [[6137.28, 2968.96], [5751.58, 4216.67]],
                [[5751.58, 4216.67], [5934.28, 5913.24]]
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
                [[9063.08, 5826.4], [10180.7, 5826.42]],
                [[10180.7, 5826.42], [12791.8, 5947.08]],
                [[12791.8, 5947.08], [12790.9, 4079.74]],
                [[12790.9, 4079.74], [10285.3, 4773.76]],
                [[10285.3, 4773.76], [8358.33, 3484.01]],
                [[8358.33, 3484.01], [7724.12, 4452.81]],
                [[7724.12, 4452.81], [9063.08, 5826.4]]
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
                [[40.1007, 4209.11], [1465.28, 4886.87]],
                [[1465.28, 4886.87], [3604.89, 4446.73]],
                [[3604.89, 4446.73], [2651.49, 1887.95]],
                [[2651.49, 1887.95], [1239.43, 1650.8]],
                [[1239.43, 1650.8], [12.64, 1651.45]],
                [[12.64, 1651.45], [40.1007, 4209.11]]
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
                [[1251.71, 1635.86], [2656.42, 1871.81]],
                [[2656.42, 1871.81], [4880.36, 10.5179]],
                [[4880.36, 10.5179], [1249.34, 12.2307]],
                [[1249.34, 12.2307], [1251.71, 1635.86]]
            ],

            [   // Flaggen-Positionen
                [2799, 1620, true, "20_1 Tymbark"]
            ],

            [   // Beam-Positionen
            ]
        ],

        [    // Sektor 21
            [   // Sektormarker
                [[3621.03, 4436.9], [4370.11, 3680.77]],
                [[4370.11, 3680.77], [6125.47, 2956.29]],
                [[6125.47, 2956.29], [6667.47, 2077.79]],
                [[6667.47, 2077.79], [6902.35, 11.274]],
                [[6902.35, 11.274], [4906.27, 10.8971]],
                [[4906.27, 10.8971], [2667.62, 1883.49]],
                [[2667.62, 1883.49], [3621.03, 4436.9]]
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
                [[7712.97, 4434.83], [9406.09, 1929.31]],
                [[9406.09, 1929.31], [8133.52, 10.4034]],
                [[8133.52, 10.4034], [6920.96, 12.2131]],
                [[6920.96, 12.2131], [6683.15, 2079.24]],
                [[6683.15, 2079.24], [7712.97, 4434.83]]
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
                [[8368, 3469.28], [10290.3, 4758.31]],
                [[10290.3, 4758.31], [12792.9, 4060.96]],
                [[12792.9, 4060.96], [12791.7, 1179.44]],
                [[12791.7, 1179.44], [10947.5, 1179.46]],
                [[10947.5, 1179.46], [10832, 2587.9]],
                [[10832, 2587.9], [8891.66, 2710.53]],
                [[8891.66, 2710.53], [8368.92, 3469.03]],
                [[8368.92, 3469.03], [8368, 3469.28]]
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
                [[8903.87, 2690.61], [10818.7, 2572.53]],
                [[10818.7, 2572.53], [10931.2, 1168.87]],
                [[10931.2, 1168.87], [10978.3, 10.9787]],
                [[10978.3, 10.9787], [8154.85, 11.8027]],
                [[8154.85, 11.8027], [9426.48, 1928.78]],
                [[9426.48, 1928.78], [8903.87, 2690.61]]
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
GVAR(SectorMarkers) = [];
private _markerID = 0;

// CBA-Settings parsen, da dies sonst erst nach dem "Durchdrücken" geschieht
GVAR(nato_allsectors) = parseSimpleArray format ["[%1]", GVAR(nato_allsectors_str)]; 
GVAR(csat_allsectors) = parseSimpleArray format ["[%1]", GVAR(csat_allsectors_str)]; 
GVAR(aaf_allsectors) = parseSimpleArray format ["[%1]", GVAR(aaf_allsectors_str)]; 

// Sektormarker zeichnen (in unterschiedlichen Farben je Fraktion)
{
    {
        _markerID = _markerID + 1;
        private _markername = format ["SectorMarker_%1", _markerID];
        [_x, "colorBLUFOR", 8, _markername] call FUNC(drawline);
        GVAR(SectorMarkers) pushBack _markername;
    } forEach ((GVAR(AllSectors) select _x) select 0);
} forEach GVAR(nato_allsectors);

{
    {
        _markerID = _markerID + 1;
        private _markername = format ["SectorMarker_%1", _markerID];
        [_x, "ColorRed", 8, _markername] call FUNC(drawline);
        GVAR(SectorMarkers) pushBack _markername;
    } forEach ((GVAR(AllSectors) select _x) select 0);
} forEach GVAR(csat_allsectors);

{
    {
        _markerID = _markerID + 1;
        private _markername = format ["SectorMarker_%1", _markerID];
        [_x, "colorIndependent", 8, _markername] call FUNC(drawline);
        GVAR(SectorMarkers) pushBack _markername;
    } forEach ((GVAR(AllSectors) select _x) select 0);
} forEach GVAR(aaf_allsectors);

// Karten Umrandung
[[[0, worldSize], [worldSize, worldSize]], "ColorBlack", 8, "MapBorder1"] call FUNC(drawline);
[[[worldSize, worldSize], [worldSize, 0]], "ColorBlack", 8, "MapBorder2"] call FUNC(drawline);
[[[worldSize, 0], [0, 0]], "ColorBlack", 8, "MapBorder3"] call FUNC(drawline);
[[[0, 0], [0, worldSize]], "ColorBlack", 8, "MapBorder4"] call FUNC(drawline);
