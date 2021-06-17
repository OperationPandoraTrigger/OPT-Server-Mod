/**
* Description: Datensatz für den Dialog
* 
* 
* Author:
* [GNC]Lord-MDB
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
#define DEF_PROD(var1) var1, saleReturnValueForOwn * var1,  saleReturnValueForEnemy * var1 

// DEF_PROD(0) Einheit wird nicht angezeigt im Shop

//Nato Einheiten
GVAR(nato_vehicles) = 
[
/**
 * TeTeT: do be deleted
    ["OPT_B_Quadbike_01_F", DEF_PROD(0)],                    // Quadbike
    ["OPT_B_T_LSV_01_unarmed_F", DEF_PROD(0)],               // Prowler unarmed 
    ["OPT_B_T_LSV_01_armed_F", DEF_PROD(0)],                 // Prowler armed
    ["OPT_B_G_Offroad_01_F", DEF_PROD(0)],                   // Pickup
    ["OPT_B_G_Offroad_01_armed_F", DEF_PROD(0)],             // Pickup HMG
    ["OPT_B_MRAP_01_F", DEF_PROD(0)],                        // Hunter
    ["OPT4_B_MRAP_01_hmg_F", DEF_PROD(0)],                   // Hunter HMG
    ["OPT_B_Truck_01_covered_F", DEF_PROD(0)],               // HEMTT Transport
    ["OPT_B_Truck_01_Repair_F", DEF_PROD(0)],               // HEMTT Repair
    ["OPT_B_Truck_01_medical_F", DEF_PROD(0)],              // HEMTT Medical
    ["OPT_B_Truck_01_transport_F", DEF_PROD(0)],             // HEMTT  

//Tropentarn
    ["OPT_B_Quadbike_01_ghex_F", DEF_PROD(15000)],               // Quadbike
    ["OPT_B_T_LSV_01_unarmed_ghex_F", DEF_PROD(25000)],          // Prowler unarmed 
    ["OPT_B_T_LSV_01_armed_ghex_F", DEF_PROD(30000)],            // Prowler armed
    ["OPT_B_G_Offroad_01_ghex_F", DEF_PROD(0)],              // Pickup
    ["OPT_B_G_Offroad_01_armed_ghex_F", DEF_PROD(0)],           // Pickup HMG
    ["OPT_B_MRAP_01_ghex_F", DEF_PROD(15000)],                    // Hunter
    ["OPT4_B_MRAP_01_hmg_ghex_F", DEF_PROD(25000)],             // Hunter HMG
    ["OPT_B_Truck_01_covered_ghex_F", DEF_PROD(5000)],          // HEMTT Transport
    ["OPT_B_Truck_01_Repair_ghex_F",  10000, 5000, 20000],          // HEMTT Repair
    ["OPT_B_Truck_01_medical_ghex_F", 10000, 5000, 20000],         // HEMTT Medical
    ["OPT_B_Truck_01_transport_ghex_F", DEF_PROD(5000)]        // HEMTT      
**/
// CUP
    ["OPT_CUP_B_M1030_USA", DEF_PROD(15000)],               // Motorrad M1030 (0)
    ["OPT_CUP_B_LR_Transport_GB_W", DEF_PROD(25000)],       // Land Rover 110
    ["OPT_CUP_B_LR_MG_GB_W", DEF_PROD(30000)],              // Land Rover M2
    ["OPT_CUP_B_HMMWV_Unarmed_USMC", DEF_PROD(15000)],      // HMMWV
    ["OPT_CUP_B_HMMWV_M2_USMC", DEF_PROD(25000)],           // HMMWV M2
    ["OPT_CUP_B_MTVR_USMC", DEF_PROD(5000)],                // MTVR
    ["OPT_CUP_B_MTVR_Repair_USMC", 10000, 5000, 20000],     // MTVR Rep
    ["OPT_CUP_B_HMMWV_Ambulance_USMC", 10000, 5000, 20000]  // HMMWV Ambulance (0)
];

GVAR(nato_vehicles_supply) = 
[
/**
 * TeTeT: to be deleted
    ["OPT_B_Truck_01_ammo_F", DEF_PROD(0)],                         // HEMTT Ammo
    ["OPT_B_Truck_01_fuel_F", DEF_PROD(0)],                      // HEMTT Fuel

//Tropentarn
    ["OPT_B_Truck_01_ammo_ghex_F", 50000, 5000, 20000],            // HEMTT Ammo
    ["OPT_B_Truck_01_fuel_ghex_F", 10000, 5000, 20000]             // HEMTT Fuel
**/
    ["OPT_CUP_B_MTVR_Ammo_USMC",  50000, 5000, 20000],      // MTVR Ammo
    ["OPT_CUP_B_MTVR_Refuel_USMC", 10000, 5000, 20000]      // MTVR Tank
];    
  
GVAR(nato_choppers) = 
[
/**
 * TeTeT: to be deleted
    ["OPT_B_Heli_Light_01_F", DEF_PROD(0)],                 // MH-9 Hummingbird
    ["OPT4_B_Heli_Light_01_armed_F", DEF_PROD(0)],              // AH-9 Pawnee 
    ["OPT4_B_Heli_light_03_green_F", 50000, 10000, 100000],          // WY-55 Hellcat
    ["OPT_B_Heli_Transport_01_F", DEF_PROD(0)],             // UH-80 Ghosthawk
    ["OPT_B_Heli_Transport_02_F", DEF_PROD(0)],               // CH-49 Mohawk (Transport+Lift)
    ["OPT_B_Heli_Transport_03_unarmed_F", DEF_PROD(110000)],    // CH-67 Huron unarmed (Transport+Lift)
    ["OPT_B_Heli_Transport_03_F", DEF_PROD(150000)],            // CH-67 Huron armed (Transport+Lift)
    ["OPT_B_UAV_02_light_F", DEF_PROD(300000)],                 // Greyhawk unbewaffnet
    ["OPT_B_UAV_02_CAS_F", DEF_PROD(0)],                        // Greyhawk LGB
    ["OPT_B_UAV_02_F", DEF_PROD(0)],                            // Greyhawk Raketen    
    ["OPT4_B_Heli_Attack_01_F", DEF_PROD(0)],                   // AH-99 Blackfoot 
    ["OPT_B_T_VTOL_01_infantry_F", DEF_PROD(0)],                // VTOL Blackfish (Inf-Transport) 
    ["OPT_B_T_VTOL_01_vehicle_F", DEF_PROD(0)],                 // VTOL Blackfish (Fahrzeug-Transport)
    ["OPT_B_T_VTOL_02_infantry_unarmed_F", DEF_PROD(0)],           // VTOL Y-32 Xi'an (Inf-Transport)
    ["OPT_B_Plane_CAS_01_F", DEF_PROD(0)],                      // A-164 Wipeout
    ["OPT_B_Plane_Fighter_01_Stealth_F", DEF_PROD(0)]               // F/A-181 Black Wasp II   
**/
    ["OPT_CUP_MH60S_Unarmed_USN", DEF_PROD(110000)],        // MH-60S Seahawk
    ["OPT_CUP_B_UH1D_armed_GER_KSK", DEF_PROD(150000)],     // UH-1D
    ["OPT_CUP_B_CH53E_USMC", DEF_PROD(150000)],             // CH53G Super Stallion
    ["OPT_CUP_B_AH64D_DL_USA", DEF_PROD(300000)]            // AH-64
];

GVAR(nato_planes) = 
[
    ["C_Plane_Civil_01_F", 1, 0, 0],                            // Caesar BTT
    ["CUP_C_AN2_CIV", 1, 0, 0],                                 // Antonov An-2
    ["CUP_C_C47_CIV", 1, 0, 0],                                 // C-47 Skytrain
    ["OPT_CUP_B_L39_CZ_GREY", 1, 0, 0]                          // L-39AZ
];

GVAR(nato_armored) = 
[
/**
 * TeTeT: do be deleted
    ["OPT4_B_LSV_01_AT_F", DEF_PROD(0)],                     // Prowler AT 
    ["OPT4_B_MRAP_01_gmg_F", DEF_PROD(0)],                        // Hunter GMG 
    ["OPT4_B_APC_Tracked_01_rcws_F", DEF_PROD(0)],          // IFV-6c Panther
    ["OPT4_B_APC_Wheeled_01_cannon_F", DEF_PROD(0)],        // AMV-7 Marshall    
    ["OPT4_B_APC_tracked_03_cannon_F", DEF_PROD(0)],        // FV-720 Mora   
    ["OPT4_B_APC_Tracked_01_AA_F", DEF_PROD(0)],           // IFV-6a Cheetah    
    ["OPT4_B_MBT_01_cannon_F", DEF_PROD(0)],                    // M2A4 Slammer
    ["OPT4_B_MBT_01_TUSK_F", DEF_PROD(0)],                 // M2A4 SlammerUp
    ["OPT4_B_MBT_03_cannon_F", DEF_PROD(0)],                     // MBT-52 Kuma
    ["OPT4_B_MBT_01_Arty_F", DEF_PROD(0)],                       // M4 Scorcher
    ["OPT_B_MBT_01_mlrs_F", DEF_PROD(0)],                      // M5 Sandstorm    

//Tropentarn
    ["OPT4_B_LSV_01_AT_ghex_F", DEF_PROD(80000)],                     // Prowler AT
    ["OPT4_B_MRAP_01_gmg_ghex_F", DEF_PROD(0)],                        // Hunter GMG
    ["OPT4_B_APC_Tracked_01_rcws_ghex_F", DEF_PROD(25000)],          // IFV-6c Panther
    ["OPT4_B_APC_Wheeled_01_cannon_ghex_F", DEF_PROD(50000)],        // AMV-7 Marshall    
    ["OPT4_B_APC_tracked_03_cannon_ghex_F", DEF_PROD(60000)],        // FV-720 Mora   
    ["OPT4_B_APC_Tracked_01_AA_ghex_F", DEF_PROD(125000)],           // IFV-6a Cheetah    
    ["OPT4_B_MBT_01_cannon_ghex_F", DEF_PROD(0)],                    // M2A4 Slammer
    ["OPT4_B_MBT_01_TUSK_ghex_F", DEF_PROD(125000)],                 // M2A4 SlammerUp
    ["OPT4_B_MBT_03_cannon_ghex_F", DEF_PROD(0)],                     // MBT-52 Kuma
    ["OPT4_B_MBT_01_Arty_ghex_F", DEF_PROD(300000)],                       // M4 Scorcher
    ["OPT_B_MBT_01_mlrs_ghex_F", DEF_PROD(400000)]                      // M5 Sandstorm   
**/
// CUP
    ["OPT_CUP_B_LAV25_HQ_USMC", DEF_PROD(25000)],           // LAV C2
    ["OPT_CUP_B_M2Bradley_USA_W", DEF_PROD(60000)],         // M2A2 Bradley IFV
    ["OPT_CUP_B_M163_USA", DEF_PROD(125000)],               // M163A1 VADS (50er Magazine)
    ["OPT_CUP_B_M60A3_TTS_USMC", DEF_PROD(125000)],         // M60A3 TTS
    ["OPT_CUP_B_Leopard2A6_GER", DEF_PROD(125000)],         // Leopard2A6
    ["OPT_CUP_B_HMMWV_TOW_USMC", DEF_PROD(25000)],          // HMMWV TOW
    ["OPT_CUP_B_LR_AA_RACS", DEF_PROD(30000)],              // Landrover AA
    ["OPT_CUP_B_RM70_CZ", DEF_PROD(300000)]                 // RM-70 nicht nachladbar PREIS?

];

