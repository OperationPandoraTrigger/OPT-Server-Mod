/**
* Description: Datensatz für alle Dinge die man kaufen kann
*
*
* Author:
* [GNC]Lord-MDB, form
*
* Arguments:
*
*
* Return value:
*
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
*
*/
#include "macros.hpp"

#define saleReturnValueForOwn 0.5
#define saleReturnValueForEnemy 2
#define COST(var1) var1, saleReturnValueForOwn * var1, saleReturnValueForEnemy * var1

// Items mit Kosten=0 werden im Shop nicht angezeigt!
// COST(123) wird automatisch durch 3 entsprechende Parameter ersetzt!

GVAR(DB_vehicles) =
[
//  ["Classname",                                   BuyPrice,   SellPrice,  SellPriceEnemy, NeedsCargo, GivesCargo, Draggable,  Carriable,  CanRepair,  CanBeam,    GrabOffset,     GrabDir,    HeightOffset,   Side,   HardCap],
    ["OPT_B_Quadbike_01_F",                         COST(10000),                            2,          2,          false,      false,      false,      true,       [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Quadbike
    ["OPT_O_Quadbike_01_F",                         COST(10000),                            2,          2,          false,      false,      false,      true,       [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Quadbike
    ["OPT_B_T_LSV_01_unarmed_F",                    COST(25000),                            5,          4,          false,      false,      false,      true,       [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Prowler unarmed
    ["OPT_O_T_LSV_02_unarmed_F",                    COST(25000),                            5,          4,          false,      false,      false,      true,       [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Prowler unarmed
    ["OPT_B_T_LSV_01_armed_F",                      COST(35000),                            5,          4,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Prowler armed
    ["OPT_O_T_LSV_02_armed_F",                      COST(35000),                            5,          4,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Prowler armed
    ["OPT_B_LSV_01_AT_F",                           COST(250000),                           5,          2,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [ 0,  2,  3]], // Prowler AT
    ["OPT_O_LSV_02_AT_F",                           COST(250000),                           5,          2,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [ 0,  2,  3]], // Prowler AT
    ["OPT_B_MRAP_01_F",                             COST(20000),                            5,          4,          false,      false,      false,      true,       [0, 3, 0.2],    0,          0.1,            west,   [ 5,  5,  5]], // Hunter
    ["OPT_O_MRAP_02_F",                             COST(20000),                            5,          4,          false,      false,      false,      true,       [0, 3, 0.2],    0,          0.1,            east,   [ 5,  5,  5]], // Ifrit
    ["OPT_B_MRAP_01_hmg_F",                         COST(80000),                            5,          4,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [ 5,  4,  4]], // Hunter HMG
    ["OPT_O_MRAP_02_hmg_F",                         COST(80000),                            5,          4,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [ 5,  4,  4]], // Ifrit HMG
    ["OPT_B_Truck_02_covered_F",                    COST(5000),                             10,         10,         false,      false,      false,      true,       [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Zamak Logistik LKW
    ["OPT_O_Truck_02_covered_F",                    COST(5000),                             10,         10,         false,      false,      false,      true,       [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Zamak Logistik LKW
    ["OPT_B_Truck_02_box_F",                        COST(10000),                            10,         2,          false,      false,      true,       true,       [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Zamak Reparatur LKW
    ["OPT_O_Truck_02_box_F",                        COST(10000),                            10,         2,          false,      false,      true,       true,       [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Zamak Reparatur LKW
    ["OPT_B_Truck_02_medical_F",                    COST(10000),                            10,         2,          false,      false,      false,      true,       [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Zamak Medical LKW
    ["OPT_O_Truck_02_medical_F",                    COST(10000),                            10,         2,          false,      false,      false,      true,       [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]]  // Zamak Medical LKW
];

GVAR(DB_vehicles_supply) =
[
//  ["Classname",                                   BuyPrice,   SellPrice,  SellPriceEnemy, NeedsCargo, GivesCargo, Draggable,  Carriable,  CanRepair,  CanBeam,    GrabOffset,     GrabDir,    HeightOffset,   Side,   HardCap],
    ["OPT_B_Truck_02_fuel_F",                       COST(10000),                            10,         2,          false,      false,      false,      true,       [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Zamak Tank LKW
    ["OPT_O_Truck_02_fuel_F",                       COST(10000),                            10,         2,          false,      false,      false,      true,       [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Zamak Tank LKW
    ["OPT_B_Truck_02_ammo_F",                       50000,      5000,       20000,          10,         2,          false,      false,      false,      true,       [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Zamak Munitions LKW
    ["OPT_O_Truck_02_ammo_F",                       50000,      5000,       20000,          10,         2,          false,      false,      false,      true,       [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Zamak Munitions LKW
    ["OPT_B_Slingload_01_Ammo_F",                   90000,      10000,      20000,          10,         0,          true,       false,      false,      false,      [0, 5, 0.05],   0,          0.1,            west,   [-1, -1, -1]], // Munitionscontainer
    ["OPT_B_Slingload_01_Fuel_F",                   COST(8000),                             10,         0,          true,       false,      false,      false,      [0, 5, 0.05],   0,          0.1,            west,   [-1, -1, -1]]  // Fuelcontainer
];

GVAR(DB_choppers) =
[
//  ["Classname",                                   BuyPrice,   SellPrice,  SellPriceEnemy, NeedsCargo, GivesCargo, Draggable,  Carriable,  CanRepair,  CanBeam,    GrabOffset,     GrabDir,    HeightOffset,   Side,   HardCap],
    ["OPT_B_Heli_light_03_unarmed_F",               40000,      10000,      100000,         0,          4,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.2,            west,   [-1, -1, -1]], // WY-55 Hellcat
    ["OPT_O_Heli_Light_02_unarmed_F",               40000,      10000,      100000,         0,          4,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.2,            east,   [-1, -1, -1]], // Orca
    ["OPT_B_Heli_light_03_dynamicLoadout_F",        150000,     10000,      20000,          0,          4,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.2,            west,   [ 0,  2,  3]], // WY-55 Hellcat CAS Light
    ["OPT_O_Heli_Light_02_v2_F",                    150000,     10000,      20000,          0,          4,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.2,            east,   [ 0,  2,  3]], // Orca CAS Light
    ["OPT_B_Heli_heavy_03_dynamicLoadout_F",        300000,     10000,      20000,          0,          4,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.2,            west,   [ 0,  1,  2]], // WY-55 Hellcat CAS Heavy
    ["OPT_O_Heli_Light_02_v3_F",                    300000,     10000,      20000,          0,          4,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.2,            east,   [ 0,  1,  2]], // Orca CAS Heavy
    ["OPT_B_Heli_Transport_02_F",                   45000,      10000,      20000,          0,          10,         false,      false,      false,      false,      [0, 3, 0.2],    0,          0,              west,   [-1, -1, -1]], // Mohawk
    ["OPT_O_Heli_Transport_04_covered_F",           45000,      10000,      20000,          0,          10,         false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Taru
    ["OPT_O_Heli_Transport_04_box_F",               45000,      10000,      20000,          0,          4,          false,      false,      true,       false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Taru Reparatur
    ["OPT_O_Heli_Transport_04_ammo_F",              60000,      10000,      20000,          0,          4,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Taru Munition
    ["OPT_O_Heli_Transport_04_fuel_F",              25000,      10000,      20000,          0,          4,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Taru Fuel
    ["OPT_O_Heli_Transport_04_F",                   15000,      10000,      20000,          0,          4,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Taru Kran
    ["OPT_B_Heli_Attack_01_F",                      COST(400000),                           0,          0,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Blackwood
    ["OPT_O_Heli_Attack_02_F",                      COST(400000),                           0,          0,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]]  // Kajman
];

GVAR(DB_planes) = [];

GVAR(DB_jets) =
[
//  ["Classname",                                   BuyPrice,   SellPrice,  SellPriceEnemy, NeedsCargo, GivesCargo, Draggable,  Carriable,  CanRepair,  CanBeam,    GrabOffset,     GrabDir,    HeightOffset,   Side,   HardCap],
    ["OPT_B_Plane_Fighter_03_dynamicLoadout_F",     COST(500000),                           0,          0,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.2,            west,   [-1, -1, -1]], // A-143 Buzzard
    ["OPT_O_Plane_Fighter_03_dynamicLoadout_F",     COST(500000),                           0,          0,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.2,            east,   [-1, -1, -1]]  // A-143 Buzzard
];

GVAR(DB_uavs) = [];

GVAR(DB_armored) =
[
//  ["Classname",                                   BuyPrice,   SellPrice,  SellPriceEnemy, NeedsCargo, GivesCargo, Draggable,  Carriable,  CanRepair,  CanBeam,    GrabOffset,     GrabDir,    HeightOffset,   Side,   HardCap],
    ["OPT_B_APC_tracked_03_cannon_F",               COST(150000),                           10,         2,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [ 0,  2,  4]], // Mora
    ["OPT_O_APC_Wheeled_01_cannon_F",               COST(150000),                           10,         2,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [ 0,  2,  4]], // Marshall
    ["OPT_B_APC_Wheeled_03_cannon_F",               COST(200000),                           10,         2,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [ 0,  2,  4]], // Gorgon
    ["OPT_O_APC_Tracked_02_cannon_F",               COST(200000),                           10,         2,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [ 0,  2,  4]], // BTR-K
    ["OPT_B_APC_Tracked_01_AA_F",                   COST(320000),                           10,         2,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [ 0,  1,  2]], // Cheetah
    ["OPT_O_APC_Tracked_02_AA_F",                   COST(320000),                           10,         2,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [ 0,  1,  2]], // Tigris
    ["OPT_B_AFV_Wheeled_01_cannon_F",               COST(300000),                           10,         2,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [ 0,  1,  2]], // Rhino
    ["OPT_O_AFV_Wheeled_01_cannon_F",               COST(300000),                           10,         2,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [ 0,  1,  2]], // Rhino
    ["OPT_B_MBT_03_cannon_F",                       COST(500000),                           10,         2,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [ 0,  0,  2]], // Kuma
    ["OPT_O_MBT_02_cannon_F",                       COST(500000),                           10,         2,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [ 0,  0,  2]], // T-100
    ["OPT_B_MBT_01_arty_F",                         COST(350000),                           10,         2,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [ 0,  1,  1]], // Rohr Arty
    ["OPT_O_MBT_02_arty_F",                         COST(350000),                           10,         2,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [ 0,  1,  1]], // Rohr Arty
    ["OPT_B_Truck_02_MRL_F",                        COST(400000),                           10,         2,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [ 0,  1,  1]], // Raketen Arty
    ["OPT_O_Truck_02_MRL_F",                        COST(400000),                           10,         2,          false,      false,      false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [ 0,  1,  1]]  // Raketen Arty
];

GVAR(DB_supplies) =
[
//  ["Classname",                                   BuyPrice,   SellPrice,  SellPriceEnemy, NeedsCargo, GivesCargo, Draggable,  Carriable,  CanRepair,  CanBeam,    GrabOffset,     GrabDir,    HeightOffset,   Side,   HardCap],
    ["OPT_B_CargoNet_01_ammo_F",                    COST(5000),                             2,          0,          true,       false,      false,      false,      [0, 2, 0.1],    0,          0.1,            west,   [-1, -1, -1]], // Ausrüstungskiste
    ["OPT_O_CargoNet_01_ammo_F",                    COST(5000),                             2,          0,          true,       false,      false,      false,      [0, 2, 0.1],    0,          0.1,            east,   [-1, -1, -1]], // Ausrüstungskiste
    ["OPT_B_supplyCrate_F",                         COST(1000),                             2,          0,          true,       true,       false,      false,      [0, 2, 0.1],    0,          0.1,            west,   [-1, -1, -1]], // Transportkiste
    ["OPT_O_supplyCrate_F",                         COST(1000),                             2,          0,          true,       true,       false,      false,      [0, 2, 0.1],    0,          0.1,            east,   [-1, -1, -1]], // Transportkiste
    ["OPT_Box_NATO_Ammo_F",                         40000,      10000,      20000,          2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Munitionskiste
    ["OPT_Box_East_Ammo_F",                         40000,      10000,      20000,          2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Munitionskiste
    ["OPT_Box_NATO_WpsSpecial_F",                   60000,      10000,      20000,          2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Scharfschützenkiste
    ["OPT_Box_East_WpsSpecial_F",                   60000,      10000,      20000,          2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Scharfschützenkiste
    ["OPT_Box_NATO_WpsSpecial_AT_L1",               225000,     10000,      20000,          2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // AT-Raketenkiste MAAWS MK1
    ["OPT_Box_East_WpsSpecial_AT_L1",               225000,     10000,      20000,          2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // AT-Raketenkiste MAAWS MK1
    ["OPT_Box_NATO_WpsSpecial_AT_L2",               200000,     10000,      20000,          2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // AT-Raketenkiste RPG-42
    ["OPT_Box_East_WpsSpecial_AT_L2",               200000,     10000,      20000,          2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // AT-Raketenkiste RPG-42
    ["OPT_Box_NATO_WpsSpecial_AT_L3",               101000,     10000,      20000,          2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // AT-Raketenkiste RPG-7
    ["OPT_Box_East_WpsSpecial_AT_L3",               101000,     10000,      20000,          2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // AT-Raketenkiste RPG-7
    ["OPT_Box_NATO_WpsSpecial_AA_F",                140000,     10000,      20000,          2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // AA-Raketenkiste
    ["OPT_Box_East_WpsSpecial_AA_F",                140000,     10000,      20000,          2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // AA-Raketenkiste
    ["OPT_Box_NATO_WpsSpecial_Diver_F",             COST(5000),                             2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Taucherkiste
    ["OPT_Box_East_WpsSpecial_Diver_F",             COST(5000),                             2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Taucherkiste
    ["OPT_Box_NATO_UGL_F",                          30000,      1000,       2000,           2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [ 5,  5,  5]], // Unterlaufgranatenkiste
    ["OPT_Box_CSAT_UGL_F",                          30000,      1000,       2000,           2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [ 5,  5,  5]], // Unterlaufgranatenkiste
    ["OPT_Box_NATO_Grenades_F",                     50000,      10000,      20000,          2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Granatenkiste
    ["OPT_Box_East_Grenades_F",                     50000,      10000,      20000,          2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Granatenkiste
    ["OPT_NATO_Sprengstoffkiste",                   200000,     10000,      20000,          2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Sprengstoffkiste
    ["OPT_CSAT_Sprengstoffkiste",                   200000,     10000,      20000,          2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Sprengstoffkiste
    ["OPT_NATO_Minenkiste",                         80000,      10000,      20000,          2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Minenkiste
    ["OPT_CSAT_Minenkiste",                         80000,      10000,      20000,          2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Minenkiste
    ["OPT_FlexibleTank_01_forest_F",                COST(1000),                             1,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Treibstoff Tank
    ["OPT_FlexibleTank_01_sand_F",                  COST(1000),                             1,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]] // Treibstoff Tank
];

GVAR(DB_static) =
[
//  ["Classname",                                   BuyPrice,   SellPrice,  SellPriceEnemy, NeedsCargo, GivesCargo, Draggable,  Carriable,  CanRepair,  CanBeam,    GrabOffset,     GrabDir,    HeightOffset,   Side,   HardCap],
    ["OPT_B_HMG_01_F",                              COST(10000),                            2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.2,            west,   [-1, -1, -1]], // Stand-HMG
    ["OPT_O_HMG_01_F",                              COST(10000),                            2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.2,            east,   [-1, -1, -1]], // Stand-HMG
    ["OPT_B_HMG_01_high_F",                         COST(10000),                            2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Stand-HMG erhöht
    ["OPT_O_HMG_01_high_F",                         COST(10000),                            2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Stand-HMG erhöht
    ["OPT_B_GMG_01_F",                              COST(75000),                            2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.2,            west,   [-1, -1, -1]], // Stand-GMG
    ["OPT_O_GMG_01_F",                              COST(75000),                            2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.2,            east,   [-1, -1, -1]], // Stand-GMG
    ["OPT_B_GMG_01_high_F",                         COST(75000),                            2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Stand-GMG erhöht
    ["OPT_O_GMG_01_high_F",                         COST(75000),                            2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Stand-GMG erhöht
    ["OPT_B_Mortar_01_F",                           COST(50000),                            2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Mörser
    ["OPT_O_Mortar_01_F",                           COST(50000),                            2,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Mörser
    ["OPT_B_static_AA_F",                           COST(20000),                            5,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Statische AA
    ["OPT_O_static_AA_F",                           COST(20000),                            5,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]], // Statische AA
    ["OPT_B_static_AT_F",                           COST(150000),                           5,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            west,   [-1, -1, -1]], // Statischer AT
    ["OPT_O_static_AT_F",                           COST(150000),                           5,          0,          true,       true,       false,      false,      [0, 3, 0.2],    0,          0.1,            east,   [-1, -1, -1]]  // Statischer AT
];

GVAR(DB_sea) =
[
//  ["Classname",                                   BuyPrice,   SellPrice,  SellPriceEnemy, NeedsCargo, GivesCargo, Draggable,  Carriable,  CanRepair,  CanBeam,    GrabOffset,     GrabDir,    HeightOffset,   Side,   HardCap],
    ["OPT_B_Boat_Armed_01_minigun_F",               COST(10000),                            5,          4,          true,       false,      false,      false,      [0, 2, 0.1],    0,          0,              west,   [-1, -1, -1]], // Speedboat Minigun
    ["OPT_O_Boat_Armed_01_hmg_F",                   COST(25000),                            5,          4,          true,       false,      false,      false,      [0, 2, 0.1],    0,          0,              east,   [-1, -1, -1]], // Speedboat HMG
    ["OPT_B_Boat_Transport_01_F",                   COST(500),                              5,          4,          true,       false,      false,      false,      [0, 2, 0.1],    0,          0,              west,   [-1, -1, -1]], // Assault Boat
    ["OPT_O_Boat_Transport_01_F",                   COST(500),                              5,          4,          true,       false,      false,      false,      [0, 2, 0.1],    0,          0,              east,   [-1, -1, -1]], // Assault Boat
    ["OPT_B_C_Boat_Transport_02_F",                 COST(7000),                             5,          4,          true,       false,      false,      false,      [0, 2, 0.1],    0,          0,              west,   [-1, -1, -1]], // Rhib unbewaffnet
    ["OPT_O_C_Boat_Transport_02_F",                 COST(12000),                            5,          4,          true,       false,      false,      false,      [0, 2, 0.1],    0,          0,              east,   [-1, -1, -1]], // Rhib unbewaffnet
    ["OPT_B_SDV_01_F",                              COST(2000),                             5,          0,          true,       false,      false,      false,      [0, 2, 0.1],    0,          0,              west,   [-1, -1, -1]], // U-Boot
    ["OPT_O_SDV_01_F",                              COST(40000),                            5,          0,          true,       false,      false,      false,      [0, 2, 0.1],    0,          0,              east,   [-1, -1, -1]], // U-Boot
    ["rksla3_lcvpmk5_1",                            COST(10000),                            0,          10,         true,       false,      false,      false,      [0, 2, 0.1],    0,          0,              east,   [-1, -1, -1]], // LCVP Mk5 - Personnel
    ["rksla3_lcvpmk5_viv",                          COST(10000),                            0,          10,         true,       false,      false,      false,      [0, 2, 0.1],    0,          0,              east,   [-1, -1, -1]]  // LCVP Mk5 - Vehicle-In-Vehicle
];

GVAR(DB_all) = GVAR(DB_vehicles) + GVAR(DB_vehicles_supply) + GVAR(DB_choppers) + GVAR(DB_planes) + GVAR(DB_jets) + GVAR(DB_uavs) + GVAR(DB_armored) + GVAR(DB_supplies) + GVAR(DB_static) + GVAR(DB_sea);

// Returns oldstyle shop-array for vehicles and sets cargo/repair stuff in the background
parse_DB =
{
    params ["_db", "_dbSide"];
    private _return = [];
    {
        _x params ["_Classname", "_BuyPrice", "_SellPrice", "_SellPriceEnemy", "_NeedsCargo", "_GivesCargo", "_Draggable", "_Carriable", "_CanRepair", "_CanBeam", "_GrabOffset", "_GrabDir", "_HeightOffset", "_Side", "_HardCap"];
        if (_Side == _dbSide) then
        {
            _return pushBack [_Classname, _BuyPrice, _SellPrice, _SellPriceEnemy];
            if (_GivesCargo > 0) then {GVAR(canTransportCargo) pushBack [_Classname, _GivesCargo];};
            if (_NeedsCargo > 0) then {GVAR(canBeTransported) pushBack [_Classname, _NeedsCargo];};
            if (_Draggable) then {GVAR(canBeDragged) pushBack [_Classname, _GrabOffset, _GrabDir];};
            if (_Carriable) then {GVAR(canBeCarried) pushBack [_Classname, _GrabOffset, _GrabDir];};
            if (_CanRepair) then {GVAR(repairClasses) pushBack _Classname;};
            if (_CanBeam) then {GVAR(beamClasses) pushBack _Classname;};
        };
    } forEach _db;
    _return;
};

// Returns only an array of classnames from that database
parse_class_from_DB =
{
    params ["_db"];
    private _return = [];
    {
        _x params ["_Classname", "_BuyPrice", "_SellPrice", "_SellPriceEnemy", "_NeedsCargo", "_GivesCargo", "_Draggable", "_Carriable", "_CanRepair", "_CanBeam", "_GrabOffset", "_GrabDir", "_HeightOffset", "_Side", "_HardCap"];
        _return pushBack _Classname;
    } forEach _db;
    _return;
};

GVAR(canTransportCargo) = [];
GVAR(canBeTransported) = [];
GVAR(canBeDragged) = [];
GVAR(canBeCarried) = [];
GVAR(repairClasses) = [];
GVAR(beamClasses) = [];

// Convert to oldstyle shop-arrays
GVAR(nato_vehicles) = ([GVAR(DB_vehicles), west] call parse_DB);
GVAR(csat_vehicles) = ([GVAR(DB_vehicles), east] call parse_DB);
GVAR(nato_vehicles_supply) = ([GVAR(DB_vehicles_supply), west] call parse_DB);
GVAR(csat_vehicles_supply) = ([GVAR(DB_vehicles_supply), east] call parse_DB);
GVAR(nato_choppers) = ([GVAR(DB_choppers), west] call parse_DB);
GVAR(csat_choppers) = ([GVAR(DB_choppers), east] call parse_DB);
GVAR(nato_planes) = ([GVAR(DB_planes), west] call parse_DB);
GVAR(csat_planes) = ([GVAR(DB_planes), east] call parse_DB);
GVAR(nato_jets) = ([GVAR(DB_jets), west] call parse_DB);
GVAR(csat_jets) = ([GVAR(DB_jets), east] call parse_DB);
GVAR(nato_uavs) = ([GVAR(DB_uavs), west] call parse_DB);
GVAR(csat_uavs) = ([GVAR(DB_uavs), east] call parse_DB);
GVAR(nato_armored) = ([GVAR(DB_armored), west] call parse_DB);
GVAR(csat_armored) = ([GVAR(DB_armored), east] call parse_DB);
GVAR(nato_supplies) = ([GVAR(DB_supplies), west] call parse_DB);
GVAR(csat_supplies) = ([GVAR(DB_supplies), east] call parse_DB);
GVAR(nato_static) = ([GVAR(DB_static), west] call parse_DB);
GVAR(csat_static) = ([GVAR(DB_static), east] call parse_DB);
GVAR(nato_sea) = ([GVAR(DB_sea), west] call parse_DB);
GVAR(csat_sea) = ([GVAR(DB_sea), east] call parse_DB);

// Classnames only for rule checks
GVAR(choppers) = [GVAR(DB_choppers)] call parse_class_from_DB;
GVAR(planes) = [GVAR(DB_planes)] call parse_class_from_DB;
GVAR(jets) = [GVAR(DB_jets)] call parse_class_from_DB;
GVAR(uavs) = [GVAR(DB_uavs)] call parse_class_from_DB;
GVAR(crew_vehicles) = [GVAR(DB_armored)] call parse_class_from_DB;

// Classnames only for category checks
GVAR(light) = [GVAR(DB_vehicles) + GVAR(DB_vehicles_supply)] call parse_class_from_DB;
GVAR(heavy) = [GVAR(DB_armored)] call parse_class_from_DB;
GVAR(air) = [GVAR(DB_choppers) + GVAR(DB_planes) + GVAR(DB_jets)] call parse_class_from_DB;
GVAR(boat) = [GVAR(DB_sea)] call parse_class_from_DB;
GVAR(supplies) = [GVAR(DB_supplies)] call parse_class_from_DB;
GVAR(static) = [GVAR(DB_static)] call parse_class_from_DB;

GVAR(allNato) =
    GVAR(nato_vehicles) +
    GVAR(nato_vehicles_supply) +
    GVAR(nato_choppers) +
    GVAR(nato_planes) +
    GVAR(nato_jets) +
    GVAR(nato_armored) +
    GVAR(nato_supplies) +
    GVAR(nato_static) +
    GVAR(nato_sea);

GVAR(allCsat) =
    GVAR(csat_vehicles) +
    GVAR(csat_vehicles_supply) +
    GVAR(csat_choppers) +
    GVAR(csat_planes) +
    GVAR(csat_jets) +
    GVAR(csat_armored) +
    GVAR(csat_supplies) +
    GVAR(csat_static) +
    GVAR(csat_sea);

GVAR(all) =
    GVAR(allNato) +
    GVAR(allCsat);

//Waffenkonfiguation
GVAR(raktenHeliWest) = [];
GVAR(gunHeliWest) = [];
GVAR(gunVehWest) = [];
GVAR(raktenHeliEast) = [];
GVAR(gunHeliEast) = [];
GVAR(gunVehEast) = [];

//COST Tarnung, Drahtkäfig, Datalinksystem
GVAR(COSTTarnung) = 10000;
GVAR(COSTDrahtkafig) = 10000;
GVAR(COSTDatalink) = 10000;

//West Einheiten
//[[Raketen], [Gun], [Drahtkäfig, Tranung], [Datalink], [Raketenmagzine, Gunmagazine]]
GVAR(pawnee) = [[4, 8, 9, 10, 11], [0, 1, 2], [0, 0], [1], [2, 2]];
GVAR(hellcat1) = [[4, 8, 9, 10, 11], [0, 1, 2], [0, 0], [1], [2, 2]];
GVAR(blackfoot) = [[0, 1, 4, 6, 8, 9, 10, 11, 12, 15], [3, 4, 5, 6, 7], [0, 0], [1], [4, 2]];
GVAR(hunterHMG) = [[], [0, 1, 2], [0, 0], [1], [0, 4]];
GVAR(hunterGMG) = [[], [7, 8, 9, 10, 11], [0, 0], [1], [0, 4]];
GVAR(prowlerHMG) = [[], [0, 1, 2, 3, 4, 5, 6], [0, 0], [1], [0, 4]];
GVAR(prowlerAT) = [[], [16, 43, 44], [0, 0], [1], [0, 4]];
GVAR(panther) = [[], [0, 1, 2, 7, 8, 9, 10, 11], [0, 0], [1], [0, 4]];
GVAR(marshall) = [[], [3, 4, 5, 6, 14, 15], [0, 0], [1], [0, 4]];
GVAR(mora) = [[], [3, 4, 5, 6, 12, 13], [0, 0], [1], [0, 4]];
GVAR(cheetah) = [[], [20, 22], [0, 0], [1], [0, 4]];
GVAR(slammerUp) = [[], [3, 4, 5, 6, 45, 27, 30, 28, 47, 31, 29, 32, 38], [0, 0], [1], [0, 4]];
GVAR(scorcher) = [[], [40, 42], [0, 0], [1], [0, 4]];

//EAST Einheiten
GVAR(orca) = [[4, 8, 9, 10, 11], [0, 1, 2], [0, 0], [1], [2, 2]];
GVAR(hellcat)  =  [[4, 8, 9, 10, 11], [0, 1, 2], [0, 0], [1], [2, 2]];
GVAR(kajman) = [[0, 1, 4, 6, 8, 9, 10, 11, 12, 15], [3, 4, 5, 6, 7], [0, 0], [1], [4, 2]];
GVAR(irifHMG) = [[], [0, 1, 2], [0, 0], [1], [0, 4]];
GVAR(irifGMG) = [[], [7, 8, 9, 10, 11], [0, 0], [1], [0, 4]];
GVAR(striderGMG)  =  [[], [7, 8, 9, 10, 11], [0, 0], [1], [0, 4]];
GVAR(quilinHMG) = [[], [0, 1, 2, 3, 4, 5, 6], [0, 0], [1], [0, 4]];
GVAR(quilinAT) = [[], [16, 43, 44], [0, 0], [1], [0, 4]];
GVAR(marid) = [[], [0, 1, 2, 3, 7, 8, 9, 10, 11], [0, 0], [1], [0, 4]];
GVAR(gorgon) = [[], [3, 4, 5, 6, 12, 13], [0, 0], [1], [0, 4]];
GVAR(kamysh) = [[], [3, 4, 5, 6, 12, 13, 16], [0, 0], [1], [0, 4]];
GVAR(tigris) = [[], [20, 22], [0, 0], [1], [0, 4]];
GVAR(varsuk) = [[], [3, 4, 5, 6, 33, 46, 36, 34, 37, 35, 39], [0, 0], [1], [0, 4]];
GVAR(Angara) = [[], [3, 4, 5, 6, 33, 46, 36, 34, 37, 35, 39], [0, 0], [1], [0, 4]];
GVAR(sochor) = [[], [40, 42], [0, 0], [1], [0, 4]];

//Fahrzeuge die zugelassen sind
GVAR(vehClassWestWW) = [];
GVAR(vehClassEastWW) = [];

//West Einheiten Loadouts
//[[Raketen], [Gun], [Drahtkäfig, Tranung], [Datalink]]
GVAR(pawneeLoadout) = [[4,4], [0], [0, 0], [0]];
GVAR(hellcat1Loadout) = [[4,4], [0], [0, 0], [0]];
GVAR(blackfootLoadout) = [[4 , 4, 12, 15], [3], [0, 0], [0]];
GVAR(hunterHMGLoadout) = [[], [0], [0, 0], [0]];
GVAR(hunterGMGLoadout) = [[], [7], [0, 0], [0]];
GVAR(prowlerHMGLoadout) = [[], [0], [0, 0], [0]];
GVAR(prowlerATLoadout) = [[], [16, 16], [0, 0], [0]];
GVAR(pantherLoadout) = [[], [0, 11], [0, 0], [0]];
GVAR(marshallLoadout) = [[], [3, 14, 15], [0, 0], [0]];
GVAR(moraLoadout) = [[], [3, 12, 13], [0, 0], [0]];
GVAR(cheetahLoadout) = [[], [20, 22], [0, 0], [0]];
GVAR(slammerUpLoadout) = [[], [3, 45, 28, 29], [0, 0], [0]];
GVAR(scorcherLoadout) = [[], [40,40], [0, 0], [0]];

//EAST Einheiten Loadouts
GVAR(orcaLoadout) = [[4,4], [0], [0, 0], [0]];
GVAR(hellcatloadout)  =  [[4,4], [0], [0, 0], [0]];
GVAR(kajmanLoadout) = [[4 , 4, 12, 15], [3], [0, 0], [0]];
GVAR(irifHMGLoadout) = [[], [0], [0, 0], [0]];
GVAR(irifGMGLoadout) = [[], [7], [0, 0], [0]];
GVAR(striderGMGLoadout)  =  [[], [3], [0, 0], [0]];
GVAR(quilinHMGLoadout) = [[], [0], [0, 0], [0]];
GVAR(quilinATLoadout) = [[], [16, 16], [0, 0], [0]];
GVAR(maridLoadout) = [[], [0, 11], [0, 0], [0]];
GVAR(gorgonLoadout) = [[], [3, 12, 13], [0, 0], [0]];
GVAR(kamyshLoadout) = [[], [3, 12, 13], [0, 0], [0]];
GVAR(tigrisLoadout) = [[], [20, 22], [0, 0], [0]];
GVAR(varsukLoadout) = [[], [3, 33, 34, 35], [0, 0], [0]];
GVAR(AngaraLoadout) = [[], [3, 33, 34, 35], [0, 0], [0]];
GVAR(sochorLoadout) = [[], [40,40], [0, 0], [0]];

//Pads für Bestellung und Verkauf
GVAR(pad_veh_east) =
[
    FahrzeugBoxEast1,
    FahrzeugBoxEast2,
    FahrzeugBoxEast3,
    FahrzeugBoxEast4,
    FahrzeugBoxEast5,
    FahrzeugBoxEast6
];

GVAR(pad_veh_west) =
[
    FahrzeugBoxWest1,
    FahrzeugBoxWest2,
    FahrzeugBoxWest3,
    FahrzeugBoxWest4,
    FahrzeugBoxWest5,
    FahrzeugBoxWest6
];

GVAR(pad_air_east) =
[
    HeliBoxEast1,
    HeliBoxEast2
];

GVAR(pad_air_west) =
[
    HeliBoxWest1,
    HeliBoxWest2
];

GVAR(pad_plane_east) =
[
    PlaneBoxEast
];

GVAR(pad_plane_west) =
[
    PlaneBoxWest
];

GVAR(pad_sup_east) =
[
    AusruestungBoxEast1,
    AusruestungBoxEast2,
    AusruestungBoxEast3,
    AusruestungBoxEast4,
    AusruestungBoxEast5,
    AusruestungBoxEast6,
    AusruestungBoxEast7,
    AusruestungBoxEast8
];

GVAR(pad_sup_west) =
[
    AusruestungBoxWest1,
    AusruestungBoxWest2,
    AusruestungBoxWest3,
    AusruestungBoxWest4,
    AusruestungBoxWest5,
    AusruestungBoxWest6,
    AusruestungBoxWest7,
    AusruestungBoxWest8
];

GVAR(pad_sea_west) =
[
    SeaBoxWest1,
    SeaBoxWest2
];

GVAR(pad_sea_east) =
[
    SeaBoxEast1,
    SeaBoxEast2
];

GVAR(pad_all_west) =
    GVAR(pad_veh_west) +
    GVAR(pad_air_west) +
    GVAR(pad_plane_west) +
    GVAR(pad_sup_west) +
    GVAR(pad_sea_west);

GVAR(pad_all_east) =
    GVAR(pad_veh_east) +
    GVAR(pad_air_east) +
    GVAR(pad_plane_east) +
    GVAR(pad_sup_east) +
    GVAR(pad_sea_east);

GVAR(all_item_classnames) = [];
{
    GVAR(all_item_classnames) pushBackUnique (_x select 0);
} forEach GVAR(all);

GVAR(all_armored_classnames) = [];
{
    GVAR(all_armored_classnames) pushBackUnique (_x select 0);
} forEach (GVAR(nato_armored) + GVAR(csat_armored));
