/**
* Author: James
* initialize all opt objects with correct ACE Cargo settings
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call func(setupCargoSpaceAndSize);
*
*/
#include "macros.hpp"

/****** LOAD IN VEHICLE  ******/
/*
* [cursorTarget, 3] call ace_cargo_fnc_setSize // -1 -> not loadable, 
* [vehicle player, 20] call ace_cargo_fnc_setSpace   // -> -1, no cargo possible
 Arguments:
 * 0: Any object <OBJECT>
 * 1: true to enable dragging, false to disable <BOOL>
 * 2: Position offset for attachTo command (optinal; default: [0,0,0])<ARRAY>
 * 3: Direction in degree to rotate the object after attachTo (optional; default: 0) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object, true, [0,0,0], 0] call ace_dragging_fnc_setDraggable;

 * Arguments:
 * 0: Any object <OBJECT>
 * 1: true to enable carrying, false to disable <BOOL>
 * 2: Position offset for attachTo command <ARRAY> (default: [0,1,1])
 * 3: Direction in degree to rotate the object after attachTo <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [object, true, [0,1,1], 0] call ace_dragging_fnc_setCarryable;
 */

/* FORMAT
* (classname, cargo space): Wenn cargo space = -1, dann cargo deaktiviert
*/

DUMP("Successfully loaded the OPT/CARGO fn_setupCargoSpaceAndSize module");