GVAR(nato_supplies) = 
[
    ["OPT_Box_NATO_Ammo_F", 40000, 10000, 20000],               // Munitionskiste
    ["OPT_Box_NATO_WpsSpecial_F", 60000, 10000, 20000],         // Munition spezial
    ["OPT_Box_NATO_Grenades_F", 75000, 10000, 20000],           // granatenkiste
    ["OPT_NATO_Sprengstoffkiste", 150000, 10000, 20000],        // sprengstoffkiste
    ["OPT_NATO_Minienkiste", 150000, 10000, 20000],              // Minenkiste
    ["OPT_Box_NATO_WpsSpecial_AT_L1", 225000, 10000, 20000],     // AT Raketenkiste (MRAWS)
    ["OPT_Box_NATO_WpsSpecial_AT_L1A", 250000, 10000, 20000],     // AT Raketenkiste (MRAWS)
    ["OPT_Box_NATO_WpsSpecial_AT_L2" ,DEF_PROD(0)],     // AT Raketenkiste (PCML)
    ["OPT_Box_NATO_WpsSpecial_AT_H1", 350000, 10000, 20000],     // AT Raketenkiste (Titan)
    ["OPT_Box_NATO_WpsSpecial_AA_F", 140000, 10000, 20000],      // AA Raketenkiste
    ["OPT_B_supplyCrate_F", DEF_PROD(0)],                     // Transportkiste (leer)
    ["OPT_B_CargoNet_01_ammo_F", DEF_PROD(5000)],               // Ausrstungskiste
    ["OPT_Box_NATO_WpsSpecial_Diver_F", DEF_PROD(5000)],        // Taucherkiste    
    ["OPT_B_UGV_01_F", DEF_PROD(0)],                         // UGV Stomper

//Tropentarn
    ["OPT_B_UGV_01_ghex_F", DEF_PROD(2000)],                         // UGV Stomper
    ["OPT_B_UAV_01_F", DEF_PROD(0)],                            // Darter AR-2
    ["OPT_FlexibleTank_01_forest_F", DEF_PROD(1000)],           // Treibstoff-Fass
    ["OPT_B_Slingload_01_Ammo_F", 90000, 10000, 20000],                     // Munitionscontainer
    ["OPT_B_Slingload_01_Fuel_F", DEF_PROD(8000)],              // Fuelcontainer
    ["OPT_B_Slingload_01_Repair_F", DEF_PROD(8000)],            // Reparaturcontainer
    ["OPT_B_Slingload_01_Medevac_F", DEF_PROD(0)],              // Lazarettcontainer, 5000       
    ["Land_Cargo20_white_F", DEF_PROD(0)]                      // weier Container (Lazarett)
];

GVAR(nato_static) = 
[
    ["CUP_B_M2StaticMG_USMC", DEF_PROD(10000)],                 // Stand-MG hoch
    ["CUP_B_M2StaticMG_MiniTripod_USMC", DEF_PROD(10000)],      // Stand-MG niedrig
    ["OPT_CUP_B_D30_AT_USMC", DEF_PROD(150000)],                // D30-AT
    ["OPT_CUP_B_M119_USMC", DEF_PROD(150000)],                  // M119
    ["CUP_B_Stinger_AA_pod_Base_USMC", DEF_PROD(50000)],        // FIM-92 AA
    ["CUP_B_TOW2_TriPod_USMC", DEF_PROD(150000)],               // TOW-2 AT
    ["CUP_B_M252_USMC", DEF_PROD(50000)],                       // M252 81mm Mörser
    ["CUP_B_SearchLight_static_USMC", DEF_PROD(10000)]          // Suchscheinwerfer
];

GVAR(nato_sea) = 
[
    ["OPT_B_Boat_Armed_01_minigun_F", DEF_PROD(10000)],         // Speedboat Minigun
    ["OPT_B_Boat_Transport_01_F", DEF_PROD(500)],               // Assault Boat
    ["OPT_B_SDV_01_F", DEF_PROD(2000)],                         // Submarine
    ["OPT_B_C_Boat_Transport_02_F", DEF_PROD(7000)]             // Rhib unbewaffnet
];

//CSAT Einheiten
GVAR(csat_vehicles) = 
[
/**
 * TeTeT: to be deleted
//Vanilla
    ["OPT_O_Quadbike_01_F", DEF_PROD(0)],                    // Quadbike-
    ["OPT_O_T_LSV_02_unarmed_F", DEF_PROD(0)],               // Quilin unarmed 
    ["OPT_O_T_LSV_02_armed_F", DEF_PROD(0)],                 // Quilin armed 
    ["OPT_O_G_Offroad_01_F", DEF_PROD(0)],                   // Pickup
    ["OPT_O_G_Offroad_01_armed_F", DEF_PROD(0)],                // Pickup HMG
    ["OPT_O_MRAP_02_F", DEF_PROD(0)],                        // Ifrit-
    ["OPT_O_MRAP_02_hmg_F", DEF_PROD(0)],                  // Ifrit HMG
    ["OPT_O_Truck_03_covered_F", DEF_PROD(0)],               // Tempest Infanterie
    ["OPT_O_Truck_03_transport_F", DEF_PROD(0)],         // Tempest Logistik
    ["OPT_O_Truck_03_repair_F", DEF_PROD(0)],               // Tempest Repair
    ["OPT_O_Truck_03_medical_F", DEF_PROD(0)],              // Tempest Medicalasa

//Tropentarn
    ["OPT_O_T_Quadbike_01_ghex_F", DEF_PROD(10000)],                // Quadbike 
    ["OPT_O_T_LSV_02_unarmed_ghex_F", DEF_PROD(25000)],                  // Quilin unarmed 
    ["OPT_O_T_LSV_02_armed_ghex_F", DEF_PROD(35000)],                    // Quilin armed 
    ["OPT_O_G_Offroad_01_ghex_F", DEF_PROD(0)],                      // Pickup
    ["OPT_O_G_Offroad_01_armed_F", DEF_PROD(0)],                // Pickup HMG
    ["OPT_O_T_MRAP_02_ghex_F", DEF_PROD(20000)],                    // Ifrit 
    ["OPT_O_T_MRAP_02_hmg_ghex_F", DEF_PROD(80000)],                // Ifrit HMG 
    ["OPT_O_T_Truck_02_F", DEF_PROD(5000)],           // Zamack Infanterie
    ["OPT_O_T_Truck_02_transport_F", DEF_PROD(5000)],         // Zamack Logistik
    ["OPT_O_T_Truck_02_box_F", 10000,5000,10000],            // Zamack Repair
    ["OPT_O_T_Truck_02_Medical_F", DEF_PROD(6000)]          // Zamack Medical
**/
// CUP
    ["OPT_CUP_O_TT650_TKA", DEF_PROD(10000)],               // Motorrad TT650 (0)  
    ["OPT_CUP_O_UAZ_Unarmed_RU", DEF_PROD(25000)],          // UAZ 469
    ["OPT_CUP_O_UAZ_MG_RU", DEF_PROD(35000)],               // UAZ 469 DShKM
    ["OPT_CUP_O_GAZ_Vodnik_Unarmed_RU", DEF_PROD(20000)],   // GAZ 3937 Vodnik
    ["OPT_CUP_O_GAZ_Vodnik_PK_RU", DEF_PROD(35000)],        // GAZ 3937 Vodnik 2xPKM
    ["OPT_CUP_O_Ural_TKA", DEF_PROD(5000)],                 // Ural
    ["OPT_CUP_O_Ural_Repair_TKA", 10000,5000,10000],        // Ural Rep
    ["OPT_CUP_O_GAZ_Vodnik_MedEvac_RU", DEF_PROD(6000)]     // GAZ 3937 Vodnik Medic (0)
];

GVAR(csat_vehicles_supply) = 
[
/**
 * TeTeT: to be deleted
    ["OPT_O_Truck_03_ammo_F", DEF_PROD(0)],              // Zamack Ammo
    ["OPT_O_Truck_03_fuel_F", DEF_PROD(0)],              // Zamack Fuel

//Tropentarn
    ["OPT_O_T_Truck_02_ammo_F", 50000,5000,10000],                 // Zamack Ammo
    ["OPT_O_T_Truck_02_fuel_F", 10000,5000,10000]                  // Zamack Fuel
**/
// CUP
    ["OPT_CUP_O_Ural_Reammo_TKA", 50000,5000,10000],        // Ural Ammo
    ["OPT_CUP_O_Ural_Refuel_TKA", 10000,5000,10000]        // Ural Tank
];

