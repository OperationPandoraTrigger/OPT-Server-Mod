/**
* Description:
* Alle Einheitne und Waffen Classnames für den Waffencheck
*
* Author:
* Lord-MDB
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* No
*
* Public:
* No 
* 
* Global:
* No
* 
* API:
* No
*
* Example:
* [] call FUNC(setup_classnames);
*/
#include "macros.hpp"

// hier werden diverse Klassen definiert welche in Scripten abgefragt werden (z.B. klassenbezogene Ttigkeiten oder Waffen)
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* HL UND PL */
GVAR(officer) = 
[
    /* UNUSED
    "OPT_NATO_Offizier_T",
    "OPT_CSAT_Offizier_T",
    "I_officer_F",
    */
    "OPT_NATO_Offizier",
    "OPT_CSAT_Offizier"
];

/* PILOTS */
// hier sind alle Classnames aufgelistet, welche als Piloten definiert werden um fliegen zu duerfen
GVAR(pilots) = 
[
    /* UNUSED
    "OPT_NATO_Pilot_T",
    "OPT_CSAT_Pilot_T",
    "O_Pilot_F",
    "I_helipilot_F",
    "O_helipilot_F",
    */
    "OPT_NATO_Pilot",
    "OPT_CSAT_Pilot"
];

GVAR(jetpilots) = 
[
    "OPT_NATO_Pilot_jet",
    "OPT_CSAT_Pilot_jet"
];