// Laderaum den ein Objekt hat
GVAR(canTransportCargo) = 
[
// NATO CUP
    ["OPT_CUP_B_M1030_USA", 0],               // Motorrad M1030 (0)
    ["OPT_CUP_B_LR_Transport_GB_W", 4],       // Land Rover 110
    ["OPT_CUP_B_LR_MG_GB_W", 4],              // Land Rover M2
    ["OPT_CUP_B_LR_AA_RACS", 1],              // Landrover AA
    ["OPT_CUP_B_HMMWV_Unarmed_USMC", 4],      // HMMWV
    ["OPT_CUP_B_HMMWV_M2_USMC", 4],           // HMMWV M2
    ["OPT_CUP_B_MTVR_USMC", 8],               // MTVR
    ["OPT_CUP_B_MTVR_Repair_USMC", 4],        // MTVR Rep
    ["OPT_CUP_B_HMMWV_Ambulance_USMC", 0],    // HMMWV Ambulance (0)
    ["OPT_CUP_B_MTVR_Ammo_USMC",  4],         // MTVR Ammo
    ["OPT_CUP_B_MTVR_Refuel_USMC", 4],        // MTVR Tank
    ["OPT_CUP_MH60S_Unarmed_USN", 4],         // MH-60S Seahawk
    ["OPT_CUP_B_UH1D_armed_GER_KSK", 4],      // UH-1D
    ["OPT_CUP_B_CH53E_USMC", 4],              // CH53G Super Stallion
    ["OPT_CUP_B_AH64D_DL_USA", 1],            // AH-64
    ["OPT_CUP_C_Cessna_172_CIV_BLUE", 0],     // Caesar BTT
    ["OPT_CUP_C_AN2_CIV", 2],                 // Antonov An-2
    ["OPT_CUP_C_DC3_ChernAvia_CIV", 2],       // Li-2
    ["OPT_CUP_B_C130J_USMC", 4],              // C130J
    ["OPT_CUP_B_L39_CZ_GREY", 0],             // L-39AZ
    ["OPT_CUP_B_LAV25_HQ_USMC", 1],           // LAV C2
    ["OPT_CUP_B_M2Bradley_USA_W", 1],         // M2A2 Bradley IFV
    ["OPT_CUP_B_M163_USA", 1],                // M163A1 VADS (50er Magazine)
    ["OPT_CUP_B_M60A3_TTS_USMC", 1],          // M60A3 TTS
    ["OPT_CUP_B_Leopard2A6_GER", 1],          // Leopard2A6
    ["OPT_CUP_B_HMMWV_TOW_USMC", 1],          // HMMWV TOW
    ["OPT_CUP_B_RM70_CZ", 0],                 // RM-70 nicht nachladbar

// NATO Vehicles    
    ["OPT_B_Quadbike_01_F", 2],                    // Quadbike
    ["OPT_B_T_LSV_01_unarmed_F", 4],               // Prowler unarmed 
    ["OPT_B_T_LSV_01_armed_F", 4],                 // Prowler armed
    ["OPT_B_G_Offroad_01_F", 4],                   // Pickup
    ["OPT_B_G_Offroad_01_armed_F", 4],             // Pickup HMG
    ["OPT_B_MRAP_01_F", 4],                        // Hunter
    ["OPT4_B_MRAP_01_hmg_F", 4],                   // Hunter HMG
    ["OPT_B_Truck_01_covered_F", 4],               // HEMTT Transport
    ["OPT_B_Truck_01_Repair_F", 2],               // HEMTT Repair
    ["OPT_B_Truck_01_medical_F", 2],              // HEMTT Medical
    ["OPT_B_Truck_01_transport_F", 10],             // HEMTT  
    ["OPT_B_Truck_01_ammo_F", 2],                     // HEMTT Ammo
    ["OPT_B_Truck_01_fuel_F", 2],                      // HEMTT Fuel

//Tropentarn
    ["OPT_B_Quadbike_01_ghex_F", 2],               // Quadbike
    ["OPT_B_T_LSV_01_unarmed_ghex_F", 4],          // Prowler unarmed 
    ["OPT_B_T_LSV_01_armed_ghex_F", 4],            // Prowler armed
    ["OPT_B_G_Offroad_01_ghex_F", 4],              // Pickup
    ["OPT_B_G_Offroad_01_armed_ghex_F", 4],           // Pickup HMG
    ["OPT_B_MRAP_01_ghex_F", 4],                    // Hunter
    ["OPT4_B_MRAP_01_hmg_ghex_F", 4],             // Hunter HMG
    ["OPT_B_Truck_01_covered_ghex_F", 4],          // HEMTT Transport
    ["OPT_B_Truck_01_Repair_ghex_F", 2],          // HEMTT Repair
    ["OPT_B_Truck_01_medical_ghex_F", 2],         // HEMTT Medical
    ["OPT_B_Truck_01_transport_ghex_F", 10],        // HEMTT 
    ["OPT_B_Truck_01_ammo_ghex_F", 2],            // HEMTT Ammo
    ["OPT_B_Truck_01_fuel_ghex_F", 2],             // HEMTT Fuel        
    
// NATO Armored    
    ["OPT4_B_LSV_01_AT_F", 4],                     // Prowler AT 
    ["OPT4_B_MRAP_01_gmg_F", 4],                        // Hunter GMG 
    ["OPT4_B_APC_Tracked_01_rcws_F", 4],          // IFV-6c Panther
    ["OPT4_B_APC_Wheeled_01_cannon_F", 4],        // AMV-7 Marshall    
    ["OPT4_B_APC_tracked_03_cannon_F", 4],        // FV-720 Mora   
    ["OPT4_B_APC_Tracked_01_AA_F", 2],           // IFV-6a Cheetah    
    ["OPT4_B_MBT_01_cannon_F", 2],                    // M2A4 Slammer
    ["OPT4_B_MBT_01_TUSK_F", 2],                 // M2A4 SlammerUp
    ["OPT4_B_MBT_03_cannon_F", 2],                     // MBT-52 Kuma
    ["OPT4_B_MBT_01_Arty_F", 2],                       // M4 Scorcher
    ["OPT_B_MBT_01_mlrs_F", 2],                      // M5 Sandstorm    

//Tropentarn
    ["OPT4_B_LSV_01_AT_ghex_F", 4],                     // Prowler AT
    ["OPT4_B_MRAP_01_gmg_ghex_F", 4],                        // Hunter GMG
    ["OPT4_B_APC_Tracked_01_rcws_ghex_F", 4],          // IFV-6c Panther
    ["OPT4_B_APC_Wheeled_01_cannon_ghex_F", 4],        // AMV-7 Marshall    
    ["OPT4_B_APC_tracked_03_cannon_ghex_F", 4],        // FV-720 Mora   
    ["OPT4_B_APC_Tracked_01_AA_ghex_F", 2],           // IFV-6a Cheetah    
    ["OPT4_B_MBT_01_cannon_ghex_F", 2],                    // M2A4 Slammer
    ["OPT4_B_MBT_01_TUSK_ghex_F", 2],                 // M2A4 SlammerUp
    ["OPT4_B_MBT_03_cannon_ghex_F", 2],                     // MBT-52 Kuma
    ["OPT4_B_MBT_01_Arty_ghex_F", 2],                       // M4 Scorcher
    ["OPT_B_MBT_01_mlrs_ghex_F", 2],                      // M5 Sandstorm      
    
// NATO Helicopters    
    ["OPT_B_Heli_Light_01_F", 4],                 // MH-9 Hummingbird
    ["OPT4_B_Heli_Light_01_armed_F", 4],              // AH-9 Pawnee 
    ["OPT4_B_Heli_light_03_green_F", 4],          // WY-55 Hellcat
    ["OPT_B_Heli_Transport_01_F", 4],             // UH-80 Ghosthawk
    ["OPT_B_Heli_Transport_02_F", 10],               // CH-49 Mohawk (Transport+Lift)
    ["OPT_B_Heli_Transport_03_unarmed_F", 10],    // CH-67 Huron unarmed (Transport+Lift)
    ["OPT_B_Heli_Transport_03_F", 10],            // CH-67 Huron armed (Transport+Lift)
    ["OPT_B_UAV_02_light_F", 0],                 // Greyhawk unbewaffnet
    ["OPT_B_UAV_02_CAS_F", 0],                        // Greyhawk LGB
    ["OPT_B_UAV_02_F", 0],                            // Greyhawk Raketen    
    ["OPT4_B_Heli_Attack_01_F", 0],                   // AH-99 Blackfoot 
    ["OPT_B_T_VTOL_01_infantry_F", 4],                // VTOL Blackfish (Inf-Transport) 
    ["OPT_B_T_VTOL_01_vehicle_F", 10],                 // VTOL Blackfish (Fahrzeug-Transport)
    ["OPT_B_T_VTOL_02_infantry_unarmed_F", 2],           // VTOL Y-32 Xi'an (Inf-Transport)
    ["OPT_B_Plane_CAS_01_F", 0],                      // A-164 Wipeout
    ["OPT_B_Plane_Fighter_01_Stealth_F", 0],               // F/A-181 Black Wasp II   

// NATO ships
    ["OPT_B_Boat_Transport_01_F", 4],                    // Assault Boat     - hinzugefügt
    ["OPT_B_Boat_Armed_01_minigun_F", 4],                // Speedboat Minigun    - hinzugefügt
    ["OPT_B_C_Boat_Transport_02_F", 4],                    // Rhib unbewaffnet      - hinzugefügt
    
// NATO supplies/drohnen    
    ["OPT_B_UGV_01_F", 6],                                // UGV Stomper

//Tropentarn
    ["OPT_B_UGV_01_ghex_F", 6],                         // UGV Stomper

// OPFOR CUP
    ["OPT_CUP_O_TT650_TKA", 0],               // Motorrad TT650 (0)  
    ["OPT_CUP_O_UAZ_Unarmed_RU", 4],          // UAZ 469
    ["OPT_CUP_O_UAZ_MG_RU", 4],               // UAZ 469 DShKM
    ["OPT_CUP_O_LR_AA_TKA", 1],               // UAZ AA    
    ["OPT_CUP_O_GAZ_Vodnik_Unarmed_RU", 4],   // GAZ 3937 Vodnik
    ["OPT_CUP_O_GAZ_Vodnik_PK_RU", 4],        // GAZ 3937 Vodnik 2xPKM
    ["OPT_CUP_O_Ural_TKA", 8],                // Ural
    ["OPT_CUP_O_Ural_Repair_TKA", 4],         // Ural Rep
    ["OPT_CUP_O_GAZ_Vodnik_MedEvac_RU", 0],   // GAZ 3937 Vodnik Medic (0)
    ["OPT_CUP_O_Ural_Reammo_TKA", 4],         // Ural Ammo
    ["OPT_CUP_O_Ural_Refuel_TKA", 4],         // Ural Tank
    ["OPT_CUP_O_SA330_Puma_HC1_BAF", 4],      // SA-330 Puma 
    ["OPT_CUP_O_Ka60_Grey_RU", 4],            // KA-60 Kataska
    ["OPT_CUP_O_Merlin_HC3_GB", 4],           // Merlin HC3A
    ["OPT_CUP_O_Mi24_V_Dynamic_RU", 1],       // MI-24V
    ["OPT_CUP_C_Cessna_172_CIV_GREEN", 0],    // Cessna
    ["OPT_CUP_O_AN2_TK", 2],                  // Antonov An-2
    ["OPT_CUP_O_C47_SLA", 2],                 // Li-2
    ["OPT_CUP_O_C130J_TKA", 4],               // C130J
    ["OPT_CUP_O_Su25_Dyn_RU", 0],             // SU-25T
    ["OPT_CUP_O_ZSU23_Afghan_SLA", 1],        // ZSU-23-4 Afghanski (50er Magazine)
    ["OPT_CUP_O_T72_RU", 1],                  // T72
    ["OPT_CUP_O_T90_RU", 1],                  // T90
    ["OPT_CUP_O_BTR60_RU", 1],                // BTR-60 PB
    ["OPT_CUP_O_BTR90_RU", 1],                // BTR90 ohne GMG, Preis?    
    ["OPT_CUP_O_BRDM2_ATGM_RUS", 1],          // BRDM-2 ATGM    
    ["OPT_CUP_O_BM21_RU", 0],                 // BM21 nicht nachladbar

    
// CSAT Vehicles    
    ["OPT_O_Quadbike_01_F", 2],                    // Quadbike-
    ["OPT_O_T_LSV_02_unarmed_F", 4],               // Quilin unarmed 
    ["OPT_O_T_LSV_02_armed_F", 4],                 // Quilin armed 
    ["OPT_O_G_Offroad_01_F", 4],                   // Pickup
    ["OPT_O_G_Offroad_01_armed_F", 4],                // Pickup HMG
    ["OPT_O_MRAP_02_F", 4],                        // Ifrit-
    ["OPT4_O_MRAP_02_hmg_F", 4],                  // Ifrit HMG
    ["OPT_O_Truck_03_covered_F", 4],               // Tempest Transport
    ["OPT_O_Truck_03_transport_F", 10],         // Tempest 
    ["OPT_O_Truck_03_repair_F", 2],               // Tempest Repair
    ["OPT_O_Truck_03_medical_F", 2],              // Tempest Medicalasa
    ["OPT_O_Truck_03_ammo_F", 2],              // Tempest Ammo
    ["OPT_O_Truck_03_fuel_F", 2],              // Tempest Fuel

//Tropentarn
    ["OPT_O_T_Quadbike_01_ghex_F", 2],                // Quadbike 
    ["OPT_O_T_LSV_02_unarmed_ghex_F", 4],                  // Quilin unarmed 
    ["OPT_O_T_LSV_02_armed_ghex_F", 4],                    // Quilin armed 
    ["OPT_O_G_Offroad_01_F", 4],                      // Pickup
    ["OPT_O_G_Offroad_01_armed_F", 4],                // Pickup HMG
    ["OPT_O_T_MRAP_02_ghex_F", 4],                    // Ifrit 
    ["OPT_O_T_MRAP_02_hmg_ghex_F", 4],                // Ifrit HMG 
    ["OPT_O_T_Truck_03_covered_ghex_F", 4],           // Tempest Transport 
    ["OPT_O_T_Truck_03_transport_ghex_F", 10],         // Tempest 
    ["OPT_O_T_Truck_03_repair_ghex_F", 2],            // Tempest Repair
    ["OPT_O_T_Truck_03_medical_ghex_F", 2],          // Tempest Medical
    ["OPT_O_T_Truck_03_ammo_ghex_F", 2],                 // Tempest Ammo
    ["OPT_O_T_Truck_03_fuel_ghex_F", 2],                 // Tempest Fuel
    ["OPT_O_T_Truck_02_F", 4],           // Zamack Infanterie
    ["OPT_O_T_Truck_02_transport_F", 10],         // Zamack Logistik
    ["OPT_O_T_Truck_02_box_F", 2],            // Zamack Repair
    ["OPT_O_T_Truck_02_ammo_F", 2],                 // Zamack Ammo
    ["OPT_O_T_Truck_02_fuel_F", 2],                 // Zamack Fuel
    ["OPT_O_T_Truck_02_Medical_F", 2],          // Zamack Medical
    
// CSAT Armored
    ["OPT4_O_MRAP_02_gmg_F", 4],                  // Ifrit GMG
    ["OPT4_O_LSV_02_AT_F", 4],                    // Quilin AT 
    ["OPT4_O_APC_Wheeled_02_rcws_F", 4],          // MSE-3 Marid 
    ["OPT4_O_APC_Wheeled_03_cannon_F", 4],       // AFV-4 Gorgon
    ["OPT4_O_APC_Tracked_02_cannon_F", 4],       // BTR-K Kamysh
    ["OPT4_O_APC_Tracked_02_AA_F", 2],           // ZSU-39 Tigris
    ["OPT4_O_MBT_02_cannon_F", 2],               // T-100 Varsuk
    ["OPT4_O_MBT_04_cannon_F", 2],               // T-140 Angara
    ["OPT4_O_MBT_02_arty_F", 2],                 // 2S9 Sochor
    ["OPT_O_Truck_02_MRL_F", 2],                 // Zamark MRL    

//Tropentarn
    ["OPT_O_MRAP_02_gmg_ghex_F", 4],                  // Ifrit GMG
    ["OPT_O_LSV_02_AT_GHEX_F", 4],                    // Quilin AT 
    ["OPT_O_T_APC_Wheeled_02_rcws_ghex_F", 4],       // MSE-3 Marid 
    ["OPT_O_APC_Wheeled_03_cannon_ghex_F", 4],               // AFV-4 Gorgon
    ["OPT_O_T_APC_Tracked_02_cannon_ghex_F", 4],     // BTR-K Kamysh 
    ["OPT_O_T_APC_Wheeled_01_cannon_F_INF", 4],     // Marchall Infanterie 
    ["OPT_O_T_APC_Tracked_02_cannon_ghex_F_VEH", 4],     // BTR-K Kamysh Fahrzeug
    ["OPT_O_T_APC_Tracked_02_cannon_ghex_F_AT", 4],     // BTR-K Kamysh Tank 
    ["OPT_O_T_APC_Tracked_02_AA_ghex_F", 2],         // ZSU-39 Tigris 
    ["OPT_O_T_MBT_02_cannon_ghex_F", 2],             // T-100 Varsuk 
    ["OPT_O_T_MBT_02_cannon_ghex_F_INF", 2],             // T-100 Varsuk Infanterie
    ["OPT_O_T_MBT_02_cannon_ghex_F_AT", 2],             // T-100 Varsuk Fahrzeug
    ["OPT_O_T_MBT_02_arty_ghex_F", 2],               // 2S9 Sochor 
    ["OPT_O_Truck_02_MRL_ghex_F", 2],                 // Zamark MRL  
    
// CSAT Helicopter
    ["OPT_O_Heli_Light_01_F", 4],                 // MH6
    ["OPT_O_Heli_Light_03_unarmed_F", 4],             // WY-55 Hellcat
    ["OPT4_O_Heli_light_03_F", 4],                    // WY-55 Hellcat
    ["OPT_O_Heli_Light_02_unarmed_F", 4],             // PO-30 Orca
    ["OPT4_O_Heli_Light_02_F", 4],                   // PO-30 Orca
    ["OPT_O_Heli_Light_02_v2_F", 4],                   // PO-30 Orca Cas Light
    ["OPT_O_Heli_Light_02_v3_F", 4],                   // PO-30 Orca Cas Heavy
    ["OPT_O_Heli_Transport_04_covered_F", 4],    // Mi-290 Taru (Transport)
    ["OPT_O_Heli_Transport_04_F", 10],    // Mi-290 Taru (Lift)
    ["OPT_O_Heli_Transport_04_fuel_F", 4],    // Mi-290 Taru (Fuel)
    ["OPT_O_Heli_Transport_04_box_F", 4],    // Mi-290 Taru (Rep)
    ["OPT_O_Heli_Transport_04_ammo_F", 4],    // Mi-290 Taru (Anmmo)
    ["OPT_O_Heli_Transport_02_F", 10],            // CH-49 Mohawk (Transport+Lift)
    ["OPT_O_UAV_02_light_F", 0],                 // Ababil unbewaffnet
    ["OPT_O_UAV_02_CAS_F", 0],                        // Ababil GBU-12
    ["OPT_O_UAV_02_F", 0],                            // Ababil Scalpel 
    ["OPT4_O_Heli_Attack_02_F", 0],                   // Mi-48 Kajman    
    ["OPT_O_T_VTOL_02_infantry_unarmed_F", 2],           // VTOL Y-32 Xi'an (Inf-Transport)
    ["OPT_O_T_VTOL_02_vehicle_unarmed_F", 10],         // VTOL Y-32 Xi'an (Fahrzeug-Transport) 
    ["OPT_O_T_VTOL_01_vehicle_F", 10],                    // VTOL Blackfish (Fahrzeug-Transport)
    ["OPT_O_Plane_CAS_02_F", 0],                      // To-199 Neophron
    ["OPT_O_Plane_Fighter_AA_02_F", 0],                  // To-201 Shikra 
    ["OPT_O_Plane_CAS_01_F_1" , 0],                  // Wipeout CAS 
    ["OPT_O_Plane_Fighter_01_Stealth_F", 0],          // F/A-181 Black Wasp II  
    
// CSAT Supplies    
    ["OPT_O_T_UGV_01_ghex_F", 6],                        // UGV Saif    

// Vanilla
    ["OPT_O_UGV_01_F", 6],                                // UGV Saif    

// CSAT Ships
    ["OPT_O_Boat_Transport_01_F", 4],                    // Assault Boat
    ["OPT_O_Boat_Armed_01_hmg_F", 4],                    // Speedboat HMG
    ["OPT_O_C_Boat_Transport_02_F", 4],                    // rhib unbewaffnet    

// AAF Vehicles
    ["OPT_I_Quadbike_01_F", 2],                    // Quadbike
    ["OPT_I_C_Offroad_02_unarmed_F", 4],               // Jeep unarmed 
    ["OPT_I_C_Offroad_02_LMG_F", 4],                 // Jeeg MG
    ["OPT_I_MRAP_03_F", 4],                        // Strider
    ["OPT_I_MRAP_03_hmg_F", 4],                   // Strider HMG
    ["OPT_I_Truck_02_covered_F", 4],               // Zamak Transport
    ["OPT_I_Truck_02_box_F", 2],               // Zamak Repair
    ["OPT_I_Truck_02_transport_F", 10],               // Zamak  
    ["OPT_I_Truck_02_ammo_F", 2],               // Zamak Ammo
    ["OPT_I_Truck_02_fuel_F", 2],               // Zamak Fuel
    ["OPT_I_Truck_02_medical_F", 2],               // Zamak Medical

// AAF Choppers
    ["OPT_I_Heli_light_03_F", 4],                 // WY-55 Hellcat
    ["OPT_I_Heli_light_03_v2_F", 4],                 // WY-55 Hellcat Cas Light
    ["OPT_I_Heli_light_03_v3_F", 4],                 // WY-55 Hellcat Cas Heavy
    ["OPT_I_Heli_light_03_unarmed_F", 4],          // WY-55 Hellcat Unbewaffnet
    ["OPT_I_Heli_Transport_02_F", 10],                   // CH-49 Mohawk (Transport+Lift)
    ["OPT_I_UAV_02_light_F", 0],                 // Greyhawk unbewaffnet

// AAF Armored
    ["OPT4_I_C_Offroad_02_AT_F", 4],                     // Jeep AT 
    ["OPT_I_LSV_01_AT_ghex_F", 4],                     // Prowler AT 
    ["OPT_I_MRAP_03_gmg_F", 4],                        // Strider GMG 
    ["OPT_I_APC_Wheeled_03_cannon_F", 4],        // Gorgon    
    ["OPT_I_APC_tracked_03_cannon_F", 4],        // FV-720 Mora
    ["OPT_I_APC_tracked_03_cannon_F_INF", 4],        // FV-720 Mora Infanterie 
    ["OPT_I_APC_Wheeled_03_cannon_F_VEH", 4],        // Gorgon Fahrzeug
    ["OPT_I_APC_Wheeled_03_cannon_F_AT", 4],        // Gorgon Tank
    ["OPT_I_LT_01_AA_F", 2],                     // Nyx AA    
    ["OPT_I_LT_01_AT_F", 2],                    // Nyx AT
    ["OPT_I_LT_01_scout_F", 2],                    // Nyx Recon
    ["OPT_I_APC_Tracked_01_AA_ghex_F", 2],                    // AA cheetah    
    ["OPT_I_MBT_03_cannon_F", 2],                     // MBT-52 Kuma
    ["OPT_I_MBT_03_cannon_F_INF", 2],                     // MBT-52 Kuma Infanterie
    ["OPT_I_MBT_03_cannon_F_AT", 2],                     // MBT-52 Kuma Fahrzeug
    ["OPT_I_MBT_01_arty_ghex_F", 2],                      // Scorcher Arty 
    ["OPT_I_Truck_02_MRL_F", 2],                      // Zamak Arty 

// AAF Stomper    
    ["OPT_I_UGV_01_F", 6],                         // UGV Stomper       

// AAF Ships
    ["OPT_I_Boat_Armed_01_minigun_F", 4],         // Speedboat Minigun
    ["OPT_I_Boat_Transport_01_F", 4],               // Assault Boat
    ["OPT_I_C_Boat_Transport_02_F", 4]             // Rhib unbewaffnet    
];

