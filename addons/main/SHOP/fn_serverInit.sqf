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
GVAR(Hardcap_nato_choppers) = [];
publicVariable QGVAR(Hardcap_nato_choppers);

GVAR(Hardcap_nato_planes) = [];
publicVariable QGVAR(Hardcap_nato_planes);

GVAR(Hardcap_nato_vehicles) = [];
publicVariable QGVAR(Hardcap_nato_vehicles);

GVAR(Hardcap_nato_supplies) = [];
publicVariable QGVAR(Hardcap_nato_supplies);

GVAR(Hardcap_nato_sea) = [];
publicVariable QGVAR(Hardcap_nato_sea);


//CSAT Hardcap
// Heli / Fahrzeuge / Ausrüstung / See
GVAR(Hardcap_csat_choppers) = [];
publicVariable QGVAR(Hardcap_csat_choppers);

GVAR(Hardcap_csat_planes) = [];
publicVariable QGVAR(Hardcap_csat_planes);

GVAR(Hardcap_csat_vehicles) = [];
publicVariable QGVAR(Hardcap_csat_vehicles);

GVAR(Hardcap_csat_supplies) = [];
publicVariable QGVAR(Hardcap_csat_supplies);

GVAR(Hardcap_csat_sea) = [];
publicVariable QGVAR(Hardcap_csat_sea);


//AAF Hardcap
// Heli / Fahrzeuge / Ausrüstung / See 
GVAR(Hardcap_aaf_choppers) = [];
publicVariable QGVAR(Hardcap_aaf_choppers);

GVAR(Hardcap_aaf_planes) = [];
publicVariable QGVAR(Hardcap_aaf_planes);

GVAR(Hardcap_aaf_vehicles) = [];
publicVariable QGVAR(Hardcap_aaf_vehicles);

GVAR(Hardcap_aaf_supplies) = [];
publicVariable QGVAR(Hardcap_aaf_supplies);

GVAR(Hardcap_aaf_sea) = [];
publicVariable QGVAR(Hardcap_aaf_sea);