GVAR(choppers) = 
[
    "OPT4_B_Heli_light_03_green_F",                    // WY-55 Hellcat (Unbewaffnet)
    "OPT_B_Heli_Light_01_F",                    // MH-9 Hummingbird
    "OPT4_B_Heli_Light_01_armed_F",            // AH-9 Pawnee (Unbewaffnet) - 80000
    "OPT_B_Heli_Light_01_armed_2_F",                // AH-9 Pawnee scalpel
    "OPT_B_Heli_Transport_01_F",                // UH-80 Ghosthawk
    "OPT_B_Heli_Transport_03_unarmed_F",    // CH-67 Huron unarmed (Transport+Lift)
    "OPT_B_Heli_Transport_03_F",            // CH-67 Huron armed (Transport+Lift)
    "OPT_B_Heli_Transport_02_F",            // CH-49 Mohawk (Transport+Lift)
    "OPT_B_T_UAV_03_dynamicLoadout_F",        // MQ12-Falcon - noch in arbeit erstma nur testweise mit preis eingebaut
    "OPT_B_T_VTOL_02_infantry_unarmed_F",        // VTOL Y-32 Xi'an (Inf-Transport)
    "OPT_B_T_VTOL_01_infantry_F",            // VTOL Blackfish (Inf-Transport) 200000
    "OPT_B_T_VTOL_01_vehicle_F",            // VTOL Blackfish (Fahrzeug-Transport)
    "OPT_B_T_VTOL_01_armed_F",                    // VTOL Blackfish BEWAFFNET
    "OPT4_B_Heli_Attack_01_F",                // AH-99 Blackfoot 200000(Unbewaffnet)
    "OPT_B_Plane_CAS_01_F",                    // A-164 Wipeout
    "OPT_B_Plane_Fighter_AA_01_F",                // F/A-181 Black Wasp II (AA)
    "OPT_B_Plane_Fighter_03_AA_F_1",                    // Buzzard AA
    "OPT_B_Plane_CAS_01_F_1",                // A-164 Wipeout
    "sfp_bo105_unarmed",                // BO 105 - testweise eingebaut - textur klären!
    "OPT_O_Heli_Light_03_unarmed_F",                // WY-55 Hellcat
    "OPT4_O_Heli_light_03_F",                // WY-55 Hellcat
    "OPT_O_Heli_Light_03_unarmed_green_F",            // WY-55 Hellcat - 60000
    "OPT_O_Heli_Light_03_green_F",                    // WY-55 Hellcat (DAR)
    "OPT_O_Heli_light_03_Scalpel_green_F",            // WY-55 Hellcat (scalpel)
    "OPT_O_Heli_light_03_Scalpel_F",            // WY-55 Hellcat (scalpel)    
    "OPT_O_Heli_Light_02_unarmed_F",                    // PO-30 Orca
    "OPT_O_Heli_Light_02_unarmed_black_F",        // PO-30 Orca
    "OPT_O_Heli_Light_02_Minigun_F",        // PO-30 Orca minigun 90000
    "OPT_O_Heli_Light_02_Minigun_black_F",        // PO-30 Orca minigun 90000
    "OPT4_O_Heli_Light_02_F",                        // PO-30 Orca (Unbewaffnet)
    "OPT4_O_Heli_Light_02_black_F",            // PO-30 Orca (DAR)
    "OPT_O_Heli_Light_02_F",                             // PO-30 Orca (scalpel)
    "OPT_O_Heli_Light_02_black_F",                     // PO-30 Orca (scalpel)
    "OPT_O_Heli_Transport_04_F",                         // Mi-290 Taru (Lift)
    "OPT_O_Heli_Transport_04_black_F",             // Mi-290 Taru (Lift)
    "OPT_O_Heli_Transport_04_covered_F",              // Mi-290 Taru (Transport)
    "OPT_O_Heli_Transport_04_covered_black_F",      // Mi-290 Taru (Transport)
    "OPT_O_Heli_Transport_04_bench_F",                 // Mi-290 Taru (Bench)
    "OPT_O_Heli_Transport_04_bench_black_F",        // Mi-290 Taru (Bench)
    "OPT_O_UAV_02_light_F",                         // Ababil unbewaffnet
    "OPT_O_UAV_02_CAS_F",                         // Ababil GBU-12
    "OPT_O_UAV_02_F",                             // Ababil Scalpel
    "OPT_O_UAV_02_AA_F",                        // Ababil AA    
    "OPT_O_T_VTOL_02_infantry_unarmed_F",        // VTOL Y-32 Xi'an (Inf-Transport)
    "OPT_O_T_VTOL_02_vehicle_unarmed_F",        // VTOL Y-32 Xi'an (Fahrzeug-Transport) 300000
    "OPT_O_T_VTOL_02_infantry_F",                     // VTOL Y-32 Xi'an (Inf-Transport)
    "OPT_O_T_VTOL_02_vehicle_F",                         // VTOL Y-32 Xi'an (Fahrzeug-Transport)
    "OPT_O_T_VTOL_01_vehicle_F",            // VTOL Blackfish (Fahrzeug-Transport)
    "OPT4_O_Heli_Attack_02_F",                         // Mi-48 Kajman    (Unbewaffnet) 200000
    "OPT4_O_Heli_Attack_02_black_F",                // Mi-48 Kajman (Schwarz)
    "OPT_O_Plane_CAS_02_AA_F",                         // To-199 Neophron light - raus
    "OPT_O_Plane_CAS_02_F",                         // To-199 Neophron
    "OPT_O_Plane_Fighter_03_AA_F_1",                    // A-143 Buzzard (AA) 200000
    "OPT_O_Plane_CAS_01_F_1" ,                    // Wipeout CAS 400000
    "OPT_O_T_UAV_04_CAS_F",                         // KH-3A Fenghuan - noch in arbeit erstma nur testweise mit preis eingebaut
    "OPT_O_Plane_Fighter_AA_02_F",                    // To-201 Shikra (AA)
    "OPT_O_Heli_Transport_04_fuel_F",        // Mi-290 Taru (Fuel)
    "OPT_O_Heli_Transport_04_box_F",         // Mi-290 Taru (Rep)
    "OPT_O_Heli_Transport_04_ammo_F",         // Mi-290 Taru (Muni)
    "OPT_I_Heli_light_03_F",                 // WY-55 Hellcat
    "OPT_I_Heli_light_03_unarmed_F",          // WY-55 Hellcat Unbewaffnet
    "OPT_I_Heli_Transport_02_F",                 // CH-49 Mohawk (Transport+Lift)
    "OPT_I_UAV_02_light_F",                 // Greyhawk unbewaffnet
    "OPT_O_Heli_Light_02_v2_F",                // PO-30 Orca Cas light
    "OPT_O_Heli_Light_02_v3_F",                // PO-30 Orca Cas Heavy 
    "OPT_I_Heli_light_03_v2_F",                // WY-55 Hellcat Cas light
    "OPT_I_Heli_light_03_v3_F",                // WY-55 Hellcat Cas Heavy

    // NATO - CUP
    "OPT_CUP_MH60S_Unarmed_USN",            // MH-60S Seahawk
    "OPT_CUP_B_UH1D_armed_GER_KSK",         // UH-1D
    "OPT_CUP_B_CH53E_USMC",                 // CH-53G Super Stallion
    "OPT_CUP_B_AH64D_DL_USA",               // AH-64

    // CSAT - CUP
    "OPT_CUP_O_SA330_Puma_HC1_BAF",         // SA-330 Puma
    "OPT_CUP_O_Ka60_Grey_RU",               // KA-60 Katsaka
    "OPT_CUP_O_Merlin_HC3_GB",              // Merlin HC3A
    "OPT_CUP_O_Mi24_V_Dynamic_RU"          // MI-24V
];