/**
 * List of class names of objects which can be loaded in transport vehicle/cargo.
 * The second element of the nested arrays is the cost capacity (in relation with the capacity of the vehicles).
 * (classname, cargo size): Wenn cargo size = -1, dann Verladen deaktiviert
*/

//Platzbedarf eines Objekts
GVAR(canBeTransported) =
[
// NATO CUP
    ["OPT_CUP_B_M1030_USA", 2],               // Motorrad M1030 (0)
    ["OPT_CUP_B_LR_Transport_GB_W", 5],       // Land Rover 110
    ["OPT_CUP_B_LR_MG_GB_W", 5],              // Land Rover M2
    ["OPT_CUP_B_LR_AA_RACS", 8],              // Landrover AA
    ["OPT_CUP_B_HMMWV_Unarmed_USMC", 5],      // HMMWV
    ["OPT_CUP_B_HMMWV_M2_USMC", 5],           // HMMWV M2
    ["OPT_CUP_B_MTVR_USMC", 10],              // MTVR
    ["OPT_CUP_B_MTVR_Repair_USMC", 10],       // MTVR Rep
    ["OPT_CUP_B_HMMWV_Ambulance_USMC", 5],    // HMMWV Ambulance (0)
    ["OPT_CUP_B_MTVR_Ammo_USMC", 10],         // MTVR Ammo
    ["OPT_CUP_B_MTVR_Refuel_USMC", 10],       // MTVR Tank
    ["OPT_CUP_MH60S_Unarmed_USN", 10],        // MH-60S Seahawk
    ["OPT_CUP_B_UH1D_armed_GER_KSK", 10],     // UH-1D
    ["OPT_CUP_B_CH53E_USMC", 10],             // CH53G Super Stallion
    ["OPT_CUP_B_AH64D_DL_USA", 10],           // AH-64
    ["OPT_CUP_C_Cessna_172_CIV_BLUE", 10],    // Caesar BTT
    ["OPT_CUP_C_AN2_CIV", 10],                // Antonov An-2
    ["OPT_CUP_C_DC3_ChernAvia_CIV", 10],      // Li-2
    ["OPT_CUP_B_C130J_USMC", 10],             // C130J
    ["OPT_CUP_B_L39_CZ_GREY", 10],            // L-39AZ
    ["OPT_CUP_B_LAV25_HQ_USMC", 8],           // LAV C2
    ["OPT_CUP_B_M2Bradley_USA_W", 8],         // M2A2 Bradley IFV
    ["OPT_CUP_B_M163_USA", 8],                // M163A1 VADS (50er Magazine)
    ["OPT_CUP_B_M60A3_TTS_USMC", 10],         // M60A3 TTS
    ["OPT_CUP_B_Leopard2A6_GER", 10],         // Leopard2A6
    ["OPT_CUP_B_HMMWV_TOW_USMC", 8],          // HMMWV TOW
    ["OPT_CUP_B_RM70_CZ", 5],                 // RM-70 nicht nachladbar
    ["CUP_B_SearchLight_static_USMC", 2],     // searchlight
    ["CUP_B_M252_USMC", 2],                   // m252 81mm
    ["CUP_B_TOW2_TriPod_USMC", 5],            // m220 tow 2
    ["CUP_B_M2StaticMG_MiniTripod_USMC", 2],  // M2 HD ministativ
    ["CUP_B_M2StaticMG_USMC", 2],             // M2 HD Hoch
    ["CUP_B_Stinger_AA_pod_Base_USMC", 5],    // FIM92
    ["OPT_CUP_B_M119_USMC", 5],               // M119
    ["OPT_CUP_B_M119_AT_USMC", 5],            // M119-AT

// NATO Vehicles    
    ["OPT_B_Quadbike_01_F", 4],                    // Quadbike
    ["OPT_B_T_LSV_01_unarmed_F", 5],               // Prowler unarmed 
    ["OPT_B_T_LSV_01_armed_F", 5],                 // Prowler armed
    ["OPT_B_G_Offroad_01_F", 5],                   // Pickup
    ["OPT_B_G_Offroad_01_armed_F", 5],             // Pickup HMG
    ["OPT_B_MRAP_01_F", 5],                        // Hunter
    ["OPT4_B_MRAP_01_hmg_F", 5],                   // Hunter HMG
    ["OPT_B_Truck_01_covered_F", 10],               // HEMTT Transport
    ["OPT_B_Truck_01_Repair_F", 10],               // HEMTT Repair
    ["OPT_B_Truck_01_medical_F", 10],              // HEMTT Medical
    ["OPT_B_Truck_01_transport_F", 10],             // HEMTT  
    ["OPT_B_Truck_01_ammo_F", 10],                     // HEMTT Ammo
    ["OPT_B_Truck_01_fuel_F", 10],                      // HEMTT Fuel

//Tropentarn
    ["OPT_B_Quadbike_01_ghex_F", 4],               // Quadbike
    ["OPT_B_T_LSV_01_unarmed_ghex_F", 5],          // Prowler unarmed 
    ["OPT_B_T_LSV_01_armed_ghex_F", 5],            // Prowler armed
    ["OPT_B_G_Offroad_01_ghex_F", 5],              // Pickup
    ["OPT_B_G_Offroad_01_armed_ghex_F", 5],           // Pickup HMG
    ["OPT_B_MRAP_01_ghex_F", 5],                    // Hunter
    ["OPT4_B_MRAP_01_hmg_ghex_F", 5],             // Hunter HMG
    ["OPT_B_Truck_01_covered_ghex_F", 10],          // HEMTT Transport
    ["OPT_B_Truck_01_Repair_ghex_F", 10],          // HEMTT Repair
    ["OPT_B_Truck_01_medical_ghex_F", 10],         // HEMTT Medical
    ["OPT_B_Truck_01_transport_ghex_F", 10],        // HEMTT 
    ["OPT_B_Truck_01_ammo_ghex_F", 10],            // HEMTT Ammo
    ["OPT_B_Truck_01_fuel_ghex_F", 10],             // HEMTT Fuel        
    
// NATO Armored    
    ["OPT4_B_LSV_01_AT_F", 5],                     // Prowler AT 
    ["OPT4_B_MRAP_01_gmg_F", 5],                        // Hunter GMG 
    ["OPT4_B_APC_Tracked_01_rcws_F", 10],          // IFV-6c Panther
    ["OPT4_B_APC_Wheeled_01_cannon_F", 10],        // AMV-7 Marshall    
    ["OPT4_B_APC_tracked_03_cannon_F", 10],        // FV-720 Mora   
    ["OPT4_B_APC_Tracked_01_AA_F", 10],           // IFV-6a Cheetah    
    ["OPT4_B_MBT_01_cannon_F", 10],                    // M2A4 Slammer
    ["OPT4_B_MBT_01_TUSK_F", 10],                 // M2A4 SlammerUp
    ["OPT4_B_MBT_03_cannon_F", 10],                     // MBT-52 Kuma
    ["OPT4_B_MBT_01_Arty_F", 10],                       // M4 Scorcher
    ["OPT_B_MBT_01_mlrs_F", 10],                      // M5 Sandstorm    

//Tropentarn
    ["OPT4_B_LSV_01_AT_ghex_F", 5],                     // Prowler AT
    ["OPT4_B_MRAP_01_gmg_ghex_F", 5],                        // Hunter GMG
    ["OPT4_B_APC_Tracked_01_rcws_ghex_F", 10],          // IFV-6c Panther
    ["OPT4_B_APC_Wheeled_01_cannon_ghex_F", 10],        // AMV-7 Marshall    
    ["OPT4_B_APC_tracked_03_cannon_ghex_F", 10],        // FV-720 Mora   
    ["OPT4_B_APC_Tracked_01_AA_ghex_F", 10],           // IFV-6a Cheetah    
    ["OPT4_B_MBT_01_cannon_ghex_F", 10],                    // M2A4 Slammer
    ["OPT4_B_MBT_01_TUSK_ghex_F", 10],                 // M2A4 SlammerUp
    ["OPT4_B_MBT_03_cannon_ghex_F", 10],                     // MBT-52 Kuma
    ["OPT4_B_MBT_01_Arty_ghex_F", 10],                       // M4 Scorcher
    ["OPT_B_MBT_01_mlrs_ghex_F", 10],                      // M5 Sandstorm      
    
// NATO supplies/drohnen    
    ["OPT_B_UGV_01_F", 4],                                // UGV Stomper   
 
//Tropentarn
    ["OPT_B_UGV_01_ghex_F", 4],                         // UGV Stomper      

// NATO supplies
    ["OPT_B_supplyCrate_F", 2],                                // Transportkiste (leer)
    ["OPT_Box_NATO_Ammo_F", 2],                              // Munitionskiste    
    ["OPT_Box_NATO_WpsSpecial_F", 2],                          // Munition spezial NEUE KISTE!
    ["OPT_Box_NATO_Grenades_F", 2],                          // granatenkiste    
    ["OPT_NATO_Sprengstoffkiste", 2],                          // sprengstoffkiste NEUE KISTE!
    ["OPT_Box_NATO_WpsSpecial_AT_L1", 2],                    // Raketenkiste MAWWS NEUE KISTE!
    ["OPT_Box_NATO_WpsSpecial_AT_L1A", 2],                    // Raketenkiste MAWWS NEUE KISTE!
    ["OPT_Box_NATO_WpsSpecial_AT_L2", 2],                    // Raketenkiste PCML NEUE KISTE!
    ["OPT_Box_NATO_WpsSpecial_AT_H1", 2],                    // Raketenkiste Titan NEUE KISTE!
    ["OPT_Box_NATO_WpsSpecial_AA_F", 2],                    // Raketenkiste AA 
    ["OPT_Box_NATO_WpsSpecial_Diver_F", 2],                    // Taucherkiste,5000
    ["OPT_B_HMG_01_F", 2],                                                        // Stand-MG niedrig,10000
    ["OPT_B_HMG_01_high_F", 2],                                                // Stand-MG hoch,10000
    ["OPT_B_GMG_01_F", 2],                                                           // Stand-GMG niedrig,15000
    ["OPT_B_GMG_01_high_F", 2],                                                // Stand-GMG hoch,15000
    ["OPT_B_static_AA_F", 2],                                                    // Stand-AA,25000
    ["OPT_B_static_AT_F", 2],                                                    // Stand-AT,200000    
    ["OPT_B_Mortar_01_F", 2],                                                    // MK6 - Mörser,200000
    ["B_Mortar_01_F", 2],                        // MK6 - Mrser    
    ["OPT_B_Slingload_01_Fuel_F", 10],                         // Fuelcontainer  
    ["OPT_B_Slingload_01_Repair_F", 10],                       // Reparaturcontainer 
    ["OPT_B_Slingload_01_Ammo_F", 10],                        // Munitionscontainer - von 110 runtergesetzt damit es in lkw passt
    ["OPT_B_Slingload_01_Medevac_F", 10],                    // Lazarettcontainer
    ["Land_Cargo10_military_green_F", 10],                    // Radarcontainer NEU - wieder getauscht
    ["OPT_B_Slingload_01_Repair_Radar_F", 10],                // Radarcontainer NEU
    ["OPT_Box_NATO_WpsSpecial_Diver_F", 2],                    // Taucherkiste
    ["OPT_FlexibleTank_01_forest_F", 1],                    //Spritfass
    ["ACE_Box_82mm_Mo_HE", 4],                    //Mörsermuni

// NATO ships
    ["OPT_B_Boat_Transport_01_F", 5],                    // Assault Boat     - hinzugefügt
    ["OPT_B_Boat_Armed_01_minigun_F", 5],                // Speedboat Minigun    - hinzugefügt
    ["OPT_B_C_Boat_Transport_02_F", 5],                    // Rhib unbewaffnet      - hinzugefügt    

// OPFOR CUP
    ["OPT_CUP_O_TT650_TKA", 2],               // Motorrad TT650 (0)  
    ["OPT_CUP_O_UAZ_Unarmed_RU", 5],          // UAZ 469
    ["OPT_CUP_O_UAZ_MG_RU", 5],               // UAZ 469 DShKM
    ["OPT_CUP_O_LR_AA_TKA", 8],               // UAZ AA    
    ["OPT_CUP_O_GAZ_Vodnik_Unarmed_RU", 5],   // GAZ 3937 Vodnik
    ["OPT_CUP_O_GAZ_Vodnik_PK_RU", 5],        // GAZ 3937 Vodnik 2xPKM
    ["OPT_CUP_O_Ural_TKA", 10],               // Ural
    ["OPT_CUP_O_Ural_Repair_TKA", 10],        // Ural Rep
    ["OPT_CUP_O_GAZ_Vodnik_MedEvac_RU", 5],   // GAZ 3937 Vodnik Medic (0)
    ["OPT_CUP_O_Ural_Reammo_TKA", 10],        // Ural Ammo
    ["OPT_CUP_O_Ural_Refuel_TKA", 10],        // Ural Tank
    ["OPT_CUP_O_SA330_Puma_HC1_BAF", 10],     // SA-330 Puma 
    ["OPT_CUP_O_Ka60_Grey_RU", 10],           // KA-60 Kataska
    ["OPT_CUP_O_Merlin_HC3_GB", 10],          // Merlin HC3A
    ["OPT_CUP_O_Mi24_V_Dynamic_RU", 10],      // MI-24V
    ["OPT_CUP_C_Cessna_172_CIV_GREEN", 10],   // Cessna
    ["OPT_CUP_O_AN2_TK", 10],                 // Antonov An-2
    ["OPT_CUP_O_C47_SLA", 10],                // Li-2
    ["OPT_CUP_O_C130J_TKA", 10],              // C130J
    ["OPT_CUP_O_Su25_Dyn_RU", 10],            // SU-25T
    ["OPT_CUP_O_ZSU23_Afghan_SLA", 8],        // ZSU-23-4 Afghanski (50er Magazine)
    ["OPT_CUP_O_T72_RU", 10],                 // T72
    ["OPT_CUP_O_T90_RU", 10],                 // T90
    ["OPT_CUP_O_BTR60_RU", 8],                // BTR-60 PB
    ["OPT_CUP_O_BTR90_RU", 8],                // BTR90 ohne GMG, Preis?    
    ["OPT_CUP_O_BRDM2_ATGM_RUS", 8],          // BRDM-2 ATGM    
    ["OPT_CUP_O_BM21_RU", 5],                 // BM21 nicht nachladbar
    ["CUP_O_SearchLight_static_RU", 2],       // Searchlight
    ["CUP_O_2b14_82mm_RU", 2],                // Podnos2b14
    ["CUP_O_Kornet_RU", 5],                   // Kornet AT14
    ["CUP_O_KORD_RU", 2],                     // KORD ministativ
    ["CUP_O_DSHKM_SLA", 2],                   // DSHKM
    ["CUP_O_Igla_AA_pod_RU", 5],              // Igla
    ["OPT_CUP_O_D30_RU", 5],                  // D30
    ["CUP_O_D30_AT_RU", 5],                   // D30-AT 


// CSAT Vehicles    
    ["OPT_O_Quadbike_01_F", 4],                    // Quadbike-
    ["OPT_O_T_LSV_02_unarmed_F", 5],               // Quilin unarmed 
    ["OPT_O_T_LSV_02_armed_F", 5],                 // Quilin armed 
    ["OPT_O_G_Offroad_01_F", 5],                   // Pickup
    ["OPT_O_G_Offroad_01_armed_F", 5],                // Pickup HMG
    ["OPT_O_MRAP_02_F", 5],                        // Ifrit-
    ["OPT4_O_MRAP_02_hmg_F", 5],                  // Ifrit HMG
    ["OPT_O_Truck_03_covered_F", 10],               // Tempest Transport
    ["OPT_O_Truck_03_transport_F", 10],         // Tempest 
    ["OPT_O_Truck_03_repair_F", 10],               // Tempest Repair
    ["OPT_O_Truck_03_medical_F", 10],              // Tempest Medicalasa
    ["OPT_O_Truck_03_ammo_F", 10],              // Tempest Ammo
    ["OPT_O_Truck_03_fuel_F", 10],              // Tempest Fuel

//Tropentarn
    ["OPT_O_T_Quadbike_01_ghex_F", 4],                // Quadbike 
    ["OPT_O_T_LSV_02_unarmed_ghex_F", 5],                  // Quilin unarmed 
    ["OPT_O_T_LSV_02_armed_ghex_F", 5],                    // Quilin armed 
    ["OPT_O_G_Offroad_01_F", 5],                      // Pickup
    ["OPT_O_G_Offroad_01_armed_F", 5],                // Pickup HMG
    ["OPT_O_T_MRAP_02_ghex_F", 5],                    // Ifrit 
    ["OPT_O_T_MRAP_02_hmg_ghex_F", 5],                // Ifrit HMG 
    ["OPT_O_T_Truck_03_covered_ghex_F", 10],           // Tempest Transport 
    ["OPT_O_T_Truck_03_transport_ghex_F", 10],         // Tempest 
    ["OPT_O_T_Truck_03_repair_ghex_F", 10],            // Tempest Repair
    ["OPT_O_T_Truck_03_medical_ghex_F", 10],          // Tempest Medical
    ["OPT_O_T_Truck_03_ammo_ghex_F", 10],                 // Tempest Ammo
    ["OPT_O_T_Truck_03_fuel_ghex_F", 10],                 // Tempest Fuel
    ["OPT_O_T_Truck_02_F", 10],           // Zamack Infanterie
    ["OPT_O_T_Truck_02_transport_F", 10],         // Zamack Logistik
    ["OPT_O_T_Truck_02_box_F", 10],            // Zamack Repair
    ["OPT_O_T_Truck_02_ammo_F", 10],                 // Zamack Ammo
    ["OPT_O_T_Truck_02_fuel_F", 10],                 // Zamack Fuel
    
// CSAT Armored
    ["OPT4_O_MRAP_02_gmg_F", 5],                  // Ifrit GMG
    ["OPT4_O_LSV_02_AT_F", 5],                    // Quilin AT 
    ["OPT4_O_APC_Wheeled_02_rcws_F", 10],          // MSE-3 Marid 
    ["OPT4_O_APC_Wheeled_03_cannon_F", 10],       // AFV-4 Gorgon
    ["OPT4_O_APC_Tracked_02_cannon_F", 10],       // BTR-K Kamysh
    ["OPT4_O_APC_Tracked_02_AA_F", 10],           // ZSU-39 Tigris
    ["OPT4_O_MBT_02_cannon_F", 10],               // T-100 Varsuk
    ["OPT4_O_MBT_04_cannon_F", 10],               // T-140 Angara
    ["OPT4_O_MBT_02_arty_F", 10],                 // 2S9 Sochor
    ["OPT_O_Truck_02_MRL_F", 10],                 // Zamark MRL    

//Tropentarn
    ["OPT_O_MRAP_02_gmg_ghex_F", 5],                  // Ifrit GMG
    ["OPT_O_LSV_02_AT_ghex_F", 5],                    // Quilin AT 
    ["OPT_O_T_APC_Wheeled_02_rcws_ghex_F", 10],       // MSE-3 Marid 
    ["OPT_O_APC_Wheeled_03_cannon_ghex_F", 10],               // AFV-4 Gorgon
    ["OPT_O_T_APC_Tracked_02_cannon_ghex_F", 10],     // BTR-K Kamysh 
    ["OPT_O_T_APC_Tracked_02_AA_ghex_F", 10],         // ZSU-39 Tigris 
    ["OPT_O_T_MBT_02_cannon_ghex_F", 10],             // T-100 Varsuk 
    ["OPT_O_T_MBT_02_arty_ghex_F", 10],               // 2S9 Sochor 
    ["OPT_O_Truck_02_MRL_ghex_F", 10],                 // Zamark MRL  
    ["OPT_O_T_APC_Wheeled_01_cannon_F_INF", 10],     // Marchall Infanterie 
    ["OPT_O_T_APC_Tracked_02_cannon_ghex_F_VEH", 10],     // BTR-K Kamysh Fahrzeug
    ["OPT_O_T_APC_Tracked_02_cannon_ghex_F_AT", 10],     // BTR-K Kamysh Tank 
    ["OPT_O_T_MBT_02_cannon_ghex_F_INF", 10],             // T-100 Varsuk Infanterie
    ["OPT_O_T_MBT_02_cannon_ghex_F_AT", 10],             // T-100 Varsuk Fahrzeug
    
// CSAT supplies
    ["OPT_O_supplyCrate_F", 2],                                // Transportkiste (leer)
    ["OPT_Box_East_Ammo_F", 2],                             // Munitionskiste
    ["OPT_Box_East_WpsSpecial_F", 2],                         // Munition spezial kiste NEUE KISTE!
    ["OPT_Box_East_Grenades_F", 2],                         // granatenkiste
    ["OPT_Box_CSAT_UGL_F", 2],                         // Unterlaufgranatenkiste NEUE KISTE!
    ["OPT_CSAT_Sprengstoffkiste", 2],                         // sprengstoffkiste NEUE KISTE!
    ["OPT_CSAT_Minenkiste", 2],                         // Minenkiste NEUE KISTE!
    ["OPT_Box_East_WpsSpecial_AT_L1", 2],                       // AT Raketenkiste RPG42 NEUE KISTE!
    ["OPT_Box_East_WpsSpecial_AT_L3", 2],                       // AT Raketenkiste (MAAWS) NEUE KISTE!
    ["OPT_Box_East_WpsSpecial_AT_L3A", 2],                       // AT Raketenkiste (MAAWS) NEUE KISTE!
    ["OPT_Box_East_WpsSpecial_AT_L2", 2],                       // AT Raketenkiste PPG 7 NEUE KISTE!
    ["OPT_Box_East_WpsSpecial_AT_H1", 2],                       // AT Raketenkiste Titan NEUE KISTE!
    ["OPT_Box_East_WpsSpecial_AA_F", 2],                    // AA Raketenkiste
    ["OPT_Box_East_WpsSpecial_Diver_F", 2],                    // Taucherkiste
    ["OPT_O_HMG_01_F", 2],                                                        // Stand-MG niedrig,10000
    ["OPT_O_HMG_01_high_F", 2],                                                // Stand-MG hoch,10000
    ["OPT_O_GMG_01_F", 2],                                                        // Stand-GMG niedrig,15000
    ["OPT_O_GMG_01_high_F", 2],                                                // Stand-GMG hoch,15000
    ["OPT_O_static_AA_F", 2],                                                    // Stand-AA,25000
    ["OPT_O_static_AT_F", 2],                                                    // Stand-AT,200000
    ["OPT_O_Mortar_01_F", 2],                                                    // MK6 Mörser,200000
    ["B_Mortar_01_F", 2],                        // MK6 - Mrser
    ["OPT_O_Static_Designator_02_F", 1],                        // Remote Designator
    ["OPT_FlexibleTank_01_sand_F", 1],                        // Treibstoff-Fass
    ["OPT_Land_Pod_Heli_Transport_04_fuel_F", 10],            // Fuelcontainer
    ["OPT_Land_Pod_Heli_Transport_04_fuel_black_F", 10],     // Fuelcontainer (schwarz)
    ["OPT_Land_Pod_Heli_Transport_04_ammo_F", 10],            // Munitionscontainer
    ["OPT_Land_Pod_Heli_Transport_04_ammo_black_F", 10],     // Munitionscontainer (Schwarz)
    ["OPT_Land_Pod_Heli_Transport_04_repair_F", 10],            // Reparaturcontainer
    ["OPT_Land_Pod_Heli_Transport_04_repair_black_F", 10],    // Repcontainer schwarz
    ["OPT_Land_Pod_Heli_Transport_04_repair_radar_F", 10],    // Radar Container NEU

// CSAT Supplies    
    ["OPT_O_T_UGV_01_ghex_F", 4],                        // UGV Saif    

// Vanilla
    ["OPT_O_UGV_01_F", 4],    

// CSAT Ships
    ["OPT_O_Boat_Transport_01_F", 4],                    // Assault Boat
    ["OPT_O_Boat_Armed_01_hmg_F", 4],                    // Speedboat HMG
    ["OPT_O_C_Boat_Transport_02_F", 4],                    // rhib unbewaffnet    

// AAF Vehicles
    ["OPT_I_Quadbike_01_F", 4],                    // Quadbike
    ["OPT_I_C_Offroad_02_unarmed_F", 5],               // Jeep unarmed 
    ["OPT_I_C_Offroad_02_LMG_F", 5],                 // Jeeg MG
    ["OPT_I_MRAP_03_F", 5],                        // Strider
    ["OPT_I_MRAP_03_hmg_F", 5],                   // Strider HMG
    ["OPT_I_Truck_02_covered_F", 10],               // Zamak Transport
    ["OPT_I_Truck_02_box_F", 10],               // Zamak Repair
    ["OPT_I_Truck_02_transport_F", 10],               // Zamak  
    ["OPT_I_Truck_02_ammo_F", 10],               // Zamak Ammo
    ["OPT_I_Truck_02_fuel_F", 10],               // Zamak Fuel              

// AAF Armored
    ["OPT_I_C_Offroad_02_AT_F", 5],                     // Jeep AT 
    ["OPT_I_LSV_01_AT_ghex_F", 5],                     // Prowler AT 
    ["OPT_I_MRAP_03_gmg_F", 5],                        // Strider GMG 
    ["OPT_I_APC_Wheeled_03_cannon_F", 10],        // Gorgon    
    ["OPT_I_APC_tracked_03_cannon_F", 10],        // FV-720 Mora   
    ["OPT_I_LT_01_AA_F", 10],                     // Nyx AA    
    ["OPT_I_LT_01_AT_F", 10],                    // Nyx AT
    ["OPT_I_LT_01_scout_F", 10],                    // Nyx Recon
    ["OPT_I_MBT_03_cannon_F", 10],                     // MBT-52 Kuma
    ["OPT_I_Truck_02_MRL_F", 10],                      // Zamak Arty  
    ["OPT_I_APC_tracked_03_cannon_F_INF", 10],        // FV-720 Mora Infanterie 
    ["OPT_I_APC_Wheeled_03_cannon_F_VEH", 10],        // Gorgon Fahrzeug
    ["OPT_I_APC_Wheeled_03_cannon_F_AT", 10],        // Gorgon Tank
    ["OPT_I_APC_Tracked_01_AA_ghex_F", 10],                    // AA cheetah    
    ["OPT_I_MBT_03_cannon_F_INF", 10],                     // MBT-52 Kuma Infanterie
    ["OPT_I_MBT_03_cannon_F_AT", 10],                     // MBT-52 Kuma Fahrzeug
    ["OPT_O_T_MBT_02_arty_ghex_F", 10],                      // Scorcher Arty 

// AAF supplies
    ["OPT_I_supplyCrate_F", 2],                                // Transportkiste (leer)
    ["OPT_Box_EFA_Ammo_F", 2],                             // Munitionskiste
    ["OPT_Box_EAF_WpsSpecial_F", 2],                         // Munition spezial kiste NEUE KISTE!
    ["OPT_Box_EAF_Grenades_F", 2],                         // granatenkiste
    ["OPT_Box_EAF_UGL_F", 2],                         // granatenkiste NEUE KISTE!
    ["OPT_EAF_Sprengstoffkiste", 2],                         // sprengstoffkiste NEUE KISTE!
    ["OPT_EAF_Minenkiste", 2],                         // Minenkiste NEUE KISTE!
    ["OPT_Box_EAF_WpsSpecial_AT_L1", 2],                       // AT Raketenkiste MAWSS NEUE KISTE!
    ["OPT_Box_EAF_WpsSpecial_AT_L1A", 2],                       // AT Raketenkiste MAWSS NEUE KISTE!
    ["OPT_Box_EAF_WpsSpecial_AT_L3", 2],                       // AT Raketenkiste (RPG-42) NEUE KISTE!
    ["OPT_Box_EAF_WpsSpecial_AT_L2", 2],                       // AT Raketenkiste PPG 7 NEUE KISTE!
    ["OPT_Box_EAF_WpsSpecial_AA_F", 2],                    // AA Raketenkiste
    ["OPT_Box_EAF_WpsSpecial_Diver_F", 2],                    // Taucherkiste
    ["OPT_I_HMG_01_F", 2],                                                        // Stand-MG niedrig,10000
    ["OPT_I_HMG_01_high_F", 2],                                                // Stand-MG hoch,10000
    ["OPT_I_GMG_01_F", 2],                                                        // Stand-GMG niedrig,15000
    ["OPT_I_GMG_01_high_F", 2],                                                // Stand-GMG hoch,15000
    ["OPT_I_static_AA_F", 2],                                                    // Stand-AA,25000
    ["OPT_I_static_AT_F", 2],                                                    // Stand-AT,200000
    ["OPT_I_Mortar_01_F", 2],                                                    // MK6 Mörser,200000
    ["I_Mortar_01_F", 2],                        // MK6 - Mrser
    ["OPT_FlexibleTank_01_forest_F", 1],                        // Treibstoff-Fass    
    ["OPT_I_Static_Designator_01_F", 1],                        // Remote Designator    
    ["OPT_B_Slingload_01_Ammo_F", 10],                        // Slinglot Muni Container    
    ["OPT_B_Slingload_01_Repair_F", 10],                        // Slinglot Rep Container    
    ["OPT_B_Slingload_01_Fuel_F", 10],                        // Slinglot Fuel Container    

// AAF Stomper    
    ["OPT_I_UGV_01_F", 4],                         // UGV Stomper          

// AAF Ships
    ["OPT_I_Boat_Armed_01_minigun_F", 4],         // Speedboat Minigun
    ["OPT_I_Boat_Transport_01_F", 4],               // Assault Boat
    ["OPT_I_C_Boat_Transport_02_F", 4]             // Rhib unbewaffnet    
];


