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
                [[4012, 15365], [4012, 13954]],
                [[4012, 13954], [4431, 12617]],
                [[4431, 12617], [5241, 12168]],
                [[5241, 12168], [6472, 13118]],
                [[6472, 13118], [7337, 13786]],
                [[7337, 13786], [7337, 15365]],
                [[7337, 15365], [4012, 15365]]
            ],

            [   // Flaggen-Positionen
                [4978, 15103, 0],
                [4909, 13047, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [7337, 15365], [4012, 15365], [6472, 13118],
                [6472, 13118], [7337, 13786], [7337, 15365],
                [6472, 13118], [4012, 15365], [4012, 13954],
                [4431, 12617], [6472, 13118], [4012, 13954],
                [4431, 12617], [5241, 12168], [6472, 13118]
            ],

            [   // Sektormarker-Position
                [5430, 14174]
            ]
        ],

        [    // Sektor 2
            [   // Sektormarker
                [[7337, 15365], [7337, 13786]],
                [[7337, 13786], [6472, 13118]],
                [[6472, 13118], [7615, 12034]],
                [[7615, 12034], [9025, 12617]],
                [[9025, 12617], [8940, 15365]],
                [[8940, 15365], [7337, 15365]]
            ],

            [   // Flaggen-Positionen
                [7957, 14639, 0],
                [8169, 12737, 0],
                [8612, 13108, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [7337, 13786], [6472, 13118], [7615, 12034],
                [7337, 13786], [7615, 12034], [9025, 12617],
                [9025, 12617], [8940, 15365], [7337, 13786],
                [8940, 15365], [7337, 15365], [7337, 13786]
            ],

            [   // Sektormarker-Position
                [7961, 13910]
            ]
        ],

        [    // Sektor 3
            [   // Sektormarker
                [[11362, 13786], [10886, 15365]],
                [[10886, 15365], [8940, 15365]],
                [[8940, 15365], [9025, 12617]],
                [[9025, 12617], [9609, 11768]],
                [[9609, 11768], [9966, 12952]],
                [[9966, 12952], [11362, 13786]]
            ],

            [   // Flaggen-Positionen
                [9271, 13484, 0],
                [10286, 14153, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [10886, 15365], [8940, 15365], [9966, 12952],
                [11362, 13786], [10886, 15365], [9966, 12952],
                [8940, 15365], [9025, 12617], [9966, 12952],
                [9025, 12617], [9609, 11768], [9966, 12952]
            ],

            [   // Sektormarker-Position
                [9805, 14150]
            ]
        ],

        [    // Sektor 4
            [   // Sektormarker
                [[13191, 13287], [12646, 15365]],
                [[12646, 15365], [10886, 15365]],
                [[10886, 15365], [11362, 13786]],
                [[11362, 13786], [12573, 12542]],
                [[12573, 12542], [13191, 13287]]
            ],

            [   // Flaggen-Positionen
                [11575, 14728, 0],
                [12106, 13532, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [10886, 15365], [11362, 13786], [12646, 15365],
                [12646, 15365], [11362, 13786], [13191, 13287],
                [11362, 13786], [12573, 12542], [13191, 13287]
            ],

            [   // Sektormarker-Position
                [11952, 14158]
            ]
        ],

        [    // Sektor 5
            [   // Sektormarker
                [[15365, 11944], [13191, 13287]],
                [[13191, 13287], [12573, 12542]],
                [[12573, 12542], [11470, 10993]],
                [[11470, 10993], [11470, 9975]],
                [[11470, 9975], [11628, 8776]],
                [[11628, 8776], [15365, 8910]],
                [[15365, 8910], [15365, 11944]]
            ],

            [   // Flaggen-Positionen
                [13314, 11624, 0],
                [12831, 9974, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [12573, 12542], [11470, 10993], [15365, 11944],
                [13191, 13287], [12573, 12542], [15365, 11944],
                [15365, 11944], [11470, 10993], [15365, 8910],
                [15365, 8910], [11470, 10993], [11470, 9975],
                [15365, 8910], [11470, 9975], [11628, 8776]
            ],

            [   // Sektormarker-Position
                [13046, 10893]
            ]
        ],

        [    // Sektor 6
            [   // Sektormarker
                [[12573, 12542], [11362, 13786]],
                [[11362, 13786], [9966, 12952]],
                [[9966, 12952], [9609, 11768]],
                [[9609, 11768], [11470, 10993]],
                [[11470, 10993], [12573, 12542]]
            ],

            [   // Flaggen-Positionen
                [11133, 12311, 0],
                [10187, 12027, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [9966, 12952], [9609, 11768], [11470, 10993],
                [9966, 12952], [11470, 10993], [12573, 12542],
                [11362, 13786], [9966, 12952], [12573, 12542]
            ],

            [   // Sektormarker-Position
                [10946, 12585]
            ]
        ],

        [    // Sektor 7
            [   // Sektormarker
                [[9609, 11768], [9025, 12617]],
                [[9025, 12617], [7615, 12034]],
                [[7615, 12034], [7907, 11562]],
                [[7907, 11562], [8940, 9891]],
                [[8940, 9891], [9925, 9782]],
                [[9925, 9782], [11470, 10993]],
                [[11470, 10993], [9609, 11768]]
            ],

            [   // Flaggen-Positionen
                [8539, 11977, 0],
                [9657, 10437, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [7615, 12034], [7907, 11562], [9025, 12617],
                [9025, 12617], [7907, 11562], [9609, 11768],
                [7907, 11562], [8940, 9891], [9609, 11768],
                [9609, 11768], [8940, 9891], [9925, 9782],
                [9609, 11768], [9925, 9782], [11470, 10993]
            ],

            [   // Sektormarker-Position
                [9086, 11140]
            ]
        ],

        [    // Sektor 8
            [   // Sektormarker
                [[5241, 12168], [5241, 10871]],
                [[5241, 10871], [6204, 8533]],
                [[6204, 8533], [7869, 8622]],
                [[7869, 8622], [7481, 10278]],
                [[7481, 10278], [7907, 11562]],
                [[7907, 11562], [7615, 12034]],
                [[7615, 12034], [6472, 13118]],
                [[6472, 13118], [5241, 12168]]
            ],

            [   // Flaggen-Positionen
                [6891, 11426, 0],
                [5979, 10353, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [6472, 13118], [5241, 12168], [7615, 12034],
                [5241, 12168], [5241, 10871], [7615, 12034],
                [5241, 10871], [7481, 10278], [7615, 12034],
                [5241, 10871], [6204, 8533], [7481, 10278],
                [7481, 10278], [6204, 8533], [7869, 8622],
                [7615, 12034], [7481, 10278], [7907, 11562]
            ],

            [   // Sektormarker-Position
                [6308, 10845]
            ]
        ],

        [    // Sektor 9
            [   // Sektormarker
                [[4012, 13954], [1224, 12168]],
                [[1224, 12168], [5241, 12168]],
                [[5241, 12168], [4431, 12617]],
                [[4431, 12617], [4012, 13954]]
            ],

            [   // Flaggen-Positionen
                [3493, 13098, 0],
                [2832, 12406, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [4012, 13954], [1224, 12168], [4431, 12617],
                [4431, 12617], [1224, 12168], [5241, 12168]
            ],

            [   // Sektormarker-Position
                [3203, 12753]
            ]
        ],

        [    // Sektor 10
            [   // Sektormarker
                [[1224, 12168], [1582, 10006]],
                [[1582, 10006], [3703, 10993]],
                [[3703, 10993], [4193, 10438]],
                [[4193, 10438], [5241, 10871]],
                [[5241, 10871], [5241, 12168]],
                [[5241, 12168], [1224, 12168]]
            ],

            [   // Flaggen-Positionen
                [4115, 11777, 0],
                [2516, 10988, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [1224, 12168], [3703, 10993], [5241, 12168],
                [1224, 12168], [1582, 10006], [3703, 10993],
                [5241, 12168], [3703, 10993], [5241, 10871],
                [3703, 10993], [4193, 10438], [5241, 10871]
            ],

            [   // Sektormarker-Position
                [3288, 11469]
            ]
        ],

        [    // Sektor 11
            [   // Sektormarker
                [[1224, 12168], [0, 14449]],
                [[0, 14449], [0, 8185]],
                [[0, 8185], [1582, 10006]],
                [[1582, 10006], [1224, 12168]]
            ],

            [   // Flaggen-Positionen
                [515, 11084, 0],
                [309, 9412, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [0, 14449], [0, 8185], [1224, 12168],
                [1224, 12168], [0, 8185], [1582, 10006]
            ],

            [   // Sektormarker-Position
                [401, 11356]
            ]
        ],

        [    // Sektor 12
            [   // Sektormarker
                [[1582, 10006], [0, 8185]],
                [[0, 8185], [2337, 8370]],
                [[2337, 8370], [3547, 9603]],
                [[3547, 9603], [3703, 10993]],
                [[3703, 10993], [1582, 10006]]
            ],

            [   // Flaggen-Positionen
                [1398, 9255, 0],
                [2748, 10011, 0],
                [1607, 8964.5, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [1582, 10006], [0, 8185], [2337, 8370],
                [1582, 10006], [2337, 8370], [3547, 9603],
                [1582, 10006], [3547, 9603], [3703, 10993]
            ],

            [   // Sektormarker-Position
                [1974, 9520]
            ]
        ],

        [    // Sektor 13
            [   // Sektormarker
                [[3703, 10993], [3547, 9603]],
                [[3547, 9603], [4431, 9212]],
                [[4431, 9212], [4315, 8042]],
                [[4315, 8042], [4671, 7686]],
                [[4671, 7686], [6204, 8533]],
                [[6204, 8533], [5241, 10871]],
                [[5241, 10871], [4193, 10438]],
                [[4193, 10438], [3703, 10993]]
            ],

            [   // Flaggen-Positionen
                [4620, 9678, 0],
                [5369, 8558, 0],
                [4436, 8073, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [3703, 10993], [3547, 9603], [4193, 10438],
                [4193, 10438], [3547, 9603], [4431, 9212],
                [4193, 10438], [4431, 9212], [5241, 10871],
                [5241, 10871], [4431, 9212], [6204, 8533],
                [4431, 9212], [4671, 7686], [6204, 8533],
                [4431, 9212], [4315, 8042], [4671, 7686]
            ],

            [   // Sektormarker-Position
                [4856, 9249]
            ]
        ],

        [    // Sektor 14
            [   // Sektormarker
                [[5061, 7057], [5888, 6573]],
                [[5888, 6573], [7481, 6124]],
                [[7481, 6124], [7869, 8622]],
                [[7869, 8622], [6204, 8533]],
                [[6204, 8533], [4671, 7686]],
                [[4671, 7686], [5061, 7057]]
            ],

            [   // Flaggen-Positionen
                [6092, 7766, 0],
                [7081, 7707, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [4671, 7686], [5061, 7057], [6204, 8533],
                [5061, 7057], [5888, 6573], [6204, 8533],
                [6204, 8533], [5888, 6573], [7481, 6124],
                [6204, 8533], [7481, 6124], [7869, 8622]
            ],

            [   // Sektormarker-Position
                [6284, 7468]
            ]
        ],

        [    // Sektor 15
            [   // Sektormarker
                [[11628, 8776], [11470, 9975]],
                [[11470, 9975], [11470, 10993]],
                [[11470, 10993], [9925, 9782]],
                [[9925, 9782], [8940, 9891]],
                [[8940, 9891], [7907, 11562]],
                [[7907, 11562], [7481, 10278]],
                [[7481, 10278], [7869, 8622]],
                [[7869, 8622], [11077, 7384]],
                [[11077, 7384], [11628, 8776]]
            ],

            [   // Flaggen-Positionen
                [8104, 9305, 0],
                [9416, 8833, 0],
                [8146, 11014, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [7907, 11562], [7481, 10278], [8940, 9891],
                [7481, 10278], [7869, 8622], [8940, 9891],
                [8940, 9891], [7869, 8622], [9925, 9782],
                [9925, 9782], [7869, 8622], [11077, 7384],
                [9925, 9782], [11077, 7384], [11628, 8776],
                [11470, 9975], [9925, 9782], [11628, 8776],
                [9925, 9782], [11470, 9975], [11470, 10993]
            ],

            [   // Sektormarker-Position
                [9310, 9097]
            ]
        ],

        [    // Sektor 16
            [   // Sektormarker
                [[15365, 8910], [11628, 8776]],
                [[11628, 8776], [11077, 7384]],
                [[11077, 7384], [10412, 5701]],
                [[10412, 5701], [11470, 5870]],
                [[11470, 5870], [12430, 5519]],
                [[12430, 5519], [15365, 3243]],
                [[15365, 3243], [15365, 8910]]
            ],

            [   // Flaggen-Positionen
                [13138, 7019, 0],
                [12239, 6291, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [11077, 7384], [10412, 5701], [11470, 5870],
                [12430, 5519], [11077, 7384], [11470, 5870],
                [11628, 8776], [11077, 7384], [12430, 5519],
                [11628, 8776], [12430, 5519], [15365, 8910],
                [12430, 5519], [15365, 3243], [15365, 8910]
            ],

            [   // Sektormarker-Position
                [12567, 6782]
            ]
        ],

        [    // Sektor 17
            [   // Sektormarker
                [[9548, 5665], [10412, 5701]],
                [[10412, 5701], [11077, 7384]],
                [[11077, 7384], [7869, 8622]],
                [[7869, 8622], [7481, 6124]],
                [[7481, 6124], [7374, 4529]],
                [[7374, 4529], [9017, 4070]],
                [[9017, 4070], [9548, 5665]]
            ],

            [   // Flaggen-Positionen
                [9632, 6582, 0],
                [8338, 5987, 0],
                [8133, 7792, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [9548, 5665], [7481, 6124], [7374, 4529],
                [7869, 8622], [7481, 6124], [9548, 5665],
                [11077, 7384], [7869, 8622], [9548, 5665],
                [11077, 7384], [9548, 5665], [10412, 5701],
                [9548, 5665], [7374, 4529], [9017, 4070]
            ],

            [   // Sektormarker-Position
                [8623, 6526]
            ]
        ],

        [    // Sektor 18
            [   // Sektormarker
                [[3419, 5963], [4431, 5277]],
                [[4431, 5277], [5888, 6573]],
                [[5888, 6573], [5061, 7057]],
                [[5061, 7057], [4671, 7686]],
                [[4671, 7686], [4315, 8042]],
                [[4315, 8042], [2803, 6185]],
                [[2803, 6185], [3419, 5963]]
            ],

            [   // Flaggen-Positionen
                [4450, 6471, 0],
                [3691, 5997, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [2803, 6185], [3419, 5963], [4315, 8042],
                [4315, 8042], [3419, 5963], [4671, 7686],
                [4671, 7686], [3419, 5963], [5061, 7057],
                [3419, 5963], [4431, 5277], [5061, 7057],
                [5061, 7057], [4431, 5277], [5888, 6573]
            ],

            [   // Sektormarker-Position
                [4185, 6678]
            ]
        ],

        [    // Sektor 19
            [   // Sektormarker
                [[2337, 8370], [2188, 6407]],
                [[2188, 6407], [2803, 6185]],
                [[2803, 6185], [4315, 8042]],
                [[4315, 8042], [4431, 9212]],
                [[4431, 9212], [3547, 9603]],
                [[3547, 9603], [2337, 8370]]
            ],

            [   // Flaggen-Positionen
                [3042,7869, 0],
                [3800, 8846, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [2337, 8370], [2188, 6407], [2803, 6185],
                [2337, 8370], [2803, 6185], [4315, 8042],
                [3547, 9603], [2337, 8370], [4315, 8042],
                [4431, 9212], [3547, 9603], [4315, 8042]
            ],

            [   // Sektormarker-Position
                [3107, 8123]
            ]
        ],

        [    // Sektor 20
            [   // Sektormarker
                [[2337, 8370], [0, 8185]],
                [[0, 8185], [0, 5963]],
                [[0, 5963], [2188, 6407]],
                [[2188, 6407], [2337, 8370]]
            ],

            [   // Flaggen-Positionen
                [1026, 7639, 0],
                [1110, 6637, 0],
                [2013, 7337.5, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [0, 8185], [2188, 6407], [2337, 8370],
                [0, 8185], [0, 5963], [2188, 6407]
            ],

            [   // Sektormarker-Position
                [912, 7245]
            ]
        ],

        [    // Sektor 21
            [   // Sektormarker
                [[0, 3741], [1873, 4376]],
                [[1873, 4376], [3741, 3490]],
                [[3741, 3490], [4431, 5277]],
                [[4431, 5277], [3419, 5963]],
                [[3419, 5963], [2803, 6185]],
                [[2803, 6185], [2188, 6407]],
                [[2188, 6407], [0, 5963]],
                [[0, 5963], [0, 3741]]
            ],

            [   // Flaggen-Positionen
                [2757, 5448, 0],
                [2513, 5070, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [2188, 6407], [0, 5963], [1873, 4376],
                [2803, 6185], [2188, 6407], [1873, 4376],
                [2803, 6185], [1873, 4376], [3419, 5963],
                [3419, 5963], [1873, 4376], [3741, 3490],
                [4431, 5277], [3419, 5963], [3741, 3490],
                [0, 5963], [0, 3741], [1873, 4376]
            ],

            [   // Sektormarker-Position
                [1806, 5201]
            ]
        ],

        [    // Sektor 22
            [   // Sektormarker
                [[4431, 5277], [3741, 3490]],
                [[3741, 3490], [4215, 1681]],
                [[4215, 1681], [7374, 4529]],
                [[7374, 4529], [7481, 6124]],
                [[7481, 6124], [5888, 6573]],
                [[5888, 6573], [4431, 5277]]
            ],

            [   // Flaggen-Positionen
                [4540, 4546, 0],
                [6568, 5585, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [4431, 5277], [3741, 3490], [7374, 4529],
                [5888, 6573], [4431, 5277], [7374, 4529],
                [7481, 6124], [5888, 6573], [7374, 4529],
                [3741, 3490], [4215, 1681], [7374, 4529]
            ],

            [   // Sektormarker-Position
                [5518, 4571]
            ]
        ],

        [    // Sektor 23
            [   // Sektormarker
                [[8047, 2068], [8976, 3243]],
                [[8976, 3243], [9017, 4070]],
                [[9017, 4070], [7374, 4529]],
                [[7374, 4529], [4215, 1681]],
                [[4215, 1681], [3199, 0]],
                [[3199, 0], [8303, 0]],
                [[8303, 0], [8047, 2068]]
            ],

            [   // Flaggen-Positionen
                [6752, 2528, 0],
                [7250, 3033, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [4215, 1681], [3199, 0], [8303, 0],
                [8047, 2068], [4215, 1681], [8303, 0],
                [7374, 4529], [4215, 1681], [8047, 2068],
                [7374, 4529], [8047, 2068], [8976, 3243],
                [7374, 4529], [8976, 3243], [9017, 4070]
            ],

            [   // Sektormarker-Position
                [6955, 2711]
            ]
        ],

        [    // Sektor 24
            [   // Sektormarker
                [[8976, 3243], [8047, 2068]],
                [[8047, 2068], [8303, 0]],
                [[8303, 0], [11048, 0]],
                [[11048, 0], [12477, 1810]],
                [[12477, 1810], [11372, 3678]],
                [[11372, 3678], [8976, 3243]]
            ],

            [   // Flaggen-Positionen
                [10130, 1910, 0],
                [10510, 2256, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [8976, 3243], [8047, 2068], [11048, 0],
                [11372, 3678], [8976, 3243], [11048, 0],
                [12477, 1810], [11372, 3678], [11048, 0],
                [11048, 0], [8047, 2068], [8303, 0]
            ],

            [   // Sektormarker-Position
                [9797, 2112]
            ]
        ],

        [    // Sektor 25
            [   // Sektormarker
                [[8976, 3243], [11372, 3678]],
                [[11372, 3678], [12477, 1810]],
                [[12477, 1810], [13999, 2286]],
                [[13999, 2286], [15365, 1621]],
                [[15365, 1621], [15365, 3243]],
                [[15365, 3243], [12430, 5519]],
                [[12430, 5519], [11470, 5870]],
                [[11470, 5870], [10412, 5701]],
                [[10412, 5701], [9548, 5665]],
                [[9548, 5665], [9017, 4070]],
                [[9017, 4070], [8976, 3243]]
            ],

            [   // Flaggen-Positionen
                [11252, 4286, 0],
                [12813, 4487, 0]
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [9017, 4070], [8976, 3243], [11372, 3678],
                [11372, 3678], [10412, 5701], [9017, 4070],
                [11372, 3678], [11470, 5870], [10412, 5701],
                [12430, 5519], [11470, 5870], [11372, 3678],
                [13999, 2286], [12430, 5519], [11372, 3678],
                [12430, 5519], [13999, 2286], [15365, 3243],
                [13999, 2286], [15365, 1621], [15365, 3243],
                [13999, 2286], [11372, 3678], [12477, 1810],
                [10412, 5701], [9548, 5665], [9017, 4070]
            ],

            [   // Sektormarker-Position
                [12160, 4140]
            ]
        ],

        [    // Sektor 26 NATO Mainbase süd/west
            [   // Sektormarker
                [[0, 3741], [0, 0]],
                [[0, 0], [3199, 0]],
                [[3199, 0], [4215, 1681]],
                [[4215, 1681], [3741, 3490]],
                [[3741, 3490], [1873, 4376]],
                [[1873, 4376], [0, 3741]]
            ],

            [   // Flaggen-Positionen
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [1873, 4376], [0, 3741], [3199, 0],
                [4215, 1681], [1873, 4376], [3199, 0],
                [4215, 1681], [3741, 3490], [1873, 4376],
                [0, 3741], [0, 0], [3199, 0]
            ],

            [   // Sektormarker-Position
            ]
        ],

        [    // Sektor 27 NATO Außenposten nord/ost
            [   // Sektormarker
                [[15365, 15365], [12646, 15365]],
                [[12646, 15365], [13191, 13287]],
                [[13191, 13287], [15365, 11944]],
                [[15365, 11944], [15365, 15365]]
            ],

            [   // Flaggen-Positionen
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [12646, 15365], [13191, 13287], [15365, 15365],
                [13191, 13287], [15365, 11944], [15365, 15365]
            ],

            [   // Sektormarker-Position
            ]
        ],

        [    // Sektor 28 CSAT Mainbase nord/west
            [   // Sektormarker
                [[4012, 15365], [0, 15365]],
                [[0, 15365], [0, 14449]],
                [[0, 14449], [1224, 12168]],
                [[1224, 12168], [4012, 13954]],
                [[4012, 13954], [4012, 15365]]
            ],

            [   // Flaggen-Positionen
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [4012, 15365], [0, 15365], [0, 14449],
                [4012, 15365], [0, 14449], [4012, 13954],
                [0, 14449], [1224, 12168], [4012, 13954]
            ],

            [   // Sektormarker-Position
            ]
        ],

        [    // Sektor 29 CSAT Außenposten süd/ost
            [   // Sektormarker
                [[15365, 0], [15365, 1621]],
                [[15365, 1621], [13999, 2286]],
                [[13999, 2286], [12477, 1810]],
                [[12477, 1810], [11048, 0]],
                [[11048, 0], [15365, 0]]
            ],

            [   // Flaggen-Positionen
            ],

            [   // Beam-Positionen
            ],

            [   // Sektor-Dreiecke
                [12477, 1810], [11048, 0], [15365, 0],
                [15365, 0], [13999, 2286], [12477, 1810],
                [15365, 1621], [13999, 2286], [15365, 0]
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