GVAR(csat_choppers) = 
[
/**
 * TeTeT: to be deleted
    ["OPT_O_Heli_Light_01_F", DEF_PROD(0)],                 // MH6
    ["OPT_O_Heli_Light_03_unarmed_F", DEF_PROD(0)],             // WY-55 Hellcat
    ["OPT4_O_Heli_light_03_F", DEF_PROD(0)],                    // WY-55 Hellcat
    ["OPT_O_Heli_Light_02_unarmed_F", 40000,10000,20000],             // PO-30 Orca
    ["OPT_O_Heli_Light_02_v2_F", 200000,10000,20000],                   // PO-30 Orca Cas Light
    ["OPT_O_Heli_Light_02_v3_F", 400000,10000,20000],                   // PO-30 Orca Cas Heavy
    ["OPT_O_Heli_Transport_04_covered_F", 45000,10000,20000],    // Mi-290 Taru (Transport)
    ["OPT_O_Heli_Transport_04_F", DEF_PROD(0)],    // Mi-290 Taru (Lift)
    ["OPT_O_Heli_Transport_04_fuel_F", 15000,10000,20000],    // Mi-290 Taru (Fuel)
    ["OPT_O_Heli_Transport_04_box_F", 15000,10000,20000],    // Mi-290 Taru (Rep)
    ["OPT_O_Heli_Transport_04_ammo_F", 55000,10000,20000],    // Mi-290 Taru (Muni)
    ["OPT_O_Heli_Transport_02_F", DEF_PROD(0)],            // CH-49 Mohawk (Transport+Lift)
    ["OPT_O_UAV_02_light_F", DEF_PROD(0)],                 // Ababil unbewaffnet
    ["OPT_O_UAV_02_CAS_F", DEF_PROD(0)],                        // Ababil GBU-12
    ["OPT_O_UAV_02_F", DEF_PROD(0)],                            // Ababil Scalpel 
    ["OPT4_O_Heli_Attack_02_F", DEF_PROD(0)],                   // Mi-48 Kajman    
    ["OPT_O_T_VTOL_02_infantry_unarmed_F", DEF_PROD(0)],           // VTOL Y-32 Xi'an (Inf-Transport)
    ["OPT_O_T_VTOL_02_vehicle_unarmed_F", DEF_PROD(0)],         // VTOL Y-32 Xi'an (Fahrzeug-Transport) 
    ["OPT_O_T_VTOL_01_vehicle_F", DEF_PROD(0)],                    // VTOL Blackfish (Fahrzeug-Transport)
    ["OPT_O_Plane_CAS_02_F", DEF_PROD(0)],                      // To-199 Neophron
    ["OPT_O_Plane_Fighter_AA_02_F", DEF_PROD(0)],                  // To-201 Shikra 
    ["OPT_O_Plane_CAS_01_F_1" , DEF_PROD(0)],                  // Wipeout CAS 400000
    ["OPT_O_Plane_Fighter_01_Stealth_F", DEF_PROD(0)]          // F/A-181 Black Wasp II
**/
// CUP
    ["OPT_CUP_O_SA330_Puma_HC1_BAF", 40000,10000,20000],        // SA-330 Puma 
    ["OPT_CUP_O_Ka60_Grey_RU", 200000,10000,20000],             // KA-60 Kataska
    ["OPT_CUP_O_Merlin_HC3_GB", 45000,10000,20000],             // Merlin HC3A
    ["OPT_CUP_O_Mi24_V_Dynamic_RU",  DEF_PROD(300000)]          // MI-24V
];

GVAR(csat_planes) = 
[
    ["C_Plane_Civil_01_F", 1, 0, 0],                            // Caesar BTT
    ["CUP_C_AN2_CIV", 1, 0, 0],                                 // Antonov An-2
    ["CUP_C_C47_CIV", 1, 0, 0],                                 // C-47 Skytrain
    ["OPT_CUP_O_Su25_Dyn_RU", 1, 0, 0]                          // SU-25T
];

GVAR(csat_armored) = 
[
/**
 * TeTeT: to be deleted
//Vanilla
    ["OPT_O_MRAP_02_gmg_F", DEF_PROD(0)],                  // Ifrit GMG
    ["OPT_O_LSV_02_AT_F", DEF_PROD(0)],                    // Quilin AT 
    ["OPT_O_APC_Wheeled_02_rcws_F", DEF_PROD(0)],          // MSE-3 Marid 
    ["OPT_O_APC_Wheeled_03_cannon_F", DEF_PROD(0)],       // AFV-4 Gorgon
    ["OPT_O_APC_Tracked_02_cannon_F", DEF_PROD(0)],       // BTR-K Kamysh
    ["OPT_O_APC_Tracked_02_AA_F", DEF_PROD(0)],           // ZSU-39 Tigris
    ["OPT_O_MBT_02_cannon_F", DEF_PROD(0)],               // T-100 Varsuk
    ["OPT_O_MBT_02_arty_F", DEF_PROD(0)],                 // 2S9 Sochor
    ["OPT_O_Truck_02_MRL_F", DEF_PROD(0)],                 // Zamark MRL 
    ["OPT_O_MBT_04_cannon_F", DEF_PROD(0)],               // T-140 Angara

//Tropentarn
    ["OPT_O_MRAP_02_gmg_ghex_F", DEF_PROD(0)],                  // Ifrit GMG
    ["OPT_O_LSV_02_AT_GHEX_F", DEF_PROD(250000)],                    // Quilin AT 
    ["OPT_O_T_APC_Wheeled_02_rcws_ghex_F", DEF_PROD(0)],       // MSE-3 Marid 
    ["OPT_O_T_APC_Wheeled_01_cannon_F_INF", DEF_PROD(300000)],       // Marchall Infanterie
    ["OPT_O_APC_Wheeled_03_cannon_ghex_F", DEF_PROD(0)],               // AFV-4 Gorgon 
    ["OPT_O_T_APC_Tracked_02_cannon_ghex_F_VEH", DEF_PROD(350000)],     // BTR-K Kamysh Fahrzeug
    ["OPT_O_T_APC_Tracked_02_cannon_ghex_F_AT", DEF_PROD(400000)],     // BTR-K Kamysh Tank
    ["OPT_O_T_APC_Tracked_02_AA_ghex_F", DEF_PROD(320000)],         // ZSU-39 Tigris 
    ["OPT_O_T_MBT_02_cannon_ghex_F_INF", DEF_PROD(400000)],             // T-100 Varsuk Infanterie
    ["OPT_O_T_MBT_02_cannon_ghex_F_AT", DEF_PROD(500000)],             // T-100 Varsuk Fahrzeug
    ["OPT_O_T_MBT_02_arty_ghex_F", DEF_PROD(350000)],               // 2S9 Sochor 
    ["OPT_O_Truck_02_MRL_ghex_F", DEF_PROD(400000)]                 // Zamark MRL  
**/

    ["OPT_CUP_O_ZSU23_Afghan_SLA", DEF_PROD(320000)],           // ZSU-23-4 Afghanski (50er Magazine)
    ["OPT_CUP_O_T72_RU", DEF_PROD(400000)],                     // T72
    ["OPT_CUP_O_T90_RU", DEF_PROD(500000)],                     // T90
    ["OPT_CUP_O_BTR60_RU", DEF_PROD(80000)],                // BTR-60 PB
    ["OPT_CUP_O_BTR90_RU", DEF_PROD(80000)],                // BTR90 ohne GMG, Preis?    
    ["OPT_CUP_O_BRDM2_ATGM_RUS", DEF_PROD(80000)],              // BRDM-2 ATGM    
    ["OPT_CUP_O_LR_AA_TKA", DEF_PROD(30000)],                   // UAZ AA
    ["OPT_CUP_O_BM21_RU", DEF_PROD(400000)]                     // BM21 nicht nachladbar

];

GVAR(csat_supplies) = 
[
    ["OPT_Box_East_Ammo_F", 40000, 1000, 2000],                           // Munitionskiste
    ["OPT_Box_East_WpsSpecial_F", 60000, 1000, 2000],                     // Munition spezial kiste
    ["OPT_Box_East_Grenades_F", 50000, 1000, 2000],                       // granatenkiste
    ["OPT_Box_CSAT_UGL_F", 21000, 1000, 2000],                       // Unterlaufgranatenkiste
    ["OPT_CSAT_Sprengstoffkiste", 200000, 1000, 2000],                    // sprengstoffkiste
    ["OPT_CSAT_Minenkiste", 80000, 1000, 2000],                      // Minenkiste
    ["OPT_Box_East_WpsSpecial_AT_L1", 200000, 1000, 2000],                         // AT Raketenkiste (RPG-42)
    ["OPT_Box_East_WpsSpecial_AT_L3", 225000, 1000, 2000],                         // AT Raketenkiste (MAAWS)
    ["OPT_Box_East_WpsSpecial_AT_L3A", 250000, 1000, 2000],                         // AT Raketenkiste (MAAWS)
    ["OPT_Box_East_WpsSpecial_AT_L2", 101000, 1000, 2000],                  // AT Raketenkiste (RPG-7)
    ["OPT_Box_East_WpsSpecial_AT_H1", DEF_PROD(0)],                  // AT Raketenkiste (9M135 Vorona)
    ["OPT_Box_East_WpsSpecial_AA_F", 150000, 1000, 2000],                  // AA Raketenkiste
    ["OPT_O_supplyCrate_F", DEF_PROD(0)],                                 // Transportkiste
    ["OPT_O_CargoNet_01_ammo_F", 5000,1000, 2000],                           // Ausrüstungskiste
    ["OPT_Box_East_WpsSpecial_Diver_F", 5000,1000, 2000],                    // Taucherkiste
    ["OPT_O_UGV_01_F", DEF_PROD(0)],                                     // UGV Saif

//Tropentarn
    ["OPT_O_T_UGV_01_ghex_F", DEF_PROD(0)],                                 // UGV Saif    
    ["OPT_O_UAV_01_F", DEF_PROD(0)],                                        // Tayran AR-2
    ["OPT_FlexibleTank_01_sand_F", DEF_PROD(1000)],                         // Treibstoff-Fass
    ["OPT_Land_Pod_Heli_Transport_04_fuel_F", DEF_PROD(0)],              // Fuelcontainer
    ["OPT_Land_Pod_Heli_Transport_04_ammo_F", DEF_PROD(0)],        // Munitionscontainer
    ["OPT_Land_Pod_Heli_Transport_04_repair_F", DEF_PROD(0)],            // Reparaturcontainer - 8000 aktuell raus wegen nix funktional!
    ["OPT_Land_Pod_Heli_Transport_04_medevac_F", DEF_PROD(0)]             // Lazarettcontainer
];

GVAR(csat_static) = 
[
    ["CUP_O_DSHKM_SLA", DEF_PROD(10000)],                           // Stand-MG hoch
    ["CUP_O_KORD_RU", DEF_PROD(10000)],                             // Stand-MG niedrig
    ["CUP_O_D30_AT_RU", DEF_PROD(150000)],                          // D30-AT
    ["OPT_CUP_O_D30_RU", DEF_PROD(150000)],                         // D30
    ["CUP_O_Igla_AA_pod_RU", DEF_PROD(20000)],                      // Igla Luftabwehrstellung
    ["CUP_O_Kornet_RU", DEF_PROD(150000)],                          // Kornet AT14
    ["CUP_O_2b14_82mm_RU", DEF_PROD(50000)],                        // Podnos 2b14 Mörser
    ["CUP_O_SearchLight_static_RU", DEF_PROD(10000)]                // Suchscheinwerfer
];

GVAR(csat_sea) = 
[
    ["OPT_O_Boat_Transport_01_F", DEF_PROD(500)],                   // Assault Boat
    ["OPT_O_Boat_Armed_01_hmg_F", DEF_PROD(25000)],                 // Speedboat HMG
    ["OPT_O_C_Boat_Transport_02_F", DEF_PROD(12000)],                // rhib unbewaffnet
    ["OPT_O_SDV_01_F", DEF_PROD(40000)]                              // Submarine
];

//AAF Einheiten
GVAR(AAF_vehicles) = 
[
    ["OPT_I_Quadbike_01_F", DEF_PROD(10000)],                    // Quadbike
    ["OPT_I_C_Offroad_02_unarmed_F", DEF_PROD(18000)],               // Jeep unarmed 
    ["OPT_I_C_Offroad_02_LMG_F", DEF_PROD(25000)],                 // Jeeg MG
    ["OPT_I_MRAP_03_F", DEF_PROD(20000)],                        // Strider
    ["OPT_I_MRAP_03_hmg_F", DEF_PROD(80000)],                   // Strider HMG
    ["OPT_I_Truck_02_covered_F", DEF_PROD(5000)],               // Zamak Transport
    ["OPT_I_Truck_02_box_F", 10000,5000,10000],               // Zamak Repair
    ["OPT_I_Truck_02_transport_F", DEF_PROD(5000)],               // Zamak   
    ["OPT_I_Truck_02_medical_F", DEF_PROD(6000)]               // Zamak Medical
];

