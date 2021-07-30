/**
* Description: Datensatz für den Dialog
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

#define saleReturnValueForOwn 0.50
#define saleReturnValueForEnemy 2.00
#define COST(var1) var1, saleReturnValueForOwn * var1,  saleReturnValueForEnemy * var1

// COST(xxxxx) -> wird nicht angezeigt im Shop

GVAR(nato_vehicles) =
[
    ["OPT_B_Quadbike_01_F", COST(10000)],
    ["OPT_B_T_LSV_01_unarmed_F", COST(25000)],
    ["OPT_B_T_LSV_01_armed_F", COST(35000)],
    ["OPT_B_LSV_01_AT_F", COST(250000)],
    ["OPT_B_MRAP_01_F", COST(20000)],
    ["OPT_B_MRAP_01_hmg_F", COST(80000)],
    ["OPT_B_Truck_02_covered_F", COST(5000)],
    ["OPT_B_Truck_02_box_F", COST(5000)],
    ["OPT_B_Truck_02_medical_F", COST(5000)]
];

GVAR(csat_vehicles) =
[
    ["OPT_O_Quadbike_01_F", COST(10000)],
    ["OPT_O_T_LSV_02_unarmed_F", COST(25000)],
    ["OPT_O_T_LSV_02_armed_F", COST(35000)],
    ["OPT_O_LSV_02_AT_F", COST(250000)],
    ["OPT_O_MRAP_02_F", COST(200000)],
    ["OPT_O_MRAP_02_hmg_F", COST(80000)],
    ["OPT_O_Truck_02_covered_F", COST(5000)],
    ["OPT_O_Truck_02_box_F", COST(5000)],
    ["OPT_O_Truck_02_medical_F", COST(5000)]
];

GVAR(nato_vehicles_supply) =
[
    ["OPT_B_Truck_02_fuel_F", COST(5000)],
    ["OPT_B_Truck_02_ammo_F", COST(5000)]
];

GVAR(csat_vehicles_supply) =
[
    ["OPT_O_Truck_02_fuel_F", COST(5000)],
    ["OPT_O_Truck_02_ammo_F", COST(5000)]
];

GVAR(nato_choppers) =
[
    ["OPT_B_Heli_light_03_unarmed_F", COST(40000)],
    ["OPT_B_Heli_light_03_dynamicLoadout_F", COST(150000)],
    ["OPT_B_Heli_heavy_03_dynamicLoadout_F", COST(300000)],
    ["OPT_B_Heli_Transport_02_F", COST(45000)],
    ["OPT_B_Heli_Attack_01_F", COST(400000)]
];

GVAR(csat_choppers) =
[
    ["OPT_O_Heli_Light_02_unarmed_F", COST(40000)],
    ["OPT_O_Heli_Light_02_v2_F", COST(150000)],
    ["OPT_O_Heli_Light_02_v3_F", COST(300000)],
    ["OPT_O_Heli_Transport_04_covered_F", COST(45000)],
    ["OPT_O_Heli_Transport_04_box_F", COST(15000)],
    ["OPT_O_Heli_Transport_04_ammo_F", COST(45000)],
    ["OPT_O_Heli_Transport_04_fuel_F", COST(25000)],
    ["OPT_O_Heli_Attack_02_F", COST(400000)]
];

GVAR(nato_planes) =
[
    ["OPT_B_Plane_Fighter_03_dynamicLoadout_F", COST(500000)]
];

GVAR(csat_planes) =
[
    ["OPT_O_Plane_Fighter_03_dynamicLoadout_F", COST(500000)]
];

GVAR(nato_armored) =
[
    ["OPT_B_APC_tracked_03_cannon_F", COST(150000)],
    ["OPT_B_APC_Wheeled_03_cannon_F", COST(200000)],
    ["OPT_B_APC_Tracked_01_AA_F", COST(320000)],
    ["OPT_B_AFV_Wheeled_01_cannon_F", COST(300000)],
    ["OPT_B_MBT_03_cannon_F", COST(500000)],
    ["OPT_B_MBT_01_arty_F", COST(350000)],
    ["OPT_B_MBT_01_mlrs_F", COST(400000)]
];

GVAR(csat_armored) =
[
    ["OPT_O_APC_Wheeled_01_cannon_F", COST(150000)],
    ["OPT_O_APC_Tracked_02_cannon_F", COST(200000)],
    ["OPT_O_APC_Tracked_02_AA_F", COST(320000)],
    ["OPT_O_AFV_Wheeled_01_cannon_F", COST(300000)],
    ["OPT_O_MBT_02_cannon_F", COST(500000)],
    ["OPT_O_MBT_02_arty_F", COST(350000)],
    ["OPT_O_Truck_02_MRL_F", COST(400000)]
];

GVAR(nato_supplies) =
[
    ["OPT_B_CargoNet_01_ammo_F", COST(5000)],
    ["OPT_B_supplyCrate_F", COST(1000)],
    ["OPT_Box_NATO_Ammo_F", COST(40000)],
    ["OPT_Box_NATO_WpsSpecial_F", COST(60000)],
    ["OPT_Box_NATO_WpsSpecial_AT_L1", COST(225000)],
    ["OPT_Box_NATO_WpsSpecial_AT_L2", COST(200000)],
    ["OPT_Box_NATO_WpsSpecial_AT_L3", COST(101000)],
    ["OPT_Box_NATO_WpsSpecial_AA_F", COST(150000)],
    ["OPT_Box_NATO_WpsSpecial_Diver_F", COST(5000)],
    ["OPT_Box_NATO_UGL_F", COST(30000)],
    ["OPT_Box_NATO_Grenades_F", COST(50000)],
    ["OPT_NATO_Sprengstoffkiste", COST(200000)],
    ["OPT_NATO_Minenkiste", COST(80000)],
    ["OPT_FlexibleTank_01_forest_F", COST(1000)]
];

GVAR(csat_supplies) =
[
    ["OPT_O_CargoNet_01_ammo_F", COST(5000)],
    ["OPT_O_supplyCrate_F", COST(1000)],
    ["OPT_Box_East_Ammo_F", COST(40000)],
    ["OPT_Box_East_WpsSpecial_F", COST(60000)],
    ["OPT_Box_East_WpsSpecial_AT_L1", COST(225000)],
    ["OPT_Box_East_WpsSpecial_AT_L2", COST(200000)],
    ["OPT_Box_East_WpsSpecial_AT_L3", COST(101000)],
    ["OPT_Box_East_WpsSpecial_AA_F", COST(150000)],
    ["OPT_Box_East_WpsSpecial_Diver_F", COST(5000)],
    ["OPT_Box_CSAT_UGL_F", COST(30000)],
    ["OPT_Box_East_Grenades_F", COST(50000)],
    ["OPT_CSAT_Sprengstoffkiste", COST(200000)],
    ["OPT_CSAT_Minenkiste", COST(80000)],
    ["OPT_FlexibleTank_01_sand_F", COST(1000)]
];

GVAR(nato_static) =
[
    ["OPT_B_HMG_01_F", COST(10000)],
    ["OPT_B_HMG_01_high_F", COST(10000)],
    ["OPT_B_GMG_01_F", COST(75000)],
    ["OPT_B_GMG_01_high_F", COST(75000)],
    ["OPT_B_Mortar_01_F", COST(50000)],
    ["OPT_B_static_AA_F", COST(20000)],
    ["OPT_B_static_AT_F", COST(150000)]
];

GVAR(csat_static) =
[
    ["OPT_O_HMG_01_F", COST(10000)],
    ["OPT_O_HMG_01_high_F", COST(10000)],
    ["OPT_O_GMG_01_F", COST(75000)],
    ["OPT_O_GMG_01_high_F", COST(75000)],
    ["OPT_O_Mortar_01_F", COST(50000)],
    ["OPT_O_static_AA_F", COST(20000)],
    ["OPT_O_static_AT_F", COST(150000)]
];

GVAR(nato_sea) =
[
    ["OPT_B_Boat_Armed_01_minigun_F", COST(10000)],
    ["OPT_B_Boat_Transport_01_F", COST(500)],
    ["OPT_B_SDV_01_F", COST(2000)],
    ["OPT_B_C_Boat_Transport_02_F", COST(7000)]
];

GVAR(csat_sea) =
[
    ["OPT_O_Boat_Transport_01_F", COST(500)],
    ["OPT_O_Boat_Armed_01_hmg_F", COST(25000)],
    ["OPT_O_C_Boat_Transport_02_F", COST(12000)],
    ["OPT_O_SDV_01_F", COST(40000)]
];

GVAR(allNato) =
    GVAR(nato_vehicles) +
    GVAR(nato_vehicles_supply) +
    GVAR(nato_choppers) +
    GVAR(nato_planes) +
    GVAR(nato_armored) +
    GVAR(nato_supplies) +
    GVAR(nato_static) +
    GVAR(nato_sea);

GVAR(allCsat) =
    GVAR(csat_vehicles) +
    GVAR(csat_vehicles_supply) +
    GVAR(csat_choppers) +
    GVAR(csat_planes) +
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
    FahrzeugBoxEast6,
    FahrzeugBoxEast7,
    FahrzeugBoxEast8
];

GVAR(pad_veh_west) =
[
    FahrzeugBoxWest1,
    FahrzeugBoxWest2,
    FahrzeugBoxWest3,
    FahrzeugBoxWest4,
    FahrzeugBoxWest5,
    FahrzeugBoxWest6,
    FahrzeugBoxWest7,
    FahrzeugBoxWest8
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