GVAR(planes) = 
[
    // NATO - CUP
    "OPT_CUP_C_Cessna_172_CIV_BLUE",        // Cessna
    "OPT_CUP_C_AN2_CIV",                    // Antonov An-2
    "OPT_CUP_C_DC3_ChernAvia_CIV",          // Li-2
    "OPT_CUP_B_C130J_USMC",                 // C130J

    // CSAT - CUP
    "OPT_CUP_C_Cessna_172_CIV_GREEN",       // Cessna
    "OPT_CUP_O_AN2_TK",                     // Antonov An-2
    "OPT_CUP_O_C47_SLA",                    // Li-2
    "OPT_CUP_O_C130J_TKA"                   // C130J
];

GVAR(jets) = 
[
    // NATO - CUP
    "OPT_CUP_B_L39_CZ_GREY",                // L-39AZ

    // CSAT - CUP
    "OPT_CUP_O_Su25_Dyn_RU"                 // SU-25T
];

GVAR(blockedVehiclePositions_air) = 
[
    "driver"
];

/* FAHRZEUGE UND CREW */
    // hier sind alle Classnames aufgelistet, welche als Crew definiert werden um gepanzerte Fahrzeuge fahren zu duerfen (und Schuetzenposition)
GVAR(crew) = 
[
    /* UNUSED
    "OPT_NATO_Besatzungsmitglied_T",
    "OPT_CSAT_Besatzungsmitglied_T",
    "O_crew_F",
    "I_crew_F",
    */
    "OPT_NATO_Besatzungsmitglied",
    "OPT_CSAT_Besatzungsmitglied"
];