// Fahrzeuge dieser Liste können nicht verkauft werden!
GVAR(AAF_vehicles_supply) = 
[
    ["OPT_I_Truck_02_ammo_F", 50000,5000,10000],                         // Zamak Ammo
    ["OPT_I_Truck_02_fuel_F", 10000,5000,10000],                      // Zamak Fuel
    ["OPT_B_Slingload_01_Ammo_F", 50000,5000,10000],                      // Slinglot Muni Container
    ["OPT_B_Slingload_01_Repair_F", DEF_PROD(0)],                      // Slinglot Rep Container
    ["OPT_B_Slingload_01_Fuel_F", 10000,5000,10000]                      // Slinglot Fuel Container
];    
  
GVAR(AAF_choppers) = 
[
    ["OPT_I_Heli_light_03_v2_F", 200000,10000,20000],                 // WY-55 Hellcat Cas Light
    ["OPT_I_Heli_light_03_v3_F", 400000,10000,20000],                 // WY-55 Hellcat Cas Heavy
    ["OPT_I_Heli_light_03_unarmed_F", 40000,10000,20000],          // WY-55 Hellcat Unbewaffnet
    ["OPT_I_Heli_Transport_02_F", 45000,10000,20000],                   // CH-49 Mohawk (Transport+Lift)
    ["OPT_I_UAV_02_light_F", DEF_PROD(0)]                 // Greyhawk unbewaffnet
];

GVAR(AAF_planes) = 
[
    ["C_Plane_Civil_01_F", 1, 0, 0],                            // Caesar BTT
    ["CUP_C_AN2_CIV", 1, 0, 0],                                 // Antonov An-2
    ["CUP_C_C47_CIV", 1, 0, 0]                                  // C-47 Skytrain
];

GVAR(AAF_armored) = 
[
    ["OPT_I_LSV_01_AT_ghex_F", DEF_PROD(250000)],                     // Jeep AT 
    ["OPT_I_MRAP_03_gmg_F", DEF_PROD(0)],                        // Strider GMG 
    ["OPT_I_APC_tracked_03_cannon_F_INF", DEF_PROD(300000)],        // FV-720 Mora Infanterie   
    ["OPT_I_APC_Wheeled_03_cannon_F_VEH", DEF_PROD(350000)],        // Gorgon Fahrzeug  
    ["OPT_I_APC_Wheeled_03_cannon_F_AT", DEF_PROD(400000)],        // Gorgon Tank
    ["OPT_I_APC_Tracked_01_AA_ghex_F", DEF_PROD(320000)],                     // AA cheetah    
    ["OPT_I_MBT_03_cannon_F_INF", DEF_PROD(400000)],                     // MBT-52 Kuma Infanterie
    ["OPT_I_MBT_03_cannon_F_AT", DEF_PROD(500000)],                     // MBT-52 Kuma Fahrzeug
    ["OPT_I_MBT_01_arty_ghex_F", DEF_PROD(350000)],                     // Scorcher Arty
    ["OPT_I_Truck_02_MRL_F", DEF_PROD(400000)]                      // Zamak Arty        
];

GVAR(AAF_supplies) = 
[
    ["OPT_Box_EFA_Ammo_F", 40000, 1000, 2000],               // Munitionskiste
    ["OPT_Box_EAF_WpsSpecial_F", 60000, 1000, 2000],         // Munition spezial
    ["OPT_Box_EAF_Grenades_F", 50000, 1000, 2000],           // granatenkiste
    ["OPT_Box_EAF_UGL_F", 21000, 1000, 2000],           // granatenkiste
    ["OPT_EAF_Sprengstoffkiste", 200000, 1000, 2000],        // sprengstoffkiste
    ["OPT_EAF_Minenkiste", 80000, 1000, 2000],               // Minenkiste
    ["OPT_Box_EAF_WpsSpecial_AT_L2", 101000, 1000, 2000],     // AT Raketenkiste (RPG7)
    ["OPT_Box_EAF_WpsSpecial_AT_L1" ,225000, 1000, 2000],              // AT Raketenkiste (MAAWS)
    ["OPT_Box_EAF_WpsSpecial_AT_L1A" ,250000, 1000, 2000],              // AT Raketenkiste (MAAWS)
    ["OPT_Box_EAF_WpsSpecial_AT_L3" ,200000, 1000, 2000],              // AT Raketenkiste (RPG-42)
    ["OPT_Box_EAF_WpsSpecial_AA_F", 150000, 1000, 2000],      // AA Raketenkiste
    ["OPT_I_supplyCrate_F", 5000,1000, 2000],                     // Transportkiste (leer)
    ["OPT_I_CargoNet_01_ammo_F", 5000,1000, 2000],               // Ausrstungskiste
    ["OPT_Box_EAF_WpsSpecial_Diver_F", 5000,1000, 2000],        // Taucherkiste    
    ["OPT_I_UGV_01_F", DEF_PROD(0)],                         // UGV Stomper                        // Darter AR-2
    ["OPT_FlexibleTank_01_forest_F", DEF_PROD(1000)]           // Treibstoff-Fass
];

GVAR(AAF_static) = 
[
    ["OPT_I_HMG_01_high_F", DEF_PROD(10000)],                   // Stand-MG hoch
    ["OPT_I_HMG_01_F", DEF_PROD(10000)],                        // Stand-MG niedrig
    ["OPT_I_GMG_01_high_F", DEF_PROD(75000)],                   // Stand-GMG hoch
    ["OPT_I_GMG_01_F", DEF_PROD(75000)],                        // Stand-GMG niedrig
    ["OPT_I_static_AA_F", DEF_PROD(20000)],                     // Stand-AA
    ["OPT_I_static_AT_F", DEF_PROD(150000)],                    // Stand-AT
    ["OPT_I_Mortar_01_F", DEF_PROD(50000)],                    // MK6 - Mörser
    ["OPT_I_Static_Designator_01_F", DEF_PROD(10000)]           // Remote Designator
];

