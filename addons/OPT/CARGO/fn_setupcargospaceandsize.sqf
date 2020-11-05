/**
* Author: James
* initialize all opt objects with correct ACE Cargo setLightnings
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

GVAR(canTransportCargo) = 
[
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
	["OPT_B_Truck_01_ammo_F", 2],             		// HEMTT Ammo
    ["OPT_B_Truck_01_fuel_F", 2],              		// HEMTT Fuel
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
	["OPT4_B_MRAP_01_gmg_F", 4],                		// Hunter GMG 
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
	["OPT4_B_MRAP_01_gmg_ghex_F", 4],                		// Hunter GMG
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
	["OPT_B_Heli_Transport_02_F", 10],           	// CH-49 Mohawk (Transport+Lift)
    ["OPT_B_Heli_Transport_03_unarmed_F", 10],    // CH-67 Huron unarmed (Transport+Lift)
    ["OPT_B_Heli_Transport_03_F", 10],            // CH-67 Huron armed (Transport+Lift)
    ["OPT_B_UAV_02_light_F", 0],                 // Greyhawk unbewaffnet
    ["OPT_B_UAV_02_CAS_F", 0],                        // Greyhawk LGB
    ["OPT_B_UAV_02_F", 0],                            // Greyhawk Raketen    
	["OPT4_B_Heli_Attack_01_F", 0],                   // AH-99 Blackfoot 
	["OPT_B_T_VTOL_01_infantry_F", 4],                // VTOL Blackfish (Inf-Transport) 
    ["OPT_B_T_VTOL_01_vehicle_F", 10],         	    // VTOL Blackfish (Fahrzeug-Transport)
    ["OPT_B_T_VTOL_02_infantry_unarmed_F", 2],   		// VTOL Y-32 Xi'an (Inf-Transport)
    ["OPT_B_Plane_CAS_01_F", 0],                      // A-164 Wipeout
    ["OPT_B_Plane_Fighter_01_Stealth_F", 0],               // F/A-181 Black Wasp II   

// NATO ships
	["OPT_B_Boat_Transport_01_F", 4],			    	// Assault Boat     - hinzugefügt
	["OPT_B_Boat_Armed_01_minigun_F", 4],		    	// Speedboat Minigun    - hinzugefügt
	["OPT_B_C_Boat_Transport_02_F", 4],			    	// Rhib unbewaffnet      - hinzugefügt
	
// NATO supplies/drohnen	
	["OPT_B_UGV_01_F", 6],								// UGV Stomper
	//Tropentarn
	["OPT_B_UGV_01_ghex_F", 6],                         // UGV Stomper
	
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
    ["OPT4_O_T_MRAP_02_hmg_ghex_F", 4],                // Ifrit HMG 
    ["OPT_O_T_Truck_03_covered_ghex_F", 4],           // Tempest Transport 
	["OPT_O_T_Truck_03_transport_ghex_F", 10],         // Tempest 
    ["OPT_O_T_Truck_03_repair_ghex_F", 2],            // Tempest Repair
    ["OPT_O_T_Truck_03_medical_ghex_F", 2],          // Tempest Medical
	["OPT_O_T_Truck_03_ammo_ghex_F", 2],                 // Tempest Ammo
    ["OPT_O_T_Truck_03_fuel_ghex_F", 2],                 // Tempest Fuel
	
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
	["OPT4_O_MRAP_02_gmg_ghex_F", 4],                  // Ifrit GMG
	["OPT4_O_LSV_02_AT_ghex_F", 4],                    // Quilin AT 
    ["OPT4_O_T_APC_Wheeled_02_rcws_ghex_F", 4],       // MSE-3 Marid 
    ["OPT4_O_APC_Wheeled_03_cannon_ghex_F", 4],       		// AFV-4 Gorgon
	["OPT4_O_T_APC_Tracked_02_cannon_ghex_F", 4],     // BTR-K Kamysh 
    ["OPT4_O_T_APC_Tracked_02_AA_ghex_F", 2],         // ZSU-39 Tigris 
    ["OPT4_O_T_MBT_02_cannon_ghex_F", 2],             // T-100 Varsuk 
    ["OPT4_O_T_MBT_02_arty_ghex_F", 2],               // 2S9 Sochor 
	["OPT_O_Truck_02_MRL_ghex_F", 2],                 // Zamark MRL  
	
// CSAT Helicopter
    ["OPT_O_Heli_Light_01_F", 4],                 // MH6
    ["OPT_O_Heli_Light_03_unarmed_F", 4],             // WY-55 Hellcat
    ["OPT4_O_Heli_light_03_F", 4],                    // WY-55 Hellcat
    ["OPT_O_Heli_Light_02_unarmed_F", 4],             // PO-30 Orca
    ["OPT4_O_Heli_Light_02_F", 4],       			// PO-30 Orca
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
    ["OPT_O_T_VTOL_02_infantry_unarmed_F", 2],   		// VTOL Y-32 Xi'an (Inf-Transport)
    ["OPT_O_T_VTOL_02_vehicle_unarmed_F", 10],         // VTOL Y-32 Xi'an (Fahrzeug-Transport) 
    ["OPT_O_T_VTOL_01_vehicle_F", 10],            		// VTOL Blackfish (Fahrzeug-Transport)
    ["OPT_O_Plane_CAS_02_F", 0],                      // To-199 Neophron
	["OPT_O_Plane_Fighter_AA_02_F", 0],              	// To-201 Shikra 
    ["OPT_O_Plane_CAS_01_F_1" , 0],                  // Wipeout CAS 
	["OPT_O_Plane_Fighter_01_Stealth_F", 0],          // F/A-181 Black Wasp II  
	
// CSAT Supplies	
	["OPT_O_T_UGV_01_ghex_F", 6],						// UGV Saif	
//vanilla
	["OPT_O_UGV_01_F", 6],					        	// UGV Saif	
// CSAT Ships
	["OPT_O_Boat_Transport_01_F", 4],					// Assault Boat
	["OPT_O_Boat_Armed_01_hmg_F", 4],					// Speedboat HMG
	["OPT_O_C_Boat_Transport_02_F", 4],				    // rhib unbewaffnet	
// AAF Vehicles
    ["OPT_I_Quadbike_01_F", 2],                    // Quadbike
    ["OPT_I_C_Offroad_02_unarmed_F", 4],               // Jeep unarmed 
    ["OPT_I_C_Offroad_02_LMG_F", 4],                 // Jeeg MG
	["OPT_I_MRAP_03_F", 4],                        // Strider
	["OPT4_I_MRAP_03_hmg_F", 4],                   // Strider HMG
    ["OPT_I_Truck_02_covered_F", 4],               // Zamak Transport
    ["OPT_I_Truck_02_box_F", 2],               // Zamak Repair
    ["OPT_I_Truck_02_transport_F", 10],               // Zamak  
	["OPT_I_Truck_02_ammo_F", 2],               // Zamak Ammo
    ["OPT_I_Truck_02_fuel_F", 2],  		     // Zamak Fuel
// AAF Choppers
    ["OPT_I_Heli_light_03_F", 4],                 // WY-55 Hellcat
    ["OPT_I_Heli_light_03_unarmed_F", 4],          // WY-55 Hellcat Unbewaffnet
	["OPT_I_Heli_Transport_02_F", 10],           	    // CH-49 Mohawk (Transport+Lift)
    ["OPT_I_UAV_02_light_F", 0],                 // Greyhawk unbewaffnet
// AAF Armored
	["OPT4_I_C_Offroad_02_AT_F", 4],                     // Jeep AT 
	["OPT4_I_MRAP_03_gmg_F", 4],                		// Strider GMG 
    ["OPT4_I_APC_Wheeled_03_cannon_F", 4],        // Gorgon    
    ["OPT4_I_APC_tracked_03_cannon_F", 4],        // FV-720 Mora   
    ["OPT4_I_LT_01_AA_F", 2],                     // Nyx AA	
    ["OPT4_I_LT_01_AT_F", 2],                    // Nyx AT
    ["OPT_I_LT_01_scout_F", 2],                    // Nyx Recon
    ["OPT4_I_MBT_03_cannon_F", 2],                     // MBT-52 Kuma
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
GVAR(canBeTransported) =
[	
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
	["OPT_B_Truck_01_ammo_F", 10],             		// HEMTT Ammo
    ["OPT_B_Truck_01_fuel_F", 10],              		// HEMTT Fuel
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
	["OPT4_B_MRAP_01_gmg_F", 5],                		// Hunter GMG 
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
	["OPT4_B_MRAP_01_gmg_ghex_F", 5],                		// Hunter GMG
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
	["OPT_B_UGV_01_F", 4],								// UGV Stomper   
    //Tropentarn
	["OPT_B_UGV_01_ghex_F", 4],                         // UGV Stomper  	
// NATO supplies
	["OPT_B_supplyCrate_F", 2],							    // Transportkiste (leer)
	["OPT_Box_NATO_Ammo_F", 2],          				    // Munitionskiste	
	["OPT_Box_NATO_WpsSpecial_F", 2],          			    // Munition spezial NEUE KISTE!
	["OPT_Box_NATO_Grenades_F", 2],  					    // granatenkiste	
	["OPT_NATO_Sprengstoffkiste", 2],  					    // sprengstoffkiste NEUE KISTE!
	["OPT_Box_NATO_WpsSpecial_AT_L1", 2],				    // Raketenkiste MAWWS NEUE KISTE!
	["OPT_Box_NATO_WpsSpecial_AT_L2", 2],				    // Raketenkiste PCML NEUE KISTE!
	["OPT_Box_NATO_WpsSpecial_AT_H1", 2],				    // Raketenkiste Titan NEUE KISTE!
	["OPT_Box_NATO_WpsSpecial_AA_F", 2],				    // Raketenkiste AA 
	["OPT_Box_NATO_WpsSpecial_Diver_F", 2],				    // Taucherkiste,5000
	["OPT_B_HMG_01_F", 2],							    	                    // Stand-MG niedrig,10000
	["OPT_B_HMG_01_high_F", 2],							                    // Stand-MG hoch,10000
	["OPT_B_GMG_01_F", 2],							       	                    // Stand-GMG niedrig,15000
	["OPT_B_GMG_01_high_F", 2],							                    // Stand-GMG hoch,15000
	["OPT_B_static_AA_F", 2],						    	                    // Stand-AA,25000
	["OPT_B_static_AT_F", 2],						    	                    // Stand-AT,200000	
	["OPT_B_Mortar_01_F", 2],							                        // MK6 - Mörser,200000
	["B_Mortar_01_F", 2],						// MK6 - Mrser	
	["OPT_B_Slingload_01_Fuel_F", 10],     				    // Fuelcontainer  
	["OPT_B_Slingload_01_Repair_F", 10],       			    // Reparaturcontainer 
	["OPT_B_Slingload_01_Ammo_F", 10],					    // Munitionscontainer - von 110 runtergesetzt damit es in lkw passt
	["OPT_B_Slingload_01_Medevac_F", 10],				    // Lazarettcontainer
	["Land_Cargo10_military_green_F", 10],				    // Radarcontainer NEU - wieder getauscht
	["OPT_B_Slingload_01_Repair_Radar_F", 10],			    // Radarcontainer NEU
	["OPT_Box_NATO_WpsSpecial_Diver_F", 2],				    // Taucherkiste
	["OPT_FlexibleTank_01_forest_F", 1],				    //Spritfass
	["ACE_Box_82mm_Mo_HE", 4],				    //Mörsermuni
// NATO ships
	["OPT_B_Boat_Transport_01_F", 5],			    	// Assault Boat     - hinzugefügt
	["OPT_B_Boat_Armed_01_minigun_F", 5],		    	// Speedboat Minigun    - hinzugefügt
	["OPT_B_C_Boat_Transport_02_F", 5],			    	// Rhib unbewaffnet      - hinzugefügt	
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
    ["OPT4_O_T_MRAP_02_hmg_ghex_F", 5],                // Ifrit HMG 
    ["OPT_O_T_Truck_03_covered_ghex_F", 10],           // Tempest Transport 
	["OPT_O_T_Truck_03_transport_ghex_F", 10],         // Tempest 
    ["OPT_O_T_Truck_03_repair_ghex_F", 10],            // Tempest Repair
    ["OPT_O_T_Truck_03_medical_ghex_F", 10],          // Tempest Medical
	["OPT_O_T_Truck_03_ammo_ghex_F", 10],                 // Tempest Ammo
    ["OPT_O_T_Truck_03_fuel_ghex_F", 10],                 // Tempest Fuel
	
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
	["OPT4_O_MRAP_02_gmg_ghex_F", 5],                  // Ifrit GMG
	["OPT4_O_LSV_02_AT_ghex_F", 5],                    // Quilin AT 
    ["OPT4_O_T_APC_Wheeled_02_rcws_ghex_F", 10],       // MSE-3 Marid 
    ["OPT4_O_APC_Wheeled_03_cannon_ghex_F", 10],       		// AFV-4 Gorgon
	["OPT4_O_T_APC_Tracked_02_cannon_ghex_F", 10],     // BTR-K Kamysh 
    ["OPT4_O_T_APC_Tracked_02_AA_ghex_F", 10],         // ZSU-39 Tigris 
    ["OPT4_O_T_MBT_02_cannon_ghex_F", 10],             // T-100 Varsuk 
    ["OPT4_O_T_MBT_02_arty_ghex_F", 10],               // 2S9 Sochor 
	["OPT_O_Truck_02_MRL_ghex_F", 10],                 // Zamark MRL  
	
// CSAT supplies
	["OPT_O_supplyCrate_F", 2],							    // Transportkiste (leer)
	["OPT_Box_East_Ammo_F", 2],         				    // Munitionskiste
	["OPT_Box_East_WpsSpecial_F", 2],         			    // Munition spezial kiste NEUE KISTE!
	["OPT_Box_East_Grenades_F", 2],     				    // granatenkiste
	["OPT_CSAT_Sprengstoffkiste", 2],     				    // sprengstoffkiste NEUE KISTE!
	["OPT_CSAT_Minenkiste", 2],     				    // Minenkiste NEUE KISTE!
	["OPT_Box_East_WpsSpecial_AT_L1", 2],   				    // AT Raketenkiste RPG42 NEUE KISTE!
	["OPT_Box_East_WpsSpecial_AT_L2", 2],   				    // AT Raketenkiste PPG 7 NEUE KISTE!
	["OPT_Box_East_WpsSpecial_AT_H1", 2],   				    // AT Raketenkiste Titan NEUE KISTE!
	["OPT_Box_East_WpsSpecial_AA_F", 2],				    // AA Raketenkiste
	["OPT_Box_East_WpsSpecial_Diver_F", 2],				    // Taucherkiste
	["OPT_O_HMG_01_F", 2],								                        // Stand-MG niedrig,10000
	["OPT_O_HMG_01_high_F", 2],							                    // Stand-MG hoch,10000
	["OPT_O_GMG_01_F", 2],								                        // Stand-GMG niedrig,15000
	["OPT_O_GMG_01_high_F", 2],						                        // Stand-GMG hoch,15000
	["OPT_O_static_AA_F", 2],							                        // Stand-AA,25000
	["OPT_O_static_AT_F", 2],							                        // Stand-AT,200000
	["OPT_O_Mortar_01_F", 2],							                        // MK6 Mörser,200000
	["B_Mortar_01_F", 2],						// MK6 - Mrser
	["OPT_O_Static_Designator_02_F", 1],					    // Remote Designator
	["OPT_FlexibleTank_01_sand_F", 1],					    // Treibstoff-Fass
	["OPT_Land_Pod_Heli_Transport_04_fuel_F", 10],		    // Fuelcontainer
	["OPT_Land_Pod_Heli_Transport_04_fuel_black_F", 10], 	// Fuelcontainer (schwarz)
    ["OPT_Land_Pod_Heli_Transport_04_ammo_F", 10],		    // Munitionscontainer
	["OPT_Land_Pod_Heli_Transport_04_ammo_black_F", 10], 	// Munitionscontainer (Schwarz)
    ["OPT_Land_Pod_Heli_Transport_04_repair_F", 10],		    // Reparaturcontainer
	["OPT_Land_Pod_Heli_Transport_04_repair_black_F", 10],	// Repcontainer schwarz
	["OPT_Land_Pod_Heli_Transport_04_repair_radar_F", 10],	// Radar Container NEU
// CSAT Supplies	
	["OPT_O_T_UGV_01_ghex_F", 4],						// UGV Saif	
//vanilla
	["OPT_O_UGV_01_F", 4],	
// CSAT Ships
	["OPT_O_Boat_Transport_01_F", 4],					// Assault Boat
	["OPT_O_Boat_Armed_01_hmg_F", 4],					// Speedboat HMG
	["OPT_O_C_Boat_Transport_02_F", 4],				    // rhib unbewaffnet	
// AAF Vehicles
    ["OPT_I_Quadbike_01_F", 4],                    // Quadbike
    ["OPT_I_C_Offroad_02_unarmed_F", 5],               // Jeep unarmed 
    ["OPT_I_C_Offroad_02_LMG_F", 5],                 // Jeeg MG
	["OPT_I_MRAP_03_F", 5],                        // Strider
	["OPT4_I_MRAP_03_hmg_F", 5],                   // Strider HMG
    ["OPT_I_Truck_02_covered_F", 10],               // Zamak Transport
    ["OPT_I_Truck_02_box_F", 10],               // Zamak Repair
    ["OPT_I_Truck_02_transport_F", 10],               // Zamak  
	["OPT_I_Truck_02_ammo_F", 10],               // Zamak Ammo
    ["OPT_I_Truck_02_fuel_F", 10],  		     // Zamak Fuel               // Greyhawk unbewaffnet
// AAF Armored
	["OPT4_I_C_Offroad_02_AT_F", 5],                     // Jeep AT 
	["OPT4_I_MRAP_03_gmg_F", 5],                		// Strider GMG 
    ["OPT4_I_APC_Wheeled_03_cannon_F", 10],        // Gorgon    
    ["OPT4_I_APC_tracked_03_cannon_F", 10],        // FV-720 Mora   
    ["OPT4_I_LT_01_AA_F", 10],                     // Nyx AA	
    ["OPT4_I_LT_01_AT_F", 10],                    // Nyx AT
    ["OPT_I_LT_01_scout_F", 10],                    // Nyx Recon
    ["OPT4_I_MBT_03_cannon_F", 10],                     // MBT-52 Kuma
    ["OPT_I_Truck_02_MRL_F", 10],                      // Zamak Arty  
// AAF supplies
	["OPT_I_supplyCrate_F", 2],							    // Transportkiste (leer)
	["OPT_Box_EFA_Ammo_F", 2],         				    // Munitionskiste
	["OPT_Box_EAF_WpsSpecial_F", 2],         			    // Munition spezial kiste NEUE KISTE!
	["OPT_Box_EAF_Grenades_F", 2],     				    // granatenkiste
	["OPT_EAF_Sprengstoffkiste", 2],     				    // sprengstoffkiste NEUE KISTE!
	["OPT_EAF_Minenkiste", 2],     				    // Minenkiste NEUE KISTE!
	["OPT_Box_EAF_WpsSpecial_AT_L1", 2],   				    // AT Raketenkiste MAWSS NEUE KISTE!
	["OPT_Box_EAF_WpsSpecial_AT_L2", 2],   				    // AT Raketenkiste PPG 7 NEUE KISTE!
	["OPT_Box_EAF_WpsSpecial_AA_F", 2],				    // AA Raketenkiste
	["OPT_Box_EAF_WpsSpecial_Diver_F", 2],				    // Taucherkiste
	["OPT_I_HMG_01_F", 2],								                        // Stand-MG niedrig,10000
	["OPT_I_HMG_01_high_F", 2],							                    // Stand-MG hoch,10000
	["OPT_I_GMG_01_F", 2],								                        // Stand-GMG niedrig,15000
	["OPT_I_GMG_01_high_F", 2],						                        // Stand-GMG hoch,15000
	["OPT_I_static_AA_F", 2],							                        // Stand-AA,25000
	["OPT_I_static_AT_F", 2],							                        // Stand-AT,200000
	["OPT_I_Mortar_01_F", 2],							                        // MK6 Mörser,200000
	["I_Mortar_01_F", 2],						// MK6 - Mrser
	["OPT_FlexibleTank_01_forest_F", 1],					    // Treibstoff-Fass	
	["OPT_I_Static_Designator_01_F", 1],					    // Remote Designator	
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
    ["OPT_B_CargoNet_01_ammo_F", [0, 2, 0.1], 0],                         	// Ausrüstungskiste
    ["OPT_B_supplyCrate_F", [0, 2, 0.1], 0],			                    // Transportkiste (leer),500
	["OPT_Box_NATO_WpsSpecial_Diver_F"],				                    // Taucherkiste,5000	
	["OPT_Box_NATO_Ammo_F"],            				                    // Munitionskiste,40000
	["OPT_Box_NATO_WpsSpecial_F"],            				                // Munition spezial kiste NEUE KISTE!	
    ["OPT_Box_NATO_Grenades_F"],         				                    // granatenkiste,75000
    ["OPT_NATO_Sprengstoffkiste"],         				                    // sprengstoffkiste,75000 NEUE KISTE!	
	["OPT_Box_NATO_WpsSpecial_AT_L1"],				   					 // Raketenkiste MAWWS NEUE KISTE!
	["OPT_Box_NATO_WpsSpecial_AT_L2"],				   					 // Raketenkiste PCML NEUE KISTE!
	["OPT_Box_NATO_WpsSpecial_AT_H1"],				    				// Raketenkiste Titan NEUE KISTE!	
	["OPT_Box_NATO_WpsSpecial_AA_F"],					                    // AA Raketenkiste,40000	
	["OPT_B_HMG_01_F"],							    	                    // Stand-MG niedrig,10000
	["OPT_B_HMG_01_high_F"],							                    // Stand-MG hoch,10000
	["OPT_B_GMG_01_F"],							       	                    // Stand-GMG niedrig,15000
	["OPT_B_GMG_01_high_F"],							                    // Stand-GMG hoch,15000
	["OPT_B_static_AA_F"],						    	                    // Stand-AA,25000
	["OPT_B_static_AT_F"],						    	                    // Stand-AT,200000	
	["OPT_B_Mortar_01_F"],							                        // MK6 - Mörser,200000
	["B_Mortar_01_F"],						// MK6 - Mrser
	["OPT_FlexibleTank_01_forest_F"],					                    //Spritfass
	["OPT_B_Static_Designator_01_F"],					                    // Remote Designator,10000
	["OPT_B_Slingload_01_Fuel_F",  [0, 5, 0.05], 0],                         // Fuelcontainer,5000
	["OPT_B_Slingload_01_Ammo_F",  [0, 5, 0.05], 0],                         // Munitionscontainer,50000
	["OPT_B_Slingload_01_Repair_F",  [0, 5, 0.05], 0],                       // Reparaturcontainer,5000
	["OPT_B_Slingload_01_Repair_radar_F",  [0, 5, 0.05], 0],
	["Land_Cargo10_military_green_F"],	// NATO Radar Container
	["OPT_B_Slingload_01_Medevac_F",  [0, 5, 0.05], 0], // Lazarettcontainer,5000			//psycho, dieser container verursacht Probleme mit den Load-Scripts und wird durch den weissen Container ersetzt welcher zum Lazarett ausgebaut werden kann
// NATO ships	
	["OPT_B_Boat_Transport_01_F", [0, 2, 0.1], 0],					        // Assault Boat,500
	["OPT_B_C_Boat_Transport_02_F", [0, 2, 0.1], 0],				    	// Rhib unbewaffnet,2000
	["OPT_B_Boat_Armed_01_minigun_F",[0, 2, 0.1], 0],				                        // Speedboat Minigun,10000
	["OPT_B_SDV_01_F",[0, 2, 0.1], 0],								                        // Submarine,2000
//CSAT supplies
    ["OPT_O_CargoNet_01_ammo_F", [0, 2, 0.1], 0],                        	// Ausrüstungskiste
	["OPT_O_supplyCrate_F", [0, 2, 0.1], 0],							    // Transportkiste,500
	["OPT_Box_East_WpsSpecial_Diver_F"],				                    // Taucherkiste,5000
	["OPT_Box_East_WpsSpecial_AA_F"],				                        // AA Raketenkiste,40000
	["OPT_Box_East_WpsSpecial_AT_L1"],   				   					// AT Raketenkiste RPG42 NEUE KISTE!
	["OPT_Box_East_WpsSpecial_AT_L2"],   				   					// AT Raketenkiste PPG 7 NEUE KISTE!
	["OPT_Box_East_WpsSpecial_AT_H1"],   				    				// AT Raketenkiste Titan NEUE KISTE!
	["OPT_Box_East_Ammo_F"],            			                        // Munitionskiste,40000
	["OPT_Box_East_WpsSpecial_F"],            			                    // Munition spezial kiste NEUE KISTE!
    ["OPT_Box_East_Grenades_F"],            		                        // granatenkiste,75000
    ["OPT_CSAT_Sprengstoffkiste"],            		                        // sprengstoffkiste,75000 NEUE KISTE!
	["OPT_CSAT_Minenkiste"],            		                        // Minenkiste,75000 NEUE KISTE!
	["OPT_Box_East_WpsLaunch_F"],					                		// HAT-Kiste (Titan),400000
	["OPT_O_HMG_01_F"],								                        // Stand-MG niedrig,10000
	["OPT_O_HMG_01_high_F"],							                    // Stand-MG hoch,10000
	["OPT_O_GMG_01_F"],								                        // Stand-GMG niedrig,15000
	["OPT_O_GMG_01_high_F"],						                        // Stand-GMG hoch,15000
	["OPT_O_static_AA_F"],							                        // Stand-AA,25000
	["OPT_O_static_AT_F"],							                        // Stand-AT,200000
	["OPT_O_Mortar_01_F"],							                        // MK6 Mörser,200000
	["B_Mortar_01_F"],						// MK6 - Mrser
	["OPT_FlexibleTank_01_sand_F"],					                        // Treibstoff-Fass
	["OPT_O_Static_Designator_02_F"],					                    // Remote Designator,10000
	["OPT_Land_Pod_Heli_Transport_04_fuel_F",  [0, 5, 0.05], 0],			    // Fuelcontainer,5000
	["OPT_Land_Pod_Heli_Transport_04_fuel_black_F",  [0, 5, 0.05], 0],	    // Fuelcontainer (schwarz),5000
	["OPT_Land_Pod_Heli_Transport_04_ammo_F",  [0, 5, 0.05], 0],		        // Munitionscontainer,50000
	["OPT_Land_Pod_Heli_Transport_04_ammo_black_F",  [0, 5, 0.05], 0],	    // Munitionscontainer (Schwarz),50000
	["OPT_Land_Pod_Heli_Transport_04_repair_F",	 [0, 5, 0.05], 0],		    // Reparaturcontainer,5000
	["OPT_Land_Pod_Heli_Transport_04_repair_black_F", [0, 5, 0.05], 0],	    // Reparaturcontainer (schwarz),5000
	["OPT_Land_Pod_Heli_Transport_04_repair_radar_F", [0, 5, 0.05], 0],      // CSAT Radar Container
	["Land_Cargo10_grey_F"],										        // Radar Container NEU
	["OPT_Land_Pod_Heli_Transport_04_medevac_F", [0, 5, 0.05], 0],			// Lazarettcontainer,5000 //psycho, dieser container verursacht Probleme mit den Load-Scripts und wird durch den weißen Container ersetzt welcher zum Lazarett ausgebaut werden kann
//CSAT ships
	["OPT_O_Boat_Transport_01_F", [0, 2, 0.1], 0], 		    // Assault Boat,500
	["OPT_O_Boat_Armed_01_hmg_F", [0, 2, 0.1], 0],					        // Speedboat HMG,14000
	["OPT_O_C_Boat_Transport_02_F", [0, 2, 0.1], 0],			// rhib unbewaffnet,7000
	["OPT_O_SDV_01_F", [0, 2, 0.1], 0],			// Submarine,2000										    
// AAF supplies
    ["OPT_I_CargoNet_01_ammo_F", [0, 2, 0.1], 0],                        	// Ausrüstungskiste
	["OPT_I_supplyCrate_F", [0, 2, 0.1], 0],			// Transportkiste (leer)
	["OPT_Box_EFA_Ammo_F"],         				    // Munitionskiste
	["OPT_Box_EAF_WpsSpecial_F"],         			    // Munition spezial kiste NEUE KISTE!
	["OPT_Box_EAF_Grenades_F"],     				    // granatenkiste
	["OPT_EAF_Sprengstoffkiste"],     				    // sprengstoffkiste NEUE KISTE!
	["OPT_EAF_Minenkiste"],     				    // Minenkiste NEUE KISTE!
	["OPT_Box_EAF_WpsSpecial_AT_L1"],   				    // AT Raketenkiste MAWSS NEUE KISTE!
	["OPT_Box_EAF_WpsSpecial_AT_L2"],   				    // AT Raketenkiste PPG 7 NEUE KISTE!
	["OPT_Box_EAF_WpsSpecial_AA_F"],				    // AA Raketenkiste
	["OPT_Box_EAF_WpsSpecial_Diver_F"],				    // Taucherkiste
	["OPT_I_HMG_01_F"],								                        // Stand-MG niedrig,10000
	["OPT_I_HMG_01_high_F"],							                    // Stand-MG hoch,10000
	["OPT_I_GMG_01_F"],								                        // Stand-GMG niedrig,15000
	["OPT_I_GMG_01_high_F"],						                        // Stand-GMG hoch,15000
	["OPT_I_static_AA_F"],							                        // Stand-AA,25000
	["OPT_I_static_AT_F"],							                        // Stand-AT,200000
	["OPT_I_Mortar_01_F"],							                        // MK6 Mörser,200000
	["I_Mortar_01_F"],						// MK6 - Mrser
	["OPT_FlexibleTank_01_forest_F"],					    // Treibstoff-Fass	
	["OPT_I_Static_Designator_01_F"],					    // Remote Designator
// AAF Ships
    ["OPT_I_Boat_Armed_01_minigun_F", [0, 2, 0.1], 0],         // Speedboat Minigun
    ["OPT_I_Boat_Transport_01_F", [0, 2, 0.1], 0],               // Assault Boat
    ["OPT_I_C_Boat_Transport_02_F", [0, 2, 0.1], 0]             // Rhib unbewaffnet		
];

GVAR(canBeCarried) = 
[
 // NATO supplies	
    ["OPT_B_supplyCrate_F"],							// Transportkiste (leer),500
	["OPT_Box_NATO_WpsSpecial_Diver_F"],				// Taucherkiste,5000	
	["OPT_Box_NATO_Ammo_F"],            				// Munitionskiste,40000
	["OPT_Box_NATO_WpsSpecial_F"],            			// Munition spezial kiste NEUE KISTE!	
    ["OPT_Box_NATO_Grenades_F"],         				// granatenkiste,75000
    ["OPT_NATO_Sprengstoffkiste"],         				// sprengstoffkiste,75000 NEUE KISTE!
	["OPT_Box_NATO_WpsSpecial_AT_L1"],				   	// Raketenkiste MAWWS NEUE KISTE!
	["OPT_Box_NATO_WpsSpecial_AT_L2"],				   	// Raketenkiste PCML NEUE KISTE!
	["OPT_Box_NATO_WpsSpecial_AT_H1"],				    // Raketenkiste Titan NEUE KISTE!	
	["OPT_Box_NATO_WpsSpecial_AA_F"],					// AA Raketenkiste,40000	
	["OPT_Box_NATO_WpsSpecial_AA_F"],					// AA Raketenkiste,40000
	["OPT_B_HMG_01_F"],							    	// Stand-MG niedrig,10000
	["OPT_B_HMG_01_high_F"],							// Stand-MG hoch,10000
	["OPT_B_GMG_01_F"],							    	// Stand-GMG niedrig,15000
	["OPT_B_GMG_01_high_F"],					    	// Stand-GMG hoch,15000
	["OPT_B_static_AA_F"],						    	// Stand-AA,25000
	["OPT_B_static_AT_F"],						    	// Stand-AT,200000
	["OPT_B_Mortar_01_F"],						    	// MK6 - Mörser,200000
	["B_Mortar_01_F"],						    	// MK6 - Mörser,200000
	["OPT_FlexibleTank_01_forest_F"],					// Spritfass
	["OPT_B_Slingload_01_Fuel_F", [0, 5, 0.05], 0],                      // Fuelcontainer,5000
	["OPT_B_Slingload_01_Ammo_F", [0, 5, 0.05], 0],                      // Munitionscontainer,50000
	["OPT_B_Slingload_01_Repair_F", [0, 5, 0.05], 0],                    // Reparaturcontainer,5000
	["OPT_B_Slingload_01_Repair_radar_F", [0, 5, 0.05], 0],    	        // NATO Radar Container
	["Land_Cargo10_military_green_F"],
	["OPT_B_Static_Designator_01_F"],					// Remote Designator,10000
//CSAT supplies
	["OPT_O_supplyCrate_F"],							// Transportkiste,500
	["OPT_Box_East_WpsSpecial_Diver_F"],				// Taucherkiste,5000
	["OPT_Box_East_WpsSpecial_AA_F"],					// AA Raketenkiste,40000
	["OPT_Box_East_WpsSpecial_AT_L1"],   				// AT Raketenkiste RPG42 NEUE KISTE!
	["OPT_Box_East_WpsSpecial_AT_L2"],   				// AT Raketenkiste PPG 7 NEUE KISTE!
	["OPT_Box_East_WpsSpecial_AT_H1"],   				// AT Raketenkiste Titan NEUE KISTE!
	["OPT_Box_East_Ammo_F"],            				// Munitionskiste,40000
	["OPT_Box_East_WpsSpecial_F"],            			// Munition spezial kiste NEUE KISTE!
    ["OPT_Box_East_Grenades_F"],                		// granatenkiste,75000
	["OPT_CSAT_Sprengstoffkiste"],            		    // sprengstoffkiste,75000 NEUE KISTE!
	["OPT_CSAT_Minenkiste"],            		         // Minenkiste,75000 NEUE KISTE!
	["OPT_Box_East_WpsLaunch_F"],						// HAT-Kiste (Titan),400000
	["OPT_O_HMG_01_F"],						    		// Stand-MG niedrig,10000
	["OPT_O_HMG_01_high_F"],							// Stand-MG hoch,10000
	["OPT_O_GMG_01_F"],						        	// Stand-GMG niedrig,15000
	["OPT_O_GMG_01_high_F"],							// Stand-GMG hoch,15000
	["OPT_O_static_AA_F"],						    	// Stand-AA,25000
	["OPT_O_static_AT_F"],						    	// Stand-AT,200000
	["OPT_O_Mortar_01_F"],						    	// MK6 Mörser,200000
	["B_Mortar_01_F"],						    	// MK6 - Mörser,200000
	["OPT_Land_Pod_Heli_Transport_04_fuel_F", [0, 5, 0.05], 0],			// Fuelcontainer,5000
	["OPT_Land_Pod_Heli_Transport_04_fuel_black_F", [0, 5, 0.05], 0],	// Fuelcontainer (schwarz),5000
	["OPT_Land_Pod_Heli_Transport_04_ammo_F", [0, 5, 0.05], 0],		    // Munitionscontainer,50000
	["OPT_Land_Pod_Heli_Transport_04_ammo_black_F", [0, 5, 0.05], 0],	// Munitionscontainer (Schwarz),50000
	["OPT_Land_Pod_Heli_Transport_04_repair_F", [0, 5, 0.05], 0],		// Reparaturcontainer,5000
	["OPT_Land_Pod_Heli_Transport_04_repair_black_F", [0, 5, 0.05], 0],	// Reparaturcontainer (schwarz),5000
	["OPT_Land_Pod_Heli_Transport_04_repair_radar_F", [0, 5, 0.05], 0],  // CSAT Radar Container
	["Land_Cargo10_grey_F"],					        // CSAT Radar Container NEU
	["OPT_FlexibleTank_01_sand_F"],				    	// Treibstoff-Fass
// AAF supplies
 	["OPT_I_supplyCrate_F"],			// Transportkiste (leer)
	["OPT_Box_EFA_Ammo_F"],         				    // Munitionskiste
	["OPT_Box_EAF_WpsSpecial_F"],         			    // Munition spezial kiste NEUE KISTE!
	["OPT_Box_EAF_Grenades_F"],     				    // granatenkiste
	["OPT_EAF_Sprengstoffkiste"],     				    // sprengstoffkiste NEUE KISTE!
	["OPT_EAF_Minenkiste"],     				    // Minenkiste NEUE KISTE!
	["OPT_Box_EAF_WpsSpecial_AT_L1"],   				    // AT Raketenkiste MAWSS NEUE KISTE!
	["OPT_Box_EAF_WpsSpecial_AT_L2"],   				    // AT Raketenkiste PPG 7 NEUE KISTE!
	["OPT_Box_EAF_WpsSpecial_AA_F"],				    // AA Raketenkiste
	["OPT_Box_EAF_WpsSpecial_Diver_F"],				    // Taucherkiste
	["OPT_I_HMG_01_F"],								                        // Stand-MG niedrig,10000
	["OPT_I_HMG_01_high_F"],							                    // Stand-MG hoch,10000
	["OPT_I_GMG_01_F"],								                        // Stand-GMG niedrig,15000
	["OPT_I_GMG_01_high_F"],						                        // Stand-GMG hoch,15000
	["OPT_I_static_AA_F"],							                        // Stand-AA,25000
	["OPT_I_static_AT_F"],							                        // Stand-AT,200000
	["OPT_I_Mortar_01_F"],							                        // MK6 Mörser,200000
	["I_Mortar_01_F"],						// MK6 - Mrser
	["OPT_FlexibleTank_01_forest_F"],					    // Treibstoff-Fass	
	["OPT_I_Static_Designator_01_F"]					    // Remote Designator
];