GVAR(crew_vehicles) = 
[    
//NATO
    "OPT4_B_LSV_01_AT_F",
    "OPT4_B_MRAP_01_gmg_F",
    "OPT4_B_APC_tracked_03_cannon_F",
    "OPT4_B_APC_Wheeled_01_cannon_F",
    "OPT4_B_APC_Tracked_01_rcws_F",
    "OPT4_B_APC_Tracked_01_AA_F",
    "OPT4_B_MBT_01_cannon_F",
    "OPT4_B_MBT_01_TUSK_F",
    "OPT4_B_MBT_01_arty_F",
    "OPT4_B_MBT_03_cannon_F",
    "OPT_B_MBT_01_mlrs_F",

// NATO - CUP
    "OPT_CUP_B_LAV25_HQ_USMC",              // LAV C2
    "OPT_CUP_B_M2Bradley_USA_W",            // M2A2 Bradley IFV 
    "OPT_CUP_B_M163_USA",                   // M163A1 VADS (50er Magazine)
    "OPT_CUP_B_M60A3_TTS_USMC",             // M60A3 TTS
    "OPT_CUP_B_Leopard2A6_GER",             // Leopard 2A6
    "OPT_CUP_B_HMMWV_TOW_USMC",             // HMMWV TOW
    "OPT_CUP_B_RM70_CZ",                    // RM-70 

//Tropentarn
    "OPT4_B_LSV_01_AT_ghex_F",
    "OPT4_B_MRAP_01_gmg_ghex_F",
    "OPT4_B_APC_tracked_03_cannon_ghex_F",
    "OPT4_B_APC_Wheeled_01_cannon_ghex_F",
    "OPT4_B_APC_Tracked_01_rcws_ghex_F",
    "OPT4_B_APC_Tracked_01_AA_ghex_F",
    "OPT4_B_MBT_01_cannon_ghex_F",
    "OPT4_B_MBT_01_TUSK_ghex_F",
    "OPT4_B_MBT_01_arty_ghex_F",
    "OPT4_B_MBT_03_cannon_ghex_F",
    "OPT_B_MBT_01_mlrs_ghex_F",
    

//CSAT 
    "OPT4_O_LSV_02_AT_F",
    "OPT4_O_MRAP_02_gmg_F",    
    "OPT4_O_APC_Wheeled_02_rcws_F",
    "OPT4_O_APC_Wheeled_03_cannon_F",
    "OPT4_O_APC_Tracked_02_cannon_F",
    "OPT4_O_APC_Tracked_02_AA_F",
    "OPT4_O_MBT_02_cannon_F",
    "OPT4_O_MBT_02_arty_F",
    "OPT_O_Truck_02_MRL_F",

// CSAT - CUP
    "OPT_CUP_O_ZSU23_Afghan_SLA",           // ZSU-23-4 Afghanski (50er Magazine)
    "OPT_CUP_O_T72_RU",                     // T72
    "OPT_CUP_O_T90_RU",                     // T90
    "OPT_CUP_O_BTR60_RU",                   // BTR-60 PB
    "OPT_CUP_O_BTR90_RU",                   // BTR-90
    "OPT_CUP_O_BRDM2_ATGM_RUS",             // BRDM-2 ATGM
    "OPT_CUP_O_BM21_RU",                    // BM21

//Tropentarn
    "OPT4_O_LSV_02_AT_GHEX_F",
    "OPT4_O_MRAP_02_gmg_ghex_F",
    "OPT4_O_T_APC_Wheeled_02_rcws_ghex_F",
    "OPT4_O_APC_Wheeled_03_cannon_ghex_F",
    "OPT4_O_T_APC_Tracked_02_cannon_ghex_F",
    "OPT4_O_T_APC_Tracked_02_AA_ghex_F",
    "OPT4_O_T_MBT_02_cannon_ghex_F",    
    "OPT4_O_T_MBT_02_arty_ghex_F",
    "OPT_O_Truck_02_MRL_ghex_F",
    "OPT_O_LSV_02_AT_GHEX_F",
    "OPT_O_T_MBT_02_arty_ghex_F",
    "OPT_O_T_APC_Tracked_02_AA_ghex_F",
    "OPT_O_T_APC_Wheeled_01_cannon_F_INF",
    "OPT_O_T_APC_Tracked_02_cannon_ghex_F_VEH",
    "OPT_O_T_APC_Tracked_02_cannon_ghex_F_AT",
    "OPT_O_T_MBT_02_cannon_ghex_F_INF",
    "OPT_O_T_MBT_02_cannon_ghex_F_AT",

//AAF
    "OPT4_I_C_Offroad_02_AT_F",
    "OPT4_I_MRAP_03_gmg_F",    
    "OPT4_I_APC_Wheeled_03_cannon_F",
    "OPT4_I_APC_tracked_03_cannon_F",
    "OPT4_I_LT_01_AA_F",
    "OPT4_I_LT_01_AT_F",
    "OPT4_I_MBT_03_cannon_F",
    "OPT_I_Truck_02_MRL_F",
    "OPT_I_LSV_01_AT_ghex_F",
    "OPT_I_MBT_01_arty_ghex_F",
    "OPT_I_APC_Tracked_01_AA_ghex_F",
    "OPT_I_APC_tracked_03_cannon_F_INF",
    "OPT_I_APC_Wheeled_03_cannon_F_VEH",
    "OPT_I_APC_Wheeled_03_cannon_F_AT",
    "OPT_I_MBT_03_cannon_F_INF",
    "OPT_I_MBT_03_cannon_F_AT"
];