switch (GVAR(hardcaplist)) do 
{
    case "0": 
    {
    };

    case "1": 
    {
        /* CSAT Planes */
        GVAR(Hardcap_csat_planes) pushBack ["OPT_CUP_C_Cessna_172_CIV_GREEN",3];
        GVAR(Hardcap_csat_planes) pushBack ["OPT_CUP_O_AN2_TK",3];
        GVAR(Hardcap_csat_planes) pushBack ["OPT_CUP_O_C47_SLA",3];
        GVAR(Hardcap_csat_planes) pushBack ["OPT_CUP_O_C130J_TKA",3];

        /* CSAT Choppers */
        GVAR(Hardcap_csat_choppers) pushBack ["OPT_CUP_O_Ka60_Grey_RU",5];
        GVAR(Hardcap_csat_choppers) pushBack ["OPT_CUP_O_Mi24_V_Dynamic_RU",2];

        /* CSAT Vehicles */
        GVAR(Hardcap_csat_vehicles) pushBack ["OPT_CUP_O_GAZ_Vodnik_Unarmed_RU",6];
        GVAR(Hardcap_csat_vehicles) pushBack ["OPT_CUP_O_GAZ_Vodnik_PK_RU",5];
        GVAR(Hardcap_csat_vehicles) pushBack ["OPT_CUP_O_GAZ_Vodnik_MedEvac_RU",3];
        GVAR(Hardcap_csat_vehicles) pushBack ["OPT_CUP_O_BTR60_RU",3];
        GVAR(Hardcap_csat_vehicles) pushBack ["OPT_CUP_O_BTR90_RU",2];
        GVAR(Hardcap_csat_vehicles) pushBack ["OPT_CUP_O_LR_AA_TKA",3];
        GVAR(Hardcap_csat_vehicles) pushBack ["OPT_CUP_O_ZSU23_Afghan_SLA",2];
        GVAR(Hardcap_csat_vehicles) pushBack ["OPT_CUP_O_T72_RU",3];
        GVAR(Hardcap_csat_vehicles) pushBack ["OPT_CUP_O_T90_RU",2];
        GVAR(Hardcap_csat_vehicles) pushBack ["OPT_CUP_O_BM21_RU",3];

        /* CSAT Supplies */
        GVAR(Hardcap_csat_supplies) pushBack ["CUP_O_2b14_82mm_RU",2];
        GVAR(Hardcap_csat_supplies) pushBack ["OPT_CUP_O_D30_RU",1];
        GVAR(Hardcap_csat_supplies) pushBack ["CUP_O_SearchLight_static_RU",3];
        GVAR(Hardcap_csat_supplies) pushBack ["CUP_O_Igla_AA_pod_RU",2];
        GVAR(Hardcap_csat_supplies) pushBack ["CUP_O_D30_AT_RU",3];
        GVAR(Hardcap_csat_supplies) pushBack ["CUP_O_Kornet_RU",2];

        /* NATO Planes */
        GVAR(Hardcap_nato_planes) pushBack ["OPT_CUP_C_Cessna_172_CIV_BLUE",3];
        GVAR(Hardcap_nato_planes) pushBack ["OPT_CUP_C_AN2_CIV",3];
        GVAR(Hardcap_nato_planes) pushBack ["OPT_CUP_C_DC3_ChernAvia_CIV",3];
        GVAR(Hardcap_nato_planes) pushBack ["OPT_CUP_B_C130J_USMC",3];

        /* NATO Choppers */
        GVAR(Hardcap_nato_choppers) pushBack ["OPT_CUP_B_UH1D_armed_GER_KSK",5];
        GVAR(Hardcap_nato_choppers) pushBack ["OPT_CUP_B_AH64D_DL_USA",2];

        /* NATO Vehicles */
        GVAR(Hardcap_nato_vehicles) pushBack ["OPT_CUP_B_HMMWV_Unarmed_USMC",6];
        GVAR(Hardcap_nato_vehicles) pushBack ["OPT_CUP_B_HMMWV_M2_USMC",5];
        GVAR(Hardcap_nato_vehicles) pushBack ["OPT_CUP_B_HMMWV_Ambulance_USMC",3];
        GVAR(Hardcap_nato_vehicles) pushBack ["OPT_CUP_B_LAV25_HQ_USMC",3];
        GVAR(Hardcap_nato_vehicles) pushBack ["OPT_CUP_B_M2Bradley_USA_W",2];
        GVAR(Hardcap_nato_vehicles) pushBack ["OPT_CUP_B_LR_AA_RACS",3];
        GVAR(Hardcap_nato_vehicles) pushBack ["OPT_CUP_B_M163_USA",2];
        GVAR(Hardcap_nato_vehicles) pushBack ["OPT_CUP_B_M60A3_TTS_USMC",3];
        GVAR(Hardcap_nato_vehicles) pushBack ["OPT_CUP_B_Leopard2A6_GER",2];
        GVAR(Hardcap_nato_vehicles) pushBack ["OPT_CUP_B_RM70_CZ",3];

        /* NATO Supplies */
        GVAR(Hardcap_nato_supplies) pushBack ["CUP_B_M252_USMC",2];
        GVAR(Hardcap_nato_supplies) pushBack ["OPT_CUP_B_M119_USMC",1];
        GVAR(Hardcap_nato_supplies) pushBack ["CUP_B_SearchLight_static_USMC",3];
        GVAR(Hardcap_nato_supplies) pushBack ["CUP_B_Stinger_AA_pod_Base_USMC",2];
        GVAR(Hardcap_nato_supplies) pushBack ["OPT_CUP_B_M119_AT_USMC",3];
        GVAR(Hardcap_nato_supplies) pushBack ["CUP_B_TOW2_TriPod_USMC",2];
    };
    
    default 
    {
    };
};