GVAR(AAF_sea) = 
[
    ["OPT_I_Boat_Armed_01_minigun_F", DEF_PROD(25000)],         // Speedboat Minigun
    ["OPT_I_Boat_Transport_01_F", DEF_PROD(500)],               // Assault Boat
    ["OPT_I_SDV_01_F", DEF_PROD(40000)],                         // Submarine
    ["OPT_I_C_Boat_Transport_02_F", DEF_PROD(12000)]             // Rhib unbewaffnet
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

GVAR(allAAF) =
    GVAR(AAF_vehicles) +
    GVAR(AAF_vehicles_supply) +
    GVAR(AAF_choppers) +
    GVAR(AAF_planes) +
    GVAR(AAF_armored) +
    GVAR(AAF_supplies) +
    GVAR(AAF_static) +
    GVAR(AAF_sea);

GVAR(all) =
    GVAR(allNato) +
    GVAR(allCsat) +
    GVAR(allAAF);

//Waffenkonfiguation
//Raketen Heli Nato
//[Magazinename, Waffenname, Preis/Schuss, Preis Magazin, Boxname, Waffenkontrolle Pilot KHS]
GVAR(raktenHeliWest) =  
[
    ["OPT_PylonRack_1Rnd_Missile_AGM_02_F", "OPT_Missile_AGM_02_Plane_CAS_01_F", 150000, 150000, "1xMacer", 0],  // 0.1xMacer
    ["OPT_PylonMissile_Missile_AMRAAM_D_INT_x1", "OPT_weapon_AMRAAMLauncher", 100000, 100000, "1xAMRAAM", 0],  //      1.1xAMRAAM
    ["OPT_PylonRack_1Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 200000, "1xScalpel", 0],  //      2.1xScalpel AH9, Orca
    ["OPT_PylonRack_3Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 600000, "3xScalpel", 0],  //      3.3xScalpel
    ["OPT_PylonRack_12Rnd_missiles", "OPT_missiles_DAR", 4000, 48000, "12xDAR", -1],  //      4.12xDAR
    ["OPT_PylonRack_12Rnd_PG_missiles", "OPT_missiles_DAGR", 10000, 120000, "12xDAGR", -1],  //      5.12xDAGR
    ["OPT_PylonRack_19Rnd_Rocket_Skyfire", "OPT_rockets_Skyfire", 2500, 47500, "19xSkyfire", -1],  //      6.19xSkyfire
    ["OPT_PylonRack_4Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 800000, "4xScalpel", 0],  //      7.4xScalpel
    ["PylonRack_7Rnd_Rocket_04_HE_F", "OPT_Rocket_04_HE_Plane_CAS_01_F", 2500, 17500, "7xShrieker HE", -1],  //      8.7xShrieker HE
    ["PylonRack_7Rnd_Rocket_04_AP_F", "OPT_Rocket_04_AP_Plane_CAS_01_F", 5000, 35000, "7xShrieker AP", -1],  //      9.7xShrieker AP
    ["PylonRack_20Rnd_Rocket_03_HE_F", "OPT_Rocket_03_HE_Plane_CAS_02_F", 2500, 50000, "20xTratnyr HE", -1],  //      10.20xTratnyr HE
    ["PylonRack_20Rnd_Rocket_03_AP_F", "OPT_Rocket_03_AP_Plane_CAS_02_F", 5000, 100000, "20xTratnyr AP", -1],  //      11.20xTratnyr AP
    ["OPT_PylonMissile_1Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 200000, "1xScalpel", 0],  //      12.1xScalpel Hellcat, Kajman, Blackfoot
    ["OPT_PylonRack_1Rnd_AAA_missiles", "OPT_missiles_ASRAAM", 25000, 25000, "1xASRAAM", 0],  //      13.1xASRAAM AH9, Orca, Hellcat
    ["OPT_PylonRack_Missile_AGM_02_x1", "OPT_weapon_AGM_65Launcher", 150000, 150000, "1xMacer II", 0],  // 14.1xMacer II
    ["OPT_PylonMissile_1Rnd_AAA_missiles", "OPT_missiles_ASRAAM", 25000, 25000, "1xASRAAM", 0]  //      15.1xASRAAM Blackfoot
];

//Gun Heli Nato
//[Magazinename, Waffenname, Preis/Schuss, Preis Magazin, Boxname]
GVAR(gunHeliWest) = 
[
    ["5000Rnd_762x51_Yellow_Belt", "OPT_M134_minigun", 10, 50000, "5000x7.62 mm"],       // 0.5000x7.62 mm Minigun 
    ["1000Rnd_65x39_Belt_Yellow", "LMG_Minigun_heli", 10, 10000, "1000x6.5 mm mm"],  // 1.1000x6.5 mm mm Minigun 
    ["2000Rnd_65x39_Belt_Yellow", "LMG_Minigun_heli", 10, 20000, "2000x6.5 mm mm"],  // 2.2000x6.5 mm mm Minigun 
    ["1000Rnd_20mm_shells", "OPT_gatling_20mm", 100, 100000, "1000x20 mm"],      // 3.1000x20 mm Minigun
    ["2000Rnd_20mm_shells", "OPT_gatling_20mm", 100, 200000, "2000x20 mm"],      // 4.2000x20 mm Minigun 
    ["300Rnd_20mm_shells", "OPT_gatling_20mm", 100, 30000, "300x20 mm"],         // 5.300x20 mm Minigun 
    ["250Rnd_30mm_HE_shells", "OPT_gatling_30mm", 300, 50000, "250x30 mm HE"],   // 6.250x30 mm HE Cannon Caseless 
    ["250Rnd_30mm_APDS_shells", "OPT_gatling_30mm", 200, 75000, "250x30 mm APDS"]// 7.250x30 mm APSD Cannon Caseless 
];

//Gun Fahrzeuge Nato
//[Magazinename, Waffenname, Preis/Schuss, Preis Magazin, Boxname]
GVAR(gunVehWest) = 
[
    ["500Rnd_127x99_mag", "HMG_127", 80, 40000, "500x12.7 mm"],  // 0.500x12.7 mm AA MG
    ["200Rnd_127x99_mag", "HMG_127", 80, 16000, "200x12.7 mm"],  // 1.200x12.7 mm AA MG
    ["100Rnd_127x99_mag", "HMG_127", 80, 8000, "100x12.7 mm"],  // 2.100x12.7 mm AA MG
    ["2000Rnd_762x51_Belt", "LMG_coax", 10, 20000, "2000x7.62 mm"],  // 3.2000x7.62 mm LMG
    ["1000Rnd_762x51_Belt", "LMG_coax", 10, 10000, "1000x7.62 mm"],  // 4.1000x7.62 mm LMG
    ["2000Rnd_65x39_Belt", "LMG_RCWS", 7, 14000, "2000x6.5 mm"],  // 5.2000x6.5 mm LMG
    ["1000Rnd_65x39_Belt", "LMG_RCWS", 7, 7000, "1000x6.5 mm"],  // 6.1000x6.5 mm LMG
    ["200Rnd_40mm_G_belt", "GMG_40mm", 1000, 200000, "200x40 mm HE Grenade"],  //  7.200x40 mm HE Grenade
    ["96Rnd_40mm_G_belt", "GMG_40mm", 1000, 96000, "96x40 mm HE Grenade"],  //  8.96x40 mm HE Grenade 
    ["32Rnd_40mm_G_belt", "GMG_40mm", 1000, 32000, "32x40 mm HE Grenade"],  //  9.32x40 mm HE Grenade
    ["200Rnd_20mm_G_belt", "GMG_20mm", 250, 50000, "200x20 mm HE Grenade"],  //  10.200x20 mm HE Grenade
    ["40Rnd_20mm_g_belt", "GMG_20mm", 250, 10000, "40x20 mm HE Grenade"],  //  11.40x20 mm HE Grenade
    ["140Rnd_30mm_MP_shells", "OPT_autocannon_30mm_CTWS", 100, 14000, "140x30 mm HE"],  //  12.140x30 mm HE
    ["60Rnd_30mm_APFSDS_shells", "OPT_autocannon_30mm_CTWS", 400, 24000, "60x30 mm APFSDS"],  //  13.60x30 mm APFSDS
    ["60Rnd_40mm_GPR_shells", "OPT_autocannon_40mm_CTWS", 200, 12000, "60x40 mm HE"],  //  14.60x40 mm HE
    ["40Rnd_40mm_APFSDS_shells", "OPT_autocannon_40mm_CTWS", 700, 28000, "40x40 mm APFSDS"],  //  15.40x40 mm APFSDS
    ["2Rnd_GAT_missiles", "OPT_missiles_titan", 50000, 100000, "2xTitan AT"],  //  16.2xTitan AT  
    ["1Rnd_GAT_missiles", "OPT_missiles_titan_static", 50000, 50000, "1xTitan AT"],  //  17.1xTitan AT
    ["SPG9_HEAT", "launcher_SPG9", 25000, 25000, "1xSPG-9 HEAT"],  //  18.1xSPG-9 HEAT
    ["SPG9_HE", "launcher_SPG9", 1000, 1000, "1xSPG-9 HE"],  //  19.1xSPG-9 HE
    ["OPT_680Rnd_35mm_AA_shells_Tracer_Green", "OPT_autocannon_35mm", 100, 68000, "680xFlak 35 mm"],  //  20.680xFlak 35 mm
    ["OPT_1200Rnd_35mm_AA_shells_Tracer_Green", "OPT_autocannon_35mm", 100, 120000, "1200xFlak 35 mm"],  //  21.1200xFlak 35 mm
    ["4Rnd_Titan_long_missiles", "OPT_missiles_titan_AA", 12500, 50000, "4xTitan AA"],  //  22.4xTitan AA
    ["2Rnd_Titan_long_missiles", "OPT_missiles_titan_AA", 12500, 25000, "2xTitan AA"],  //  23.2xTitan AA
    ["32Rnd_120mm_APFSDS_shells", "cannon_120mm", 5000, 160000, "32x120mm APFSDS"],  //  24.32x120mm APFSDS
    ["30Rnd_120mm_HE_shells", "cannon_120mm", 3000, 90000, "30x120mm HE"],  //  25.30x120mm HE
    ["20Rnd_120mm_HEAT_MP", "cannon_120mm", 4500, 90000, "20x120mm HEAT"],  //  26.20x120mm HEAT
    ["20Rnd_120mm_APFSDS_shells", "cannon_120mm", 5000, 100000, "20x120mm APFSDS"],  //  27.20x120mm APFSDS
    ["16Rnd_120mm_HE_shells", "cannon_120mm", 3000, 48000, "16x120mm HE"],  //  28.16x120mm HE
    ["12Rnd_120mm_HEAT_MP", "cannon_120mm", 4500, 54000, "12x120mm HEAT"],  //  29.12x120mm HEAT
    ["12Rnd_120mm_APFSDS_shells", "cannon_120mm", 5000, 60000, "12x120mm APFSDS"],  //  30.12x120mm APFSDS
    ["8Rnd_120mm_HE_shells", "cannon_120mm", 3000, 24000, "8x120mm HE"],  //  31.8x120mm HE
    ["8Rnd_120mm_HEAT_MP", "cannon_120mm", 4500, 36000, "8x120mm HEAT"],  //  32.8x120mm HEAT
    ["24Rnd_125mm_APFSDS", "cannon_125mm", 6000, 144000, "24x125mm APFSDS"],  //  33.20x125mm APFSDS
    ["12Rnd_125mm_HE", "cannon_125mm", 3500, 42000, "12x125mm HE"],  //  34.12x125mm HE
    ["12Rnd_125mm_HEAT", "cannon_125mm", 5000, 60000, "12x125mm HEAT"],  //  35.12x125mm HEAT
    ["16Rnd_125mm_APFSDS", "cannon_125mm", 6000, 96000, "16x125mm APFSDS"],  // 36.16x125mm APFSDS
    ["8Rnd_125mm_HE", "cannon_125mm", 3500, 28000, "8x125mm HE"],  //  37.8x125mm HE
    ["4Rnd_120mm_cannon_missiles", "cannon_120mm", 50000, 200000, "4x120mm ATGM"],  // 38.4x120mm ATGM
    ["4Rnd_125mm_cannon_missiles", "cannon_125mm", 50000, 200000, "4x125mm ATGM"],  //  39.4x125mm ATGM
    ["OPT_32Rnd_155mm_Mo_shells", "OPT_mortar_155mm_AMOS", 5000, 160000, "32x155 mm HE"],  //  40.32x155 mm HE
    ["OPT_2Rnd_155mm_Mo_Cluster", "OPT_mortar_155mm_AMOS", 2, 4, "2xCluster"],  //  41.2xCluster Shells
    ["6Rnd_155mm_Mo_smoke", "OPT_mortar_155mm_AMOS", 500, 3000, "6xSmoke"],  //  42.6xSmoke 
    ["Vorona_HEAT", "missiles_Vorona", 500, 250000, "1xVorona-HEAT"],  //  43.vorona-test KalleK 
    ["Vorona_HE", "missiles_Vorona", 500, 150000, "1xVorona-HE"],  //  44.vorona-test KalleK 
    ["28Rnd_120mm_APFSDS_shells", "cannon_120mm", 5000, 140000, "28x120mm APFSDS"],  //  45.28x120mm APFSDS
    ["20Rnd_125mm_APFSDS", "cannon_125mm", 6000, 120000, "20x125mm APFSDS"],  //  46.20x125mm APFSDS
    ["12Rnd_120mm_HE_shells", "cannon_120mm", 3000, 36000, "12x120mm HE"],  //  47.12x120mm HE
    ["4Rnd_70mm_SAAMI_missiles", "missiles_SAAMI", 12500, 50000, "4xSAAMI Missile"]  //  48.4xSAAMI Missile
];

//Raketen CSAT
//[Magazinename, Waffenname, Preis/Schuss, Preis Magazin, Boxname, Waffenkontrolle Pilot KHS]
GVAR(raktenHeliEast) = 
[
    ["OPT_PylonRack_1Rnd_Missile_AGM_02_F", "OPT_Missile_AGM_02_Plane_CAS_01_F", 150000, 150000, "1xMacer", 0],  // 0.1xMacer
    ["OPT_PylonMissile_Missile_AMRAAM_D_INT_x1", "OPT_weapon_AMRAAMLauncher", 100000, 100000, "1xAMRAAM", 0],  //      1.1xAMRAAM
    ["OPT_PylonRack_1Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 200000, "1xScalpel", 0],  //      2.1xScalpel AH9, Orca
    ["OPT_PylonRack_3Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 600000, "3xScalpel", 0],  //      3.3xScalpel
    ["OPT_PylonRack_12Rnd_missiles", "OPT_missiles_DAR", 4000, 48000, "12xDAR", -1],  //      4.12xDAR
    ["OPT_PylonRack_12Rnd_PG_missiles", "OPT_missiles_DAGR", 10000, 120000, "12xDAGR", -1],  //      5.12xDAGR
    ["OPT_PylonRack_19Rnd_Rocket_Skyfire", "OPT_rockets_Skyfire", 2500, 47500, "19xSkyfire", -1],  //      6.19xSkyfire
    ["OPT_PylonRack_4Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 800000, "4xScalpel", 0],  //      7.4xScalpel
    ["PylonRack_7Rnd_Rocket_04_HE_F", "OPT_Rocket_04_HE_Plane_CAS_01_F", 2500, 17500, "7xShrieker HE", -1],  //      8.7xShrieker HE
    ["PylonRack_7Rnd_Rocket_04_AP_F", "OPT_Rocket_04_AP_Plane_CAS_01_F", 5000, 35000, "7xShrieker AP", -1],  //      9.7xShrieker AP
    ["PylonRack_20Rnd_Rocket_03_HE_F", "OPT_Rocket_03_HE_Plane_CAS_02_F", 2500, 50000, "20xTratnyr HE", -1],  //      10.20xTratnyr HE
    ["PylonRack_20Rnd_Rocket_03_AP_F", "OPT_Rocket_03_AP_Plane_CAS_02_F", 5000, 100000, "20xTratnyr AP", -1],  //      11.20xTratnyr AP
    ["OPT_PylonMissile_1Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 200000, "1xScalpel", 0],  //      12.1xScalpel Hellcat, Kajman, Blackfoot
    ["OPT_PylonRack_1Rnd_AAA_missiles", "OPT_missiles_ASRAAM", 25000, 25000, "1xASRAAM", 0],  //      13.1xASRAAM AH9, Orca, Hellcat
    ["OPT_PylonMissile_Missile_AGM_KH25_x1", "OPT_weapon_AGM_KH25Launcher", 25000, 25000, "1xAGM KH25", 0],  //      14.1xKH25 Kedge
    ["OPT_PylonRack_1Rnd_Missile_AA_03_F", "OPT_Missile_AA_03_F", 25000, 25000, "1xSahr-3", 0]  //      15.1xSahr-3 Kajman
];

//Gun CSAT
//[Magazinename, Waffenname, Preis/Schuss, Preis Magazin, Boxname]
GVAR(gunHeliEast) = 
[
    ["5000Rnd_762x51_Yellow_Belt", "OPT_M134_minigun", 10, 50000, "5000x7.62 mm"],  // 0.5000x7.62 mm Minigun 
    ["1000Rnd_65x39_Belt_Yellow", "LMG_Minigun_heli", 10, 10000, "1000x6.5 mm"],  // 1.1000x6.5 mm Minigun 
    ["2000Rnd_65x39_Belt_Yellow", "LMG_Minigun_heli", 10, 20000, "2000x6.5 mm"],  // 2.2000x6.5 mm Minigun 
    ["1000Rnd_20mm_shells", "OPT_gatling_20mm", 100, 100000, "1000x20 mm"],  // 3.1000x20 mm Minigun
    ["2000Rnd_20mm_shells", "OPT_gatling_20mm", 100, 200000, "2000x20 mm"],  // 4.2000x20 mm Minigun 
    ["300Rnd_20mm_shells", "OPT_gatling_20mm", 100, 30000, "300x20 mm"],  //      5.300x20 mm Minigun 
    ["250Rnd_30mm_HE_shells", "OPT_gatling_30mm", 300, 50000, "250x30 mm HE"],  // 6.250x30 mm HE Cannon Caseless 
    ["250Rnd_30mm_APDS_shells", "OPT_gatling_30mm", 200, 75000, "250x30 mm APDS"],  // 7.250x30 mm APSD Cannon Caseless 
    ["OPT_PylonWeapon_300Rnd_20mm_shells", "OPT_Twin_Cannon_20mm", 100, 30000, "300xTwin 20mm"]  // 8.300xTwin 20mm Cannon 
];

//Gun Fahrzeuge CSAT
//[Magazinename, Waffenname, Preis/Schuss, Preis Magazin, Boxname]
GVAR(gunVehEast) = 
[
    ["500Rnd_127x99_mag", "HMG_127", 80, 20000, "500x12.7 mm"],  // 0.500x12.7 mm AA MG
    ["200Rnd_127x99_mag", "HMG_127", 80, 16000, "200x12.7 mm"],  // 1.200x12.7 mm AA MG
    ["100Rnd_127x99_mag", "HMG_127", 80, 8000, "100x12.7 mm"],  // 2.100x12.7 mm AA MG
    ["2000Rnd_762x51_Belt", "LMG_coax", 10, 20000, "2000x7.62 mm"],  // 3.2000x7.62 mm LMG
    ["1000Rnd_762x51_Belt", "LMG_coax", 10, 10000, "1000x7.62 mm"],  // 4.1000x7.62 mm LMG
    ["2000Rnd_65x39_Belt", "LMG_RCWS", 7, 14000, "2000x6.5 mm"],  // 5.2000x6.5 mm LMG
    ["1000Rnd_65x39_Belt", "LMG_RCWS", 7, 7000, "1000x6.5 mm"],  // 6.1000x6.5 mm LMG
    ["200Rnd_40mm_G_belt", "GMG_40mm", 1000, 200000, "200x40 mm HE Grenade"],  //  7.200x40 mm HE Grenade
    ["96Rnd_40mm_G_belt", "GMG_40mm", 1000, 96000, "96x40 mm HE Grenade"],  //  8.96x40 mm HE Grenade 
    ["32Rnd_40mm_G_belt", "GMG_40mm", 1000, 32000, "32x40 mm HE Grenade"],  //  9.32x40 mm HE Grenade
    ["200Rnd_20mm_G_belt", "GMG_20mm", 250, 50000, "200x20 mm HE Grenade"],  //  10.200x20 mm HE Grenade
    ["40Rnd_20mm_g_belt", "GMG_20mm", 250, 10000, "40x20 mm HE Grenade"],  //  11.40x20 mm HE Grenade
    ["140Rnd_30mm_MP_shells", "OPT_autocannon_30mm_CTWS", 100, 14000, "140x30 mm HE"],  //  12.140x30 mm HE
    ["60Rnd_30mm_APFSDS_shells", "OPT_autocannon_30mm_CTWS", 400, 24000, "60x30 mm APFSDS"],  //  13.60x30 mm APFSDS
    ["60Rnd_40mm_GPR_shells", "OPT_autocannon_40mm_CTWS", 200, 12000, "60x40 mm HE"],  //  14.60x40 mm HE
    ["40Rnd_40mm_APFSDS_shells", "OPT_autocannon_40mm_CTWS", 700, 28000, "40x40 mm APFSDS"],  //  15.40x40 mm APFSDS
    ["2Rnd_GAT_missiles", "OPT_missiles_titan", 50000, 100000, "2xTitan AT"],  //  16.2xTitan AT                      
    ["1Rnd_GAT_missiles", "OPT_missiles_titan_static", 50000, 50000, "1xTitan AT"],  //  17.1xTitan AT                    
    ["SPG9_HEAT", "launcher_SPG9", 25000, 25000, "1xSPG-9 HEAT"],  //  18.1xSPG-9 HEAT
    ["SPG9_HE", "launcher_SPG9", 1000, 1000, "1xSPG-9 HE"],  //  19.1xSPG-9 HE
    ["OPT_680Rnd_35mm_AA_shells_Tracer_Red", "OPT_autocannon_35mm", 100, 68000, "680xFlak 35 mm"],  //  20.680xFlak 35 mm
    ["OPT_1200Rnd_35mm_AA_shells_Tracer_Red", "OPT_autocannon_35mm", 100, 120000, "1200xFlak 35 mm"],  //  20.1200xFlak 35 mm
    ["4Rnd_Titan_long_missiles", "OPT_missiles_titan_AA", 12500, 50000, "4xTitan AA"],  //  22.4xTitan AA                
    ["2Rnd_Titan_long_missiles", "OPT_missiles_titan_AA", 12500, 25000, "2xTitan AA"],  //  23.2xTitan AA                
    ["32Rnd_120mm_APFSDS_shells", "cannon_120mm", 5000, 160000, "32x120mm APFSDS"],  //  24.32x120mm APFSDS
    ["30Rnd_120mm_HE_shells", "cannon_120mm", 3000, 90000, "30x120mm HE"],  //  25.30x120mm HE
    ["20Rnd_120mm_HEAT_MP", "cannon_120mm", 4500, 90000, "20x120mm HEAT"],  //  26.20x120mm HEAT
    ["20Rnd_120mm_APFSDS_shells", "cannon_120mm", 5000, 100000, "20x120mm APFSDS"],  //  27.20x120mm APFSDS
    ["16Rnd_120mm_HE_shells", "cannon_120mm", 3000, 48000, "16x120mm HE"],  //  28.16x120mm HE
    ["12Rnd_120mm_HEAT_MP", "cannon_120mm", 4500, 54000, "12x120mm HEAT"],  //  29.12x120mm HEAT
    ["12Rnd_120mm_APFSDS_shells", "cannon_120mm", 5000, 60000, "12x120mm APFSDS"],  //  30.12x120mm APFSDS
    ["8Rnd_120mm_HE_shells", "cannon_120mm", 3000, 24000, "8x120mm HE"],  //  31.8x120mm HE
    ["8Rnd_120mm_HEAT_MP", "cannon_120mm", 4500, 36000, "8x120mm HEAT"],  //  32.8x120mm HEAT
    ["24Rnd_125mm_APFSDS", "cannon_125mm", 6000, 144000, "24x125mm APFSDS"],  //  33.24x125mm APFSDS
    ["12Rnd_125mm_HE", "cannon_125mm", 3500, 42000, "12x125mm HE"],  //  34.12x125mm HE
    ["12Rnd_125mm_HEAT", "cannon_125mm", 5000, 60000, "12x125mm HEAT"],  //  35.12x125mm HEAT
    ["16Rnd_125mm_APFSDS", "cannon_125mm", 6000, 96000, "16x125mm APFSDS"],  // 36.16x125mm APFSDS
    ["8Rnd_125mm_HE", "cannon_125mm", 3500, 28000, "8x125mm HE"],  //  37.8x125mm HE
    ["4Rnd_120mm_cannon_missiles", "cannon_120mm", 50000, 200000, "4x120mm ATGM"],  // 38.4x120mm ATGM
    ["4Rnd_125mm_cannon_missiles", "cannon_125mm", 50000, 200000, "4x125mm ATGM"],  //  39.4x125mm ATGM
    ["OPT_32Rnd_155mm_Mo_shells", "OPT_mortar_155mm_AMOS", 5000, 160000, "32x155 mm HE"],  //  40.32x155 mm HE
    ["OPT_2Rnd_155mm_Mo_Cluster", "OPT_mortar_155mm_AMOS", 2, 4, "2xCluster"],  //  41.2xCluster Shells
    ["6Rnd_155mm_Mo_smoke", "OPT_mortar_155mm_AMOS", 500, 3000, "6xSmoke"],  //  42.6xSmoke 
    ["Vorona_HEAT", "missiles_Vorona", 500, 250000, "1xVorona-HEAT"],  //  43.vorona-test KalleK 
    ["Vorona_HE", "missiles_Vorona", 500, 150000, "1xVorona-HE"],  //  44.vorona-test KalleK 
    ["28Rnd_120mm_APFSDS_shells", "cannon_120mm", 5000, 140000, "28x120mm APFSDS"],  //  45.28x120mm APFSDS
    ["20Rnd_125mm_APFSDS", "cannon_125mm", 6000, 120000, "20x125mm APFSDS"],  //  46.20x125mm APFSDS
    ["12Rnd_120mm_HE_shells", "cannon_120mm", 3000, 36000, "12x120mm HE"],  //  47.12x120mm HE
    ["4Rnd_70mm_SAAMI_missiles", "missiles_SAAMI", 12500, 50000, "4xSAAMI Missile"]  //  48.4xSAAMI Missile
];

//Raketen Heli AAF
//[Magazinename, Waffenname, Preis/Schuss, Preis Magazin, Boxname, Waffenkontrolle Pilot KHS]
GVAR(raktenHeliindependent) =  
[
    ["OPT_PylonRack_1Rnd_Missile_AGM_02_F", "OPT_Missile_AGM_02_Plane_CAS_01_F", 150000, 150000, "1xMacer", 0],  // 0.1xMacer
    ["OPT_PylonMissile_Missile_AMRAAM_D_INT_x1", "OPT_weapon_AMRAAMLauncher", 100000, 100000, "1xAMRAAM", 0],  //      1.1xAMRAAM
    ["OPT_PylonRack_1Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 200000, "1xScalpel", 0],  //      2.1xScalpel AH9, Orca
    ["OPT_PylonRack_3Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 600000, "3xScalpel", 0],  //      3.3xScalpel
    ["OPT_PylonRack_12Rnd_missiles", "OPT_missiles_DAR", 4000, 48000, "12xDAR", -1],  //      4.12xDAR
    ["OPT_PylonRack_12Rnd_PG_missiles", "OPT_missiles_DAGR", 10000, 120000, "12xDAGR", -1],  //      5.12xDAGR
    ["OPT_PylonRack_19Rnd_Rocket_Skyfire", "OPT_rockets_Skyfire", 2500, 47500, "19xSkyfire", -1],  //      6.19xSkyfire
    ["OPT_PylonRack_4Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 800000, "4xScalpel", 0],  //      7.4xScalpel
    ["PylonRack_7Rnd_Rocket_04_HE_F", "OPT_Rocket_04_HE_Plane_CAS_01_F", 2500, 17500, "7xShrieker HE", -1],  //      8.7xShrieker HE
    ["PylonRack_7Rnd_Rocket_04_AP_F", "OPT_Rocket_04_AP_Plane_CAS_01_F", 5000, 35000, "7xShrieker AP", -1],  //      9.7xShrieker AP
    ["PylonRack_20Rnd_Rocket_03_HE_F", "OPT_Rocket_03_HE_Plane_CAS_02_F", 2500, 50000, "20xTratnyr HE", -1],  //      10.20xTratnyr HE
    ["PylonRack_20Rnd_Rocket_03_AP_F", "OPT_Rocket_03_AP_Plane_CAS_02_F", 5000, 100000, "20xTratnyr AP", -1],  //      11.20xTratnyr AP
    ["OPT_PylonMissile_1Rnd_LG_scalpel", "OPT_missiles_SCALPEL", 200000, 200000, "1xScalpel", 0],  //      12.1xScalpel Hellcat, Kajman, Blackfoot
    ["OPT_PylonRack_1Rnd_AAA_missiles", "OPT_missiles_ASRAAM", 25000, 25000, "1xASRAAM", 0],  //      13.1xASRAAM AH9, Orca, Hellcat
    ["OPT_PylonRack_Missile_AGM_02_x1", "OPT_weapon_AGM_65Launcher", 150000, 150000, "1xMacer II", 0],  // 14.1xMacer II
    ["OPT_PylonMissile_1Rnd_AAA_missiles", "OPT_missiles_ASRAAM", 25000, 25000, "1xASRAAM", 0]  //      15.1xASRAAM Blackfoot
];

//Gun Heli independent
//[Magazinename, Waffenname, Preis/Schuss, Preis Magazin, Boxname]
GVAR(gunHeliindependent) = 
[
    ["5000Rnd_762x51_Yellow_Belt", "OPT_M134_minigun", 10, 50000, "5000x7.62 mm"],       // 0.5000x7.62 mm Minigun 
    ["1000Rnd_65x39_Belt_Yellow", "LMG_Minigun_heli", 10, 10000, "1000x6.5 mm mm"],  // 1.1000x6.5 mm mm Minigun 
    ["2000Rnd_65x39_Belt_Yellow", "LMG_Minigun_heli", 10, 20000, "2000x6.5 mm mm"],  // 2.2000x6.5 mm mm Minigun 
    ["1000Rnd_20mm_shells", "OPT_gatling_20mm", 100, 100000, "1000x20 mm"],      // 3.1000x20 mm Minigun
    ["2000Rnd_20mm_shells", "OPT_gatling_20mm", 100, 200000, "2000x20 mm"],      // 4.2000x20 mm Minigun 
    ["300Rnd_20mm_shells", "OPT_gatling_20mm", 100, 30000, "300x20 mm"],         // 5.300x20 mm Minigun 
    ["250Rnd_30mm_HE_shells", "OPT_gatling_30mm", 300, 50000, "250x30 mm HE"],   // 6.250x30 mm HE Cannon Caseless 
    ["250Rnd_30mm_APDS_shells", "OPT_gatling_30mm", 200, 75000, "250x30 mm APDS"],// 7.250x30 mm APSD Cannon Caseless 
    ["OPT_PylonWeapon_300Rnd_20mm_shells", "OPT_Twin_Cannon_20mm", 100, 30000, "300xTwin 20mm"]  // 8.300xTwin 20mm Cannon 
];

//Gun Fahrzeuge independent
//[Magazinename, Waffenname, Preis/Schuss, Preis Magazin, Boxname]
GVAR(gunVehindependent) = 
[
    ["500Rnd_127x99_mag", "HMG_127", 80, 40000, "500x12.7 mm"],  // 0.500x12.7 mm AA MG
    ["200Rnd_127x99_mag", "HMG_127", 80, 16000, "200x12.7 mm"],  // 1.200x12.7 mm AA MG
    ["100Rnd_127x99_mag", "HMG_127", 80, 8000, "100x12.7 mm"],  // 2.100x12.7 mm AA MG
    ["2000Rnd_762x51_Belt", "LMG_coax", 10, 20000, "2000x7.62 mm"],  // 3.2000x7.62 mm LMG
    ["1000Rnd_762x51_Belt", "LMG_coax", 10, 10000, "1000x7.62 mm"],  // 4.1000x7.62 mm LMG
    ["2000Rnd_65x39_Belt", "LMG_RCWS", 7, 14000, "2000x6.5 mm"],  // 5.2000x6.5 mm LMG
    ["1000Rnd_65x39_Belt", "LMG_RCWS", 7, 7000, "1000x6.5 mm"],  // 6.1000x6.5 mm LMG
    ["200Rnd_40mm_G_belt", "GMG_40mm", 1000, 200000, "200x40 mm HE Grenade"],  //  7.200x40 mm HE Grenade
    ["96Rnd_40mm_G_belt", "GMG_40mm", 1000, 96000, "96x40 mm HE Grenade"],  //  8.96x40 mm HE Grenade 
    ["32Rnd_40mm_G_belt", "GMG_40mm", 1000, 32000, "32x40 mm HE Grenade"],  //  9.32x40 mm HE Grenade
    ["200Rnd_20mm_G_belt", "GMG_20mm", 250, 50000, "200x20 mm HE Grenade"],  //  10.200x20 mm HE Grenade
    ["40Rnd_20mm_g_belt", "GMG_20mm", 250, 10000, "40x20 mm HE Grenade"],  //  11.40x20 mm HE Grenade
    ["140Rnd_30mm_MP_shells", "OPT_autocannon_30mm_CTWS", 100, 14000, "140x30 mm HE"],  //  12.140x30 mm HE
    ["60Rnd_30mm_APFSDS_shells", "OPT_autocannon_30mm_CTWS", 400, 24000, "60x30 mm APFSDS"],  //  13.60x30 mm APFSDS
    ["60Rnd_40mm_GPR_shells", "OPT_autocannon_40mm_CTWS", 200, 12000, "60x40 mm HE"],  //  14.60x40 mm HE
    ["40Rnd_40mm_APFSDS_shells", "OPT_autocannon_40mm_CTWS", 700, 28000, "40x40 mm APFSDS"],  //  15.40x40 mm APFSDS
    ["2Rnd_GAT_missiles", "OPT_missiles_titan", 50000, 100000, "2xTitan AT"],  //  16.2xTitan AT  
    ["1Rnd_GAT_missiles", "OPT_missiles_titan_static", 50000, 50000, "1xTitan AT"],  //  17.1xTitan AT
    ["SPG9_HEAT", "launcher_SPG9", 25000, 25000, "1xSPG-9 HEAT"],  //  18.1xSPG-9 HEAT
    ["SPG9_HE", "launcher_SPG9", 1000, 1000, "1xSPG-9 HE"],  //  19.1xSPG-9 HE
    ["OPT_680Rnd_35mm_AA_shells_Tracer_Green", "OPT_autocannon_35mm", 100, 68000, "680xFlak 35 mm"],  //  20.680xFlak 35 mm
    ["OPT_1200Rnd_35mm_AA_shells_Tracer_Green", "OPT_autocannon_35mm", 100, 120000, "1200xFlak 35 mm"],  //  21.1200xFlak 35 mm
    ["4Rnd_Titan_long_missiles", "OPT_missiles_titan_AA", 12500, 50000, "4xTitan AA"],  //  22.4xTitan AA
    ["2Rnd_Titan_long_missiles", "OPT_missiles_titan_AA", 12500, 25000, "2xTitan AA"],  //  23.2xTitan AA
    ["32Rnd_120mm_APFSDS_shells", "cannon_120mm", 5000, 160000, "32x120mm APFSDS"],  //  24.32x120mm APFSDS
    ["30Rnd_120mm_HE_shells", "cannon_120mm", 3000, 90000, "30x120mm HE"],  //  25.30x120mm HE
    ["20Rnd_120mm_HEAT_MP", "cannon_120mm", 4500, 90000, "20x120mm HEAT"],  //  26.20x120mm HEAT
    ["20Rnd_120mm_APFSDS_shells", "cannon_120mm", 5000, 100000, "20x120mm APFSDS"],  //  27.20x120mm APFSDS
    ["16Rnd_120mm_HE_shells", "cannon_120mm", 3000, 48000, "16x120mm HE"],  //  28.16x120mm HE
    ["12Rnd_120mm_HEAT_MP", "cannon_120mm", 4500, 54000, "12x120mm HEAT"],  //  29.12x120mm HEAT
    ["12Rnd_120mm_APFSDS_shells", "cannon_120mm", 5000, 60000, "12x120mm APFSDS"],  //  30.12x120mm APFSDS
    ["8Rnd_120mm_HE_shells", "cannon_120mm", 3000, 24000, "8x120mm HE"],  //  31.8x120mm HE
    ["8Rnd_120mm_HEAT_MP", "cannon_120mm", 4500, 36000, "8x120mm HEAT"],  //  32.8x120mm HEAT
    ["24Rnd_125mm_APFSDS", "cannon_125mm", 6000, 144000, "24x125mm APFSDS"],  //  33.20x125mm APFSDS
    ["12Rnd_125mm_HE", "cannon_125mm", 3500, 42000, "12x125mm HE"],  //  34.12x125mm HE
    ["12Rnd_125mm_HEAT", "cannon_125mm", 5000, 60000, "12x125mm HEAT"],  //  35.12x125mm HEAT
    ["16Rnd_125mm_APFSDS", "cannon_125mm", 6000, 96000, "16x125mm APFSDS"],  // 36.16x125mm APFSDS
    ["8Rnd_125mm_HE", "cannon_125mm", 3500, 28000, "8x125mm HE"],  //  37.8x125mm HE
    ["4Rnd_120mm_cannon_missiles", "cannon_120mm", 50000, 200000, "4x120mm ATGM"],  // 38.4x120mm ATGM
    ["4Rnd_125mm_cannon_missiles", "cannon_125mm", 50000, 200000, "4x125mm ATGM"],  //  39.4x125mm ATGM
    ["OPT_32Rnd_155mm_Mo_shells", "OPT_mortar_155mm_AMOS", 5000, 160000, "32x155 mm HE"],  //  40.32x155 mm HE
    ["OPT_2Rnd_155mm_Mo_Cluster", "OPT_mortar_155mm_AMOS", 2, 4, "2xCluster"],  //  41.2xCluster Shells
    ["6Rnd_155mm_Mo_smoke", "OPT_mortar_155mm_AMOS", 500, 3000, "6xSmoke"],  //  42.6xSmoke 
    ["Vorona_HEAT", "missiles_Vorona", 500, 250000, "1xVorona-HEAT"],  //  43.vorona-test KalleK 
    ["Vorona_HE", "missiles_Vorona", 500, 150000, "1xVorona-HE"],  //  44.vorona-test KalleK 
    ["28Rnd_120mm_APFSDS_shells", "cannon_120mm", 5000, 140000, "28x120mm APFSDS"],  //  45.28x120mm APFSDS
    ["20Rnd_125mm_APFSDS", "cannon_125mm", 6000, 120000, "20x125mm APFSDS"],  //  46.20x125mm APFSDS
    ["12Rnd_120mm_HE_shells", "cannon_120mm", 3000, 36000, "12x120mm HE"],  //  47.12x120mm HE
    ["4Rnd_70mm_SAAMI_missiles", "missiles_SAAMI", 12500, 50000, "4xSAAMI Missile"]  //  48.4xSAAMI Missile
];

//Preis Tarnung, Drahtkäfig, Datalinksystem
GVAR(preisTarnung) = 10000;
GVAR(preisDrahtkafig) = 10000;
GVAR(preisDatalink) = 10000;

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

//independent Einheiten
//[[Raketen], [Gun], [Drahtkäfig, Tranung], [Datalink], [Raketenmagzine, Gunmagazine]]
GVAR(hellcat2) = [[4, 8, 9, 10, 11], [0, 1, 2], [0, 0], [1], [2, 2]]; 
GVAR(striderHMG2) = [[], [0, 1, 2], [0, 0], [1], [0, 4]];
GVAR(striderGMG2) = [[], [7, 8, 9, 10, 11], [0, 0], [1], [0, 4]];
GVAR(MB4WDAT) = [[], [18,19], [0, 0], [1], [0, 4]];
GVAR(gorgon2) = [[], [3, 4, 5, 6, 12, 13, 16], [0, 0], [1], [0, 4]]; 
GVAR(mora2) = [[], [3, 4, 5, 6, 12, 13], [0, 0], [1], [0, 4]]; 
GVAR(NyxAT) = [[], [0, 1, 2, 16], [0, 0], [1], [0, 4]];
GVAR(NyxAA) = [[], [0, 1, 2, 48], [0, 0], [1], [0, 4]];
GVAR(Kuma) = [[], [3, 4, 5, 6, 45, 27, 30, 28, 47, 31, 29, 32, 38], [0, 0], [1], [0, 4]];


//Fahrzeuge die zugelassen sind
GVAR(vehClassWestWW) = 
[
   "OPT4_B_MRAP_01_gmg_F",
    "OPT4_B_MRAP_01_hmg_F",
    "OPT4_B_LSV_01_AT_F",
    "OPT4_B_Heli_Light_01_armed_F",
    "OPT4_B_Heli_light_03_green_F",
    "OPT4_B_Heli_Attack_01_F",
    "OPT4_B_APC_tracked_03_cannon_F",
    "OPT4_B_APC_Wheeled_01_cannon_F",
    "OPT4_B_APC_Tracked_01_rcws_F",
    "OPT4_B_APC_Tracked_01_AA_F",
    "OPT4_B_MBT_01_cannon_F",
    "OPT4_B_MBT_01_TUSK_F",
    "OPT4_B_MBT_01_arty_F",
    "OPT4_B_MBT_03_cannon_F",

//Tropentarn
    "OPT4_B_MRAP_01_gmg_ghex_F",
    "OPT4_B_MRAP_01_hmg_ghex_F",
    "OPT4_B_LSV_01_AT_ghex_F",
    "OPT4_B_Heli_Light_01_armed_F",
    "OPT4_B_Heli_light_03_green_F",
    "OPT4_B_Heli_Attack_01_F",
    "OPT4_B_APC_tracked_03_cannon_ghex_F",
    "OPT4_B_APC_Wheeled_01_cannon_ghex_F",
    "OPT4_B_APC_Tracked_01_rcws_ghex_F",
    "OPT4_B_APC_Tracked_01_AA_ghex_F",
    "OPT4_B_MBT_01_cannon_ghex_F",
    "OPT4_B_MBT_01_TUSK_ghex_F",
    "OPT4_B_MBT_01_arty_ghex_F",
    "OPT4_B_MBT_03_cannon_ghex_F"        
];

GVAR(vehClassEastWW) = 
[
    "OPT4_O_MRAP_02_hmg_F", 
    "OPT4_O_MRAP_02_gmg_F",
    "OPT4_O_LSV_02_AT_F",    
    "OPT4_O_Heli_light_03_F",
    "OPT4_O_Heli_Light_02_F",
    "OPT4_O_Heli_Attack_02_F",    
    "OPT4_O_APC_Wheeled_02_rcws_F",
    "OPT4_O_APC_Wheeled_03_cannon_F",
    "OPT4_O_APC_Tracked_02_cannon_F",
    "OPT4_O_APC_Tracked_02_AA_F",
    "OPT4_O_MBT_02_cannon_F",
    "OPT4_O_MBT_02_arty_F",
    "OPT4_O_MBT_04_cannon_F",

//Tropentarn
    "OPT4_O_T_MRAP_02_hmg_ghex_F", 
    "OPT4_O_MRAP_02_gmg_ghex_F",
    "OPT4_O_LSV_02_AT_GHEX_F",
    "OPT4_O_T_APC_Wheeled_02_rcws_ghex_F",
    "OPT4_O_APC_Wheeled_03_cannon_ghex_F",
    "OPT4_O_T_APC_Tracked_02_cannon_ghex_F",
    "OPT4_O_T_APC_Tracked_02_AA_ghex_F",
    "OPT4_O_T_MBT_02_cannon_ghex_F",    
    "OPT4_O_T_MBT_02_arty_ghex_F"    
];

GVAR(vehClassindependentWW) = 
[
    "OPT4_I_MRAP_03_gmg_F",
    "OPT4_I_MRAP_03_hmg_F",
    "OPT4_I_C_Offroad_02_AT_F",
    "OPT_I_Heli_light_03_F",
    "OPT4_I_APC_tracked_03_cannon_F",
    "OPT4_I_APC_Wheeled_03_cannon_F",
    "OPT4_I_LT_01_AT_F",
    "OPT4_I_LT_01_AA_F",
    "OPT4_I_MBT_03_cannon_F"
];

GVAR(textSlotWest) = 
[
    "OPT_NATO_Offizier"
];

GVAR(textSlotEast) = 
[
    "OPT_CSAT_Offizier"
];

GVAR(textSlotindependent) = 
[
    "I_officer_F"
];

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

//independent Einheiten Loadouts 
//[[Raketen], [Gun], [Drahtkäfig, Tranung], [Datalink]]  
GVAR(hellcat2Loadout) = [[4,4], [0], [0, 0], [0]]; 
GVAR(striderHMG2Loadout) = [[], [0], [0, 0], [0]];
GVAR(striderGMG2Loadout) = [[], [7], [0, 0], [0]];
GVAR(MB4WDATLoadout) = [[], [18, 18, 19, 19], [0, 0], [0]];
GVAR(gorgon2Loadout) =  [[], [3, 12, 13], [0, 0], [0]];  
GVAR(mora2Loadout) = [[], [3, 12, 13], [0, 0], [0]]; 
GVAR(NyxATLoadout) = [[], [3, 16, 16], [0, 0], [0]]; 
GVAR(NyxAALoadout) = [[], [0, 0, 48, 48], [0, 0], [0]];
GVAR(KumaLoadout) = [[], [3, 45, 28, 29], [0, 0], [0]];

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

GVAR(pad_veh_independent) =
[
    FahrzeugBoxindependent1,
    FahrzeugBoxindependent2,
    FahrzeugBoxindependent3,
    FahrzeugBoxindependent4,
    FahrzeugBoxindependent5,
    FahrzeugBoxindependent6,
    FahrzeugBoxindependent7,
    FahrzeugBoxindependent8
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

GVAR(pad_air_independent) =
[
    HeliBoxindependent1,
    HeliBoxindependent2
];

GVAR(pad_plane_east) =
[
    PlaneBoxEast
];

GVAR(pad_plane_west) =
[
    PlaneBoxWest
];

GVAR(pad_plane_independent) =
[
    PlaneBoxIndependent
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

GVAR(pad_sup_independent) =
[
    AusruestungBoxindependent1,
    AusruestungBoxindependent2,
    AusruestungBoxindependent3,
    AusruestungBoxindependent4,
    AusruestungBoxindependent5,
    AusruestungBoxindependent6,
    AusruestungBoxindependent7,
    AusruestungBoxindependent8
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

GVAR(pad_sea_independent) =
[
    SeaBoxindependent1,
    SeaBoxindependent2
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

GVAR(pad_all_independent) =
    GVAR(pad_veh_independent) +
    GVAR(pad_air_independent) +
    GVAR(pad_plane_independent) +
    GVAR(pad_sup_independent) +
    GVAR(pad_sea_independent);

GVAR(all_item_classnames) = [];
{
    GVAR(all_item_classnames) pushBackUnique (_x select 0);
} forEach GVAR(all);