GVAR(blockedVehiclePositions_veh) = 
[
    "gunner",
    "turret",
    "Turret"
];

/* Waffenabfrage Pilot/Crew*/
GVAR(SMG) = 
[
    /* UNUSED
    "OPT_SMG_01_F",
    "OPT_SMG_02_F",
    "OPT_hgun_PDW2000_F",
    */
    "OPT_CUP_smg_Mac10",
    "OPT_CUP_smg_SA61"
];

/* Light AT-Schützen UND LAUNCHER */
GVAR(Lightrocketmen) = 
[
    /* UNUSED
    "OPT_NATO_PA_Schuetze",
    "OPT_NATO_PA_Schuetze_T",
    "OPT_CSAT_PA_Schuetze_T",
    "OPT_CSAT_PA_Schuetze",
    "OPT_NATO_Aufklaerung_Spaeher_AT",
    "OPT_CSAT_Aufklaerung_Spaeher_AT",
    "OPT_NATO_Aufklaerung_Spaeher_AT_T",
    "OPT_CSAT_Aufklaerung_Spaeher_AT_T",
    "O_Soldier_LAT_F",
    "I_Soldier_LAT2_F"
    */
    "OPT_NATO_Soldat",
    "OPT_CSAT_Soldat"
];

GVAR(lightlaunchers) = 
[
    /* UNUSED
    "launch_RPG7_F"
    */
    "CUP_launch_M72A6_Loaded",
    "CUP_launch_RPG18"
];

/* Heavy AT-Schützen UND LAUNCHER */
GVAR(Heavyrocketmen) = 
[
    /* UNUSED
    "O_Soldier_HAT_F",
    "I_Soldier_LAT_F",
    */
    "OPT_NATO_PA_Schuetze",
    "OPT_CSAT_PA_Schuetze"
];

GVAR(Heavylaunchers) = 
[
    /* UNUSED
    "OPT_launch_MRAWS_green_rail_F",
    "OPT_launch_RPG32_F",
    "OPT_launch_MRAWS_green_F",
    */
    "CUP_launch_MAAWS",
    "CUP_launch_Mk153Mod0"
];

/* AA-Schützen UND LAUNCHER */
GVAR(AArocketmen) = 
[
    /* UNUSED
    "O_Soldier_AA_F",
    "I_Soldier_AA_F",
    */
    "OPT_NATO_Luftabwehrspezialist",
    "OPT_CSAT_Luftabwehrspezialist"
];

GVAR(AAlaunchers) = 
[
    /* UNUSED
    "OPT_launch_B_Titan_F",
    "OPT_launch_B_Titan_tna_F",
    "OPT_launch_O_Titan_F",
    "OPT_launch_O_Titan_ghex_F",
    */
    "OPT_CUP_launch_FIM92Stinger",
    "OPT_CUP_launch_Igla"
];


/* OPERATOR 
 * UNUSED
GVAR(operator) = 
[
    "OPT_NATO_Operator_T",
    "OPT_CSAT_Operator_T",
    "OPT_NATO_Operator",
    "OPT_CSAT_Operator"
];
*/

/* MEDIC */
GVAR(medic) = 
[
    /* UNUSED
    "OPT_NATO_Sanitaeter_T",
    "OPT_CSAT_Sanitaeter_T",
    "I_medic_F",
    "O_medic_F",
    */
    "OPT_NATO_Sanitaeter",
    "OPT_CSAT_Sanitaeter"
];

/* spaeher 
 * UNUSED
GVAR(spaeher) = 
[
    "OPT_NATO_Aufklaerung_JTAC",
    "OPT_CSAT_Aufklaerung_JTAC"
];
*/

/* RECONSNIPER+waffen
 * UNUSED
GVAR(reconSnipers) = 
[
    "OPT_NATO_Aufklaerung_Scharfschutze_T",
    "OPT_NATO_Aufklaerung_Scharfschutze_2",
    "OPT_CSAT_Aufklaerung_Scharfschutze_T",
    "OPT_CSAT_Aufklaerung_Scharfschutze_2",
    "OPT_NATO_Aufklaerung_Scharfschutze",
    "OPT_CSAT_Aufklaerung_Scharfschutze"
];

GVAR(reconSniperRifles) = 
[
    "OPT_arifle_MXM_Black_F",
    "OPT_srifle_DMR_07_blk_F"    
];    
*/
                        