/**
 * List of class names of objects which can be carried and moved by a player.
 */
 // e.g. : [classname, offset in [x,y,z] from model center, direction]
GVAR(canBeDragged) = 
[                                            
// NATO supplies    
    ["OPT_B_CargoNet_01_ammo_F", [0, 2, 0.1], 0],                             // Ausrüstungskiste
    ["OPT_B_supplyCrate_F", [0, 2, 0.1], 0],                                // Transportkiste (leer),500
    ["OPT_Box_NATO_WpsSpecial_Diver_F"],                                    // Taucherkiste,5000    
    ["OPT_Box_NATO_Ammo_F"],                                                // Munitionskiste,40000
    ["OPT_Box_NATO_WpsSpecial_F"],                                            // Munition spezial kiste NEUE KISTE!    
    ["OPT_Box_NATO_Grenades_F"],                                             // granatenkiste,75000
    ["OPT_NATO_Sprengstoffkiste"],                                             // sprengstoffkiste,75000 NEUE KISTE!    
    ["OPT_Box_NATO_WpsSpecial_AT_L1"],                                        // Raketenkiste MAWWS NEUE KISTE!
    ["OPT_Box_NATO_WpsSpecial_AT_L1A"],                                        // Raketenkiste MAWWS NEUE KISTE!
    ["OPT_Box_NATO_WpsSpecial_AT_L2"],                                        // Raketenkiste PCML NEUE KISTE!
    ["OPT_Box_NATO_WpsSpecial_AT_H1"],                                    // Raketenkiste Titan NEUE KISTE!    
    ["OPT_Box_NATO_WpsSpecial_AA_F"],                                        // AA Raketenkiste,40000    
    ["OPT_B_HMG_01_F"],                                                        // Stand-MG niedrig,10000
    ["OPT_B_HMG_01_high_F"],                                                // Stand-MG hoch,10000
    ["OPT_B_GMG_01_F"],                                                           // Stand-GMG niedrig,15000
    ["OPT_B_GMG_01_high_F"],                                                // Stand-GMG hoch,15000
    ["OPT_B_static_AA_F"],                                                    // Stand-AA,25000
    ["OPT_B_static_AT_F"],                                                    // Stand-AT,200000    
    ["OPT_B_Mortar_01_F"],                                                    // MK6 - Mörser,200000
    ["B_Mortar_01_F"],                                                        // MK6 - Mörser
    ["OPT_FlexibleTank_01_forest_F"],                                        //Spritfass
    ["OPT_B_Static_Designator_01_F"],                                        // Remote Designator,10000
    ["OPT_B_Slingload_01_Fuel_F",  [0, 5, 0.05], 0],                        // Fuelcontainer,5000
    ["OPT_B_Slingload_01_Ammo_F",  [0, 5, 0.05], 0],                        // Munitionscontainer,50000
    ["OPT_B_Slingload_01_Repair_F",  [0, 5, 0.05], 0],                      // Reparaturcontainer,5000
    ["OPT_B_Slingload_01_Repair_radar_F",  [0, 5, 0.05], 0],
    ["Land_Cargo10_military_green_F"],                                        // NATO Radar Container
    ["OPT_B_Slingload_01_Medevac_F",  [0, 5, 0.05], 0],                     // Lazarettcontainer,5000            //psycho, dieser container verursacht Probleme mit den Load-Scripts und wird durch den weissen Container ersetzt welcher zum Lazarett ausgebaut werden kann

// NATO ships    
    ["OPT_B_Boat_Transport_01_F", [0, 2, 0.1], 0],                            // Assault Boat,500
    ["OPT_B_C_Boat_Transport_02_F", [0, 2, 0.1], 0],                        // Rhib unbewaffnet,2000
    ["OPT_B_Boat_Armed_01_minigun_F",[0, 2, 0.1], 0],                        // Speedboat Minigun,10000
    ["OPT_B_SDV_01_F",[0, 2, 0.1], 0],                                        // Submarine,2000

//CSAT supplies
    ["OPT_O_CargoNet_01_ammo_F", [0, 2, 0.1], 0],                            // Ausrüstungskiste
    ["OPT_O_supplyCrate_F", [0, 2, 0.1], 0],                                // Transportkiste,500
    ["OPT_Box_East_WpsSpecial_Diver_F"],                                    // Taucherkiste,5000
    ["OPT_Box_East_WpsSpecial_AA_F"],                                        // AA Raketenkiste,40000
    ["OPT_Box_East_WpsSpecial_AT_L3"],                                          // AT Raketenkiste MAAWS NEUE KISTE!
    ["OPT_Box_East_WpsSpecial_AT_L3A"],                                          // AT Raketenkiste MAAWS NEUE KISTE!
    ["OPT_Box_East_WpsSpecial_AT_L1"],                                          // AT Raketenkiste RPG42 NEUE KISTE!
    ["OPT_Box_East_WpsSpecial_AT_L2"],                                          // AT Raketenkiste PPG 7 NEUE KISTE!
    ["OPT_Box_East_WpsSpecial_AT_H1"],                                       // AT Raketenkiste Titan NEUE KISTE!
    ["OPT_Box_East_Ammo_F"],                                                // Munitionskiste,40000
    ["OPT_Box_East_WpsSpecial_F"],                                            // Munition spezial kiste NEUE KISTE!
    ["OPT_Box_East_Grenades_F"],                                            // granatenkiste,75000
    ["OPT_CSAT_Sprengstoffkiste"],                                            // sprengstoffkiste,75000 NEUE KISTE!
    ["OPT_CSAT_Minenkiste"],                                                // Minenkiste,75000 NEUE KISTE!
    ["OPT_Box_East_WpsLaunch_F"],                                            // HAT-Kiste (Titan),400000
    ["OPT_O_HMG_01_F"],                                                        // Stand-MG niedrig,10000
    ["OPT_O_HMG_01_high_F"],                                                // Stand-MG hoch,10000
    ["OPT_O_GMG_01_F"],                                                        // Stand-GMG niedrig,15000
    ["OPT_O_GMG_01_high_F"],                                                // Stand-GMG hoch,15000
    ["OPT_O_static_AA_F"],                                                    // Stand-AA,25000
    ["OPT_O_static_AT_F"],                                                    // Stand-AT,200000
    ["OPT_O_Mortar_01_F"],                                                    // MK6 Mörser,200000
    ["B_Mortar_01_F"],                                                        // MK6 - Mörser
    ["OPT_FlexibleTank_01_sand_F"],                                            // Treibstoff-Fass
    ["OPT_O_Static_Designator_02_F"],                                        // Remote Designator,10000
    ["OPT_Land_Pod_Heli_Transport_04_fuel_F",  [0, 5, 0.05], 0],                // Fuelcontainer,5000
    ["OPT_Land_Pod_Heli_Transport_04_fuel_black_F",  [0, 5, 0.05], 0],        // Fuelcontainer (schwarz),5000
    ["OPT_Land_Pod_Heli_Transport_04_ammo_F",  [0, 5, 0.05], 0],                // Munitionscontainer,50000
    ["OPT_Land_Pod_Heli_Transport_04_ammo_black_F",  [0, 5, 0.05], 0],        // Munitionscontainer (Schwarz),50000
    ["OPT_Land_Pod_Heli_Transport_04_repair_F",     [0, 5, 0.05], 0],            // Reparaturcontainer,5000
    ["OPT_Land_Pod_Heli_Transport_04_repair_black_F", [0, 5, 0.05], 0],        // Reparaturcontainer (schwarz),5000
    ["OPT_Land_Pod_Heli_Transport_04_repair_radar_F", [0, 5, 0.05], 0],      // CSAT Radar Container
    ["Land_Cargo10_grey_F"],                                                // Radar Container NEU
    ["OPT_Land_Pod_Heli_Transport_04_medevac_F", [0, 5, 0.05], 0],            // Lazarettcontainer,5000 //psycho, dieser container verursacht Probleme mit den Load-Scripts und wird durch den weißen Container ersetzt welcher zum Lazarett ausgebaut werden kann

//CSAT ships
    ["OPT_O_Boat_Transport_01_F", [0, 2, 0.1], 0],             // Assault Boat,500
    ["OPT_O_Boat_Armed_01_hmg_F", [0, 2, 0.1], 0],                            // Speedboat HMG,14000
    ["OPT_O_C_Boat_Transport_02_F", [0, 2, 0.1], 0],            // rhib unbewaffnet,7000
    ["OPT_O_SDV_01_F", [0, 2, 0.1], 0],            // Submarine,2000                                            

// AAF supplies
    ["OPT_I_CargoNet_01_ammo_F", [0, 2, 0.1], 0],                            // Ausrüstungskiste
    ["OPT_I_supplyCrate_F", [0, 2, 0.1], 0],            // Transportkiste (leer)
    ["OPT_Box_EFA_Ammo_F"],                             // Munitionskiste
    ["OPT_Box_EAF_WpsSpecial_F"],                         // Munition spezial kiste NEUE KISTE!
    ["OPT_Box_EAF_Grenades_F"],                         // granatenkiste
    ["OPT_EAF_Sprengstoffkiste"],                         // sprengstoffkiste NEUE KISTE!
    ["OPT_EAF_Minenkiste"],                         // Minenkiste NEUE KISTE!
    ["OPT_Box_EAF_WpsSpecial_AT_L1"],                       // AT Raketenkiste MAWSS NEUE KISTE!
    ["OPT_Box_EAF_WpsSpecial_AT_L1A"],                       // AT Raketenkiste MAWSS NEUE KISTE!
    ["OPT_Box_EAF_WpsSpecial_AT_L2"],                       // AT Raketenkiste PPG 7 NEUE KISTE!
    ["OPT_Box_EAF_WpsSpecial_AA_F"],                    // AA Raketenkiste
    ["OPT_Box_EAF_WpsSpecial_Diver_F"],                    // Taucherkiste
    ["OPT_I_HMG_01_F"],                                                        // Stand-MG niedrig,10000
    ["OPT_I_HMG_01_high_F"],                                                // Stand-MG hoch,10000
    ["OPT_I_GMG_01_F"],                                                        // Stand-GMG niedrig,15000
    ["OPT_I_GMG_01_high_F"],                                                // Stand-GMG hoch,15000
    ["OPT_I_static_AA_F"],                                                    // Stand-AA,25000
    ["OPT_I_static_AT_F"],                                                    // Stand-AT,200000
    ["OPT_I_Mortar_01_F"],                                                    // MK6 Mörser,200000
    ["I_Mortar_01_F"],                        // MK6 - Mrser
    ["OPT_FlexibleTank_01_forest_F"],                        // Treibstoff-Fass    
    ["OPT_I_Static_Designator_01_F"],                        // Remote Designator

// AAF Ships
    ["OPT_I_Boat_Armed_01_minigun_F", [0, 2, 0.1], 0],         // Speedboat Minigun
    ["OPT_I_Boat_Transport_01_F", [0, 2, 0.1], 0],               // Assault Boat
    ["OPT_I_C_Boat_Transport_02_F", [0, 2, 0.1], 0],             // Rhib unbewaffnet    

// CUP
    ["CUP_B_SearchLight_static_USMC"],     // searchlight
    ["CUP_B_M252_USMC"],                   // m252 81mm
    ["CUP_B_TOW2_TriPod_USMC"],            // m220 tow 2
    ["CUP_B_M2StaticMG_MiniTripod_USMC"],  // M2 HD ministativ
    ["CUP_B_M2StaticMG_USMC"],             // M2 HD Hoch
    ["CUP_B_Stinger_AA_pod_Base_USMC"],    // FIM92
    ["OPT_CUP_B_M119_USMC"],               // M119
    ["OPT_CUP_B_M119_AT_USMC"],            // M119-AT

    ["CUP_O_SearchLight_static_RU"],       // Searchlight
    ["CUP_O_2b14_82mm_RU"],                // Podnos2b14
    ["CUP_O_Kornet_RU"],                   // Kornet AT14
    ["CUP_O_KORD_RU"],                     // KORD ministativ
    ["CUP_O_DSHKM_SLA"],                   // DSHKM
    ["CUP_O_Igla_AA_pod_RU"],              // Igla
    ["OPT_CUP_O_D30_RU"],                  // D30
    ["CUP_O_D30_AT_RU"]                    // D30-AT 

];

