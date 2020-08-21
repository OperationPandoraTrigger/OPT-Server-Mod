/**
* Description:
* Init Server Hardcap Daten für Shop
* 
* Author:
* Lord-MDB
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
* [] call FUNC(serverInit);
*/

#include "macros.hpp"

//Nato Hardcap
// Heli / Fahrzeuge / Ausrüstung / See

GVAR(Hardcap_nato_choppers) = 
[

];

GVAR(Hardcap_nato_vehicles) = 
[

];

GVAR(Hardcap_nato_supplies) = 
[

];

GVAR(Hardcap_nato_sea) = 
[

];

//CSAT Hardcap
// Heli / Fahrzeuge / Ausrüstung / See

GVAR(Hardcap_csat_choppers) = 
[
	["OPT4_O_Heli_Light_02_F",4]
];

GVAR(Hardcap_csat_vehicles) = 
[
	["OPT4_O_LSV_02_AT_F",2],
	["OPT_O_MRAP_02_F",5],
	["OPT4_O_MRAP_02_hmg_F",5],	
	["OPT4_O_MBT_02_arty_F",1],
	["OPT4_O_APC_Tracked_02_AA_F",2],
	["OPT4_O_APC_Wheeled_02_rcws_F",4],
	["OPT4_O_APC_Tracked_02_cannon_F",4],
	["OPT4_O_MBT_02_cannon_F",1],
	["OPT4_O_MBT_04_cannon_F",1]
];

GVAR(Hardcap_csat_supplies) = 
[
	["OPT_O_Mortar_01_F",1],
	["OPT_CSAT_Minenkiste",1]
];

GVAR(Hardcap_csat_sea) = 
[

];

//AAF Hardcap
// Heli / Fahrzeuge / Ausrüstung / See 

GVAR(Hardcap_aaf_choppers) = 
[
	["OPT_I_Heli_light_03_F",4]
];

GVAR(Hardcap_aaf_vehicles) = 
[
	["OPT4_I_C_Offroad_02_AT_F",3],
	["OPT_I_MRAP_03_F",5],
	["OPT4_I_MRAP_03_hmg_F",5],	
	["OPT_I_Truck_02_MRL_F",1],
	["OPT4_I_LT_01_AA_F",3],
	["OPT4_I_LT_01_AT_F",2],
	["OPT4_I_APC_Wheeled_03_cannon_F",4],
	["OPT4_I_APC_tracked_03_cannon_F",4],
	["OPT4_I_MBT_03_cannon_F",2],
	["OPT_I_LT_01_cannon_F",parseNumber OPT_GELDZEIT_aaf_sonderausobjektanzahl]
];



GVAR(Hardcap_aaf_supplies) = 
[
	["OPT_I_Mortar_01_F",1],
	["OPT_EAF_Minenkiste",1]
];

GVAR(Hardcap_aaf_sea) = 
[

];

publicVariable QGVAR(Hardcap_nato_choppers);
publicVariable QGVAR(Hardcap_nato_vehicles);
publicVariable QGVAR(Hardcap_nato_supplies);
publicVariable QGVAR(Hardcap_nato_sea);

publicVariable QGVAR(Hardcap_csat_choppers);
publicVariable QGVAR(Hardcap_csat_vehicles);
publicVariable QGVAR(Hardcap_csat_supplies);
publicVariable QGVAR(Hardcap_csat_sea);

publicVariable QGVAR(Hardcap_aaf_choppers);
publicVariable QGVAR(Hardcap_aaf_vehicles);
publicVariable QGVAR(Hardcap_aaf_supplies);
publicVariable QGVAR(Hardcap_aaf_sea);