/* SNIPER+waffen */
GVAR(snipers) = 
[
    /* UNUSED
    "OPT_NATO_Scharfschuetze_T",
    "OPT_CSAT_Scharfschuetze_T",
    "OPT_NATO_Scharfschuetze_2_T",
    "OPT_CSAT_Scharfschuetze_2_T",
    "O_sniper_F",
    "I_Sniper_F",
    */
    "OPT_NATO_Scharfschuetze",
    "OPT_CSAT_Scharfschuetze"
];

GVAR(sniperRifles) = 
[
    /* UNUSED
    "OPT_srifle_DMR_02_F",
    "OPT_srifle_DMR_05_hex_F",
    "OPT_srifle_GM6_camo_F",
    "OPT_srifle_LRR_F",
    "OPT_srifle_LRR_tna_F",
    "OPT_srifle_GM6_ghex_F",
    "srifle_GM6_ghex_F",
    "srifle_LRR_F",
    */
    "OPT_CUP_srifle_AS50"
];

/* DMR SNIPER+waffen */
GVAR(DMRsnipers) = 
[
    /* UNUSED
    "OPT_CSAT_Beobachter",
    "OPT_NATO_Beobachter",
    "OPT_CSAT_Beobachter_T",
    "OPT_NATO_Beobachter_T",
    "O_soldier_M_F",
    "I_Soldier_M_F",
    */
    "OPT_NATO_Scharfschuetze_2",
    "OPT_CSAT_Scharfschuetze_2"
];

GVAR(DMRsniperRifles) = 
[
    /* UNUSED
    "srifle_DMR_03_woodland_F",
    "OPT_srifle_DMR_03_F",
    "OPT_srifle_EBR_F",
    "OPT_srifle_DMR_06_olive_F",
    */
    "OPT_CUP_arifle_HK417_20",
    "OPT_CUP_arifle_FNFAL5061_railed"
];

/* MG */
GVAR(soldatMG) = 
[
    /* UNUSED
    "OPT_CSAT_MG_Schuetze_T",
    "OPT_NATO_MG_Schuetze_T",
    "O_HeavyGunner_F",
    "I_support_MG_F",
    */
    "OPT_CSAT_MG_Schuetze",
    "OPT_NATO_MG_Schuetze"
];

GVAR(MG) = 
[
    /* UNUSED
    "OPT_LMG_Zafir_F",
    "OPT_LMG_Mk200_F",
    */
    "OPT_CUP_lmg_M240_B",
    "OPT_CUP_lmg_PKM_top_rail"
];


/* LMG */
GVAR(soldatLMG) = 
[
    /* UNUSED
    "O_Soldier_AR_F",
    "I_Soldier_AR_F",
    */
    "OPT_NATO_LMG_Schuetze",
    "OPT_CSAT_LMG_Schuetze"
];

GVAR(LMG) = 
[
    /* UNUSED
    "OPT_arifle_CTARS_blk_F",
    "OPT_LMG_03_F",
    "OPT_arifle_SPAR_02_blk_F",
    */
    "OPT_CUP_arifle_RPK74M_top_rail",
    "OPT_CUP_lmg_m249_pip3"
];

/* GRENADIER */
GVAR(grenadiers) = 
[
    /* UNUSED
    "OPT_CSAT_Grenadier_T",
    "OPT_NATO_Grenadier_T",
    "OPT_CSAT_Aufklaerung_JTAC",
    "OPT_NATO_Aufklaerung_JTAC",
    "OPT_NATO_Aufklaerung_JTAC_T",
    "OPT_CSAT_Aufklaerung_JTAC_T",
    "OPT_NATO_Gruppenfuehrer",
    "OPT_CSAT_Gruppenfuehrer",
    "OPT_NATO_Aufklaerung_Truppfuehrer",
    "OPT_NATO_Aufklaerung_Truppfuehrer_T",
    "OPT_CSAT_Aufklaerung_Truppfuehrer",
    "OPT_CSAT_Aufklaerung_Truppfuehrer_T",
    "O_Soldier_GL_F",
    "I_Soldier_GL_F",
    */
    "OPT_CSAT_Grenadier",
    "OPT_NATO_Grenadier"
];