// Trag und Ziehbare Objekte
GVAR(canBeCarried) = 
[
// NATO supplies    
    ["OPT_B_supplyCrate_F"],                            // Transportkiste (leer),500
    ["OPT_Box_NATO_WpsSpecial_Diver_F"],                // Taucherkiste,5000    
    ["OPT_Box_NATO_Ammo_F"],                            // Munitionskiste,40000
    ["OPT_Box_NATO_WpsSpecial_F"],                        // Munition spezial kiste NEUE KISTE!    
    ["OPT_Box_NATO_Grenades_F"],                         // granatenkiste,75000
    ["OPT_NATO_Sprengstoffkiste"],                         // sprengstoffkiste,75000 NEUE KISTE!
    ["OPT_Box_NATO_WpsSpecial_AT_L1"],                       // Raketenkiste MAWWS NEUE KISTE!
    ["OPT_Box_NATO_WpsSpecial_AT_L1A"],                       // Raketenkiste MAWWS NEUE KISTE!
    ["OPT_Box_NATO_WpsSpecial_AT_L2"],                       // Raketenkiste PCML NEUE KISTE!
    ["OPT_Box_NATO_WpsSpecial_AT_H1"],                    // Raketenkiste Titan NEUE KISTE!    
    ["OPT_Box_NATO_WpsSpecial_AA_F"],                    // AA Raketenkiste,40000    
    ["OPT_Box_NATO_WpsSpecial_AA_F"],                    // AA Raketenkiste,40000
    ["OPT_B_HMG_01_F"],                                    // Stand-MG niedrig,10000
    ["OPT_B_HMG_01_high_F"],                            // Stand-MG hoch,10000
    ["OPT_B_GMG_01_F"],                                    // Stand-GMG niedrig,15000
    ["OPT_B_GMG_01_high_F"],                            // Stand-GMG hoch,15000
    ["OPT_B_static_AA_F"],                                // Stand-AA,25000
    ["OPT_B_static_AT_F"],                                // Stand-AT,200000
    ["OPT_B_Mortar_01_F"],                                // MK6 - Mörser,200000
    ["B_Mortar_01_F"],                                // MK6 - Mörser,200000
    ["OPT_FlexibleTank_01_forest_F"],                    // Spritfass
    ["OPT_B_Slingload_01_Fuel_F", [0, 5, 0.05], 0],                      // Fuelcontainer,5000
    ["OPT_B_Slingload_01_Ammo_F", [0, 5, 0.05], 0],                      // Munitionscontainer,50000
    ["OPT_B_Slingload_01_Repair_F", [0, 5, 0.05], 0],                    // Reparaturcontainer,
    ["OPT_B_Slingload_01_Repair_radar_F", [0, 5, 0.05], 0],                // NATO Radar Container
    ["Land_Cargo10_military_green_F"],
    ["OPT_B_Static_Designator_01_F"],                    // Remote Designator,

//CSAT supplies
    ["OPT_O_supplyCrate_F"],                            // Transportkiste,
    ["OPT_Box_East_WpsSpecial_Diver_F"],                // Taucherkiste,
    ["OPT_Box_East_WpsSpecial_AA_F"],                    // AA Raketenkiste,
    ["OPT_Box_East_WpsSpecial_AT_L1"],                   // AT Raketenkiste RPG42 NEUE KISTE!
    ["OPT_Box_East_WpsSpecial_AT_L3"],                   // AT Raketenkiste (MAAWS) NEUE KISTE!
    ["OPT_Box_East_WpsSpecial_AT_L3A"],                   // AT Raketenkiste (MAAWS) NEUE KISTE!
    ["OPT_Box_East_WpsSpecial_AT_L2"],                   // AT Raketenkiste PPG 7 NEUE KISTE!
    ["OPT_Box_East_WpsSpecial_AT_H1"],                   // AT Raketenkiste Titan NEUE KISTE!
    ["OPT_Box_East_Ammo_F"],                            // Munitionskiste,
    ["OPT_Box_East_WpsSpecial_F"],                        // Munition spezial kiste NEUE KISTE!
    ["OPT_Box_East_Grenades_F"],                        // granatenkiste
    ["OPT_Box_CSAT_UGL_F"],                        // Unterlaufgranatenkiste
    ["OPT_CSAT_Sprengstoffkiste"],                        // sprengstoffkiste,75000 NEUE KISTE!
    ["OPT_CSAT_Minenkiste"],                             // Minenkiste,75000 NEUE KISTE!
    ["OPT_Box_East_WpsLaunch_F"],                        // HAT-Kiste (Titan),400000
    ["OPT_O_HMG_01_F"],                                    // Stand-MG niedrig,10000
    ["OPT_O_HMG_01_high_F"],                            // Stand-MG hoch,10000
    ["OPT_O_GMG_01_F"],                                    // Stand-GMG niedrig,15000
    ["OPT_O_GMG_01_high_F"],                            // Stand-GMG hoch,15000
    ["OPT_O_static_AA_F"],                                // Stand-AA,25000
    ["OPT_O_static_AT_F"],                                // Stand-AT,200000
    ["OPT_O_Mortar_01_F"],                                // MK6 Mörser,200000
    ["B_Mortar_01_F"],                                // MK6 - Mörser,200000
    ["OPT_Land_Pod_Heli_Transport_04_fuel_F", [0, 5, 0.05], 0],            // Fuelcontainer,5000
    ["OPT_Land_Pod_Heli_Transport_04_fuel_black_F", [0, 5, 0.05], 0],    // Fuelcontainer (schwarz),5000
    ["OPT_Land_Pod_Heli_Transport_04_ammo_F", [0, 5, 0.05], 0],            // Munitionscontainer,50000
    ["OPT_Land_Pod_Heli_Transport_04_ammo_black_F", [0, 5, 0.05], 0],    // Munitionscontainer (Schwarz),50000
    ["OPT_Land_Pod_Heli_Transport_04_repair_F", [0, 5, 0.05], 0],        // Reparaturcontainer,5000
    ["OPT_Land_Pod_Heli_Transport_04_repair_black_F", [0, 5, 0.05], 0],    // Reparaturcontainer (schwarz),5000
    ["OPT_Land_Pod_Heli_Transport_04_repair_radar_F", [0, 5, 0.05], 0],  // CSAT Radar Container
    ["Land_Cargo10_grey_F"],                            // CSAT Radar Container NEU
    ["OPT_FlexibleTank_01_sand_F"],                        // Treibstoff-Fass

// AAF supplies
     ["OPT_I_supplyCrate_F"],            // Transportkiste (leer)
    ["OPT_Box_EFA_Ammo_F"],                             // Munitionskiste
    ["OPT_Box_EAF_WpsSpecial_F"],                         // Munition spezial kiste NEUE KISTE!
    ["OPT_Box_EAF_Grenades_F"],                         // granatenkiste
    ["OPT_Box_EAF_UGL_F"],                         // granatenkiste
    ["OPT_EAF_Sprengstoffkiste"],                         // sprengstoffkiste NEUE KISTE!
    ["OPT_EAF_Minenkiste"],                         // Minenkiste NEUE KISTE!
    ["OPT_Box_EAF_WpsSpecial_AT_L1"],                       // AT Raketenkiste MAWSS NEUE KISTE!
    ["OPT_Box_EAF_WpsSpecial_AT_L1A"],                       // AT Raketenkiste MAWSS NEUE KISTE!
    ["OPT_Box_EAF_WpsSpecial_AT_L3"],                       // AT Raketenkiste (RPG-42) MAWSS NEUE KISTE!
    ["OPT_Box_EAF_WpsSpecial_AT_L2"],                       // AT Raketenkiste PPG 7 NEUE KISTE!
    ["OPT_Box_EAF_WpsSpecial_AA_F"],                    // AA Raketenkiste
    ["OPT_Box_EAF_WpsSpecial_Diver_F"],                    // Taucherkiste
    ["OPT_I_HMG_01_F"],                                                        // Stand-MG niedrig,10000
    ["OPT_I_HMG_01_high_F"],                                                // Stand-MG hoch,10000
    ["OPT_I_GMG_01_F"],                                                        // Stand-GMG niedrig,15000
    ["OPT_I_GMG_01_high_F"],                                                // Stand-GMG hoch,15000
    ["OPT_I_static_AA_F"],                                                    // Stand-AA,25000
    ["OPT_I_static_AT_F"],                                                    // Stand-AT,200000
    ["OPT_I_Mortar_01_F"],                                                    // MK6 Mörser,200000
    ["I_Mortar_01_F"],                        // MK6 - Mrser
    ["OPT_FlexibleTank_01_forest_F"],                        // Treibstoff-Fass    
    ["OPT_B_Slingload_01_Ammo_F"],                        // Slinglot Muni Container    
    ["OPT_B_Slingload_01_Repair_F"],                        // Slinglot Rep Container    
    ["OPT_B_Slingload_01_Fuel_F"],                        // Slinglot Fuel Container    
    ["OPT_I_Static_Designator_01_F"],                        // Remote Designator

// CUP
    ["CUP_B_SearchLight_static_USMC"],     // searchlight
    ["CUP_B_M252_USMC"],                   // m252 81mm
    ["CUP_B_TOW2_TriPod_USMC"],            // m220 tow 2
    ["CUP_B_M2StaticMG_MiniTripod_USMC"],  // M2 HD ministativ
    ["CUP_B_M2StaticMG_USMC"],             // M2 HD Hoch
    ["CUP_B_Stinger_AA_pod_Base_USMC"],    // FIM92
    ["OPT_CUP_B_M119_USMC"],               // M119
    ["OPT_CUP_B_M119_AT_USMC"],            // M119-AT
    
    ["CUP_O_SearchLight_static_RU"],       // Searchlight
    ["CUP_O_2b14_82mm_RU"],                // Podnos2b14
    ["CUP_O_Kornet_RU"],                   // Kornet AT14
    ["CUP_O_KORD_RU"],                     // KORD ministativ
    ["CUP_O_DSHKM_SLA"],                   // DSHKM
    ["CUP_O_Igla_AA_pod_RU"],              // Igla
    ["OPT_CUP_O_D30_RU"],                  // D30
    ["CUP_O_D30_AT_RU"]                    // D30-AT 

];