GVAR(grenadelaunchers) = 
[
    /* UNUSED
    "OPT_arifle_MX_GL_Black_F",
    "OPT_arifle_Katiba_GL_F",
    "OPT_arifle_SPAR_01_GL_blk_F",
    "OPT_arifle_CTAR_GL_blk_F",
    "OPT_arifle_Mk20_GL_F",
    */
    "OPT_CUP_arifle_HK416_M203_Black",
    "OPT_CUP_arifle_AK101_GL_railed"
];


/* PIONIER */
GVAR(pioniers) = 
[
    /* UNUSED
    "OPT_NATO_Pionier_T",
    "OPT_CSAT_Pionier_T",
    "OPT_CSAT_Aufklaerung_Sprengmeister_T",
    "OPT_NATO_Aufklaerung_Sprengmeister_T",
    "OPT_NATO_Pionier",
    "OPT_CSAT_Pionier",
    "OPT_CSAT_Aufklaerung_Sprengmeister",
    "OPT_NATO_Aufklaerung_Sprengmeister",
    "O_soldier_exp_F",
    "I_Soldier_exp_F",
    */
    "OPT_CSAT_Sprengmeister",
    "OPT_NATO_Sprengmeister"
];

GVAR(Sprengmittel) = 
[
    "SLAMDirectionalMine_Wire_Mag",
    "ATMine_Range_Mag"
];    

/* RECON 
 * UNUSED
GVAR(recon) = 
[
    "OPT_CSAT_Aufklaerung_Scharfschutze_T",
    "OPT_CSAT_Aufklaerung_Scharfschutze_2",
    "OPT_CSAT_Aufklaerung_Sprengmeister_T",
    "OPT_NATO_Aufklaerung_Sprengmeister_T",
    "OPT_CSAT_Aufklaerung_Sprengmeister",
    "OPT_NATO_Aufklaerung_Sprengmeister",
    "OPT_NATO_Aufklaerung_JTAC",
    "OPT_NATO_Aufklaerung_JTAC_T",
    "OPT_CSAT_Aufklaerung_JTAC",
    "OPT_CSAT_Aufklaerung_JTAC_T",
    "OPT_CSAT_Aufklaerung_Spaeher_AT",
    "OPT_CSAT_Aufklaerung_Spaeher_AT_T",
    "OPT_NATO_Aufklaerung_Spaeher_AT",
    "OPT_NATO_Aufklaerung_Spaeher_AT_T",
    "OPT_CSAT_Aufklaerung_Sprengmeister_T",
    "OPT_NATO_Aufklaerung_Sprengmeister_T",
    "OPT_NATO_Aufklaerung_Truppfuehrer",
    "OPT_NATO_Aufklaerung_Truppfuehrer_T",
    "OPT_CSAT_Aufklaerung_Truppfuehrer",
    "OPT_CSAT_Aufklaerung_Truppfuehrer_T",
    "OPT_CSAT_Soldat",
    "OPT_NATO_Soldat"
];

GVAR(reconRifles) = 
[
    "OPT_arifle_Katiba_F",
    "OPT_arifle_Katiba_GL_F",
    "OPT_arifle_MX_Black_F",
    "OPT_arifle_MX_GL_Black_F"
];
*/

/* UAV */
GVAR(big_uavs) = 
[
    "OPT_B_UAV_02_F",
    "OPT_B_UAV_02_CAS_F",
    "OPT_B_UAV_02_light_F",
    "OPT_O_UAV_02_F",
    "OPT_O_UAV_02_CAS_F",
    "OPT_O_UAV_02_light_F",
    "OPT_B_UAV_02_AA_F",
    "OPT_O_UAV_02_AA_F",
    "B_UCSV_01",
    "O_UCSV_01",
    "OPT_O_T_UAV_04_CAS_F",
    "OPT_B_T_UAV_03_dynamicLoadout_F",
    "OPT_I_UAV_02_light_F"
];
