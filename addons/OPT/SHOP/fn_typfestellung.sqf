/**
* Description:Datenübergabe nach Typauswähl.
* 
* 
* Author:
* [GNC]Lord-MDB
*
* Arguments:
*
* Return value:
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

if (GVAR(vehType) in (GVAR(vehclasswestWW) + GVAR(vehclasseastWW) + GVAR(vehClassindependentWW))) then 
{
    switch (GVAR(vehType)) do 
	{
        // WEST
        case "OPT4_B_Heli_Light_01_armed_F": 
		{
            GVAR(boxArry) = GVAR(Pawnee);
            GVAR(side) = west;
            GVAR(pylon) = ["pylonleft1", "pylonright1"];
        };
        case "OPT4_B_Heli_light_03_green_F": 
		{
            GVAR(boxArry) = GVAR(hellcat1);
            GVAR(side) = west;
            GVAR(pylon) = ["pylonleft1", "pylonright1"];
        }; 
        case "OPT4_B_Heli_Attack_01_F": 
		{
            GVAR(boxArry) = GVAR(Blackfoot);
            GVAR(side) = west;
            GVAR(pylon) = ["pylonleft1","pylonleft3","pylonright1","pylonright3"];
        };
        case "OPT4_B_MRAP_01_hmg_F": 
		{
            GVAR(boxArry) = GVAR(HunterHMG);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };
        case "OPT4_B_MRAP_01_gmg_F": 
		{
            GVAR(boxArry) = GVAR(HunterGMG);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };
        case "OPT4_B_MRAP_03_gmg_F": 
		{
            GVAR(boxArry) = GVAR(StriderGMG);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };
        case "OPT_B_T_LSV_01_armed_F": 
		{
            GVAR(boxArry) = GVAR(ProwlerHMG);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };
        case "OPT4_B_LSV_01_AT_F": 
		{
            GVAR(boxArry) = GVAR(ProwlerAT);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };
        case "OPT4_B_APC_Tracked_01_rcws_F": 
		{
            GVAR(boxArry) = GVAR(Panther);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };
        case "OPT4_B_APC_Wheeled_01_cannon_F": 
		{
            GVAR(boxArry) = GVAR(Marshall);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };
        case "OPT4_B_APC_tracked_03_cannon_F": 
		{
            GVAR(boxArry) = GVAR(Mora);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };
        case "OPT4_B_APC_Tracked_01_AA_F": 
		{
            GVAR(boxArry) = GVAR(Cheetah);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };
        case "OPT4_B_MBT_01_TUSK_F": 
		{
            GVAR(boxArry) = GVAR(SlammerUp);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };    
        case "OPT4_B_MBT_01_arty_F": 
		{
            GVAR(boxArry) = GVAR(Scorcher);
            GVAR(side) = west;
            GVAR(pylon) = [];
        }; 
		case "OPT4_B_MRAP_01_hmg_ghex_F": 
		{
            GVAR(boxArry) = GVAR(HunterHMG);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };
        case "OPT4_B_MRAP_01_gmg_ghex_F": 
		{
            GVAR(boxArry) = GVAR(HunterGMG);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };
        case "OPT4_B_MRAP_03_gmg_ghex_F": 
		{
            GVAR(boxArry) = GVAR(StriderGMG);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };
        case "OPT_B_T_LSV_01_armed_ghex_F": 
		{
            GVAR(boxArry) = GVAR(ProwlerHMG);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };
        case "OPT4_B_LSV_01_AT_ghex_F": 
		{
            GVAR(boxArry) = GVAR(ProwlerAT);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };
        case "OPT4_B_APC_Tracked_01_rcws_ghex_F": 
		{
            GVAR(boxArry) = GVAR(Panther);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };
        case "OPT4_B_APC_Wheeled_01_cannon_ghex_F": 
		{
            GVAR(boxArry) = GVAR(Marshall);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };
        case "OPT4_B_APC_tracked_03_cannon_ghex_F": 
		{
            GVAR(boxArry) = GVAR(Mora);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };
        case "OPT4_B_APC_Tracked_01_AA_ghex_F": 
		{
            GVAR(boxArry) = GVAR(Cheetah);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };
        case "OPT4_B_MBT_01_TUSK_ghex_F": 
		{
            GVAR(boxArry) = GVAR(SlammerUp);
            GVAR(side) = west;
            GVAR(pylon) = [];
        };    
        case "OPT4_B_MBT_01_arty_ghex_F": 
		{
            GVAR(boxArry) = GVAR(Scorcher);
            GVAR(side) = west;
            GVAR(pylon) = [];
        }; 
        
        // EAST
        case "OPT4_O_Heli_Light_02_F": 
		{
            GVAR(boxArry) = GVAR(Orca);
            GVAR(side) = east;
            GVAR(pylon) = ["pylonleft1", "pylonright1"];
        };
        case "OPT4_O_Heli_Attack_02_F": 
		{
            GVAR(boxArry) = GVAR(Kajman);
            GVAR(side) = east;
            GVAR(pylon) = ["pylonleft1","pylonleft2","pylonright1","pylonright2"];
        };  
        case "OPT4_O_Heli_light_03_green_F": 
		{
            GVAR(boxArry) = GVAR(hellcat);
            GVAR(side) = east;
            GVAR(pylon) = ["pylonleft1","pylonright1"];
        }; 			
        case "OPT4_O_MRAP_02_hmg_F": 
		{
            GVAR(boxArry) = GVAR(irifHMG);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };
        case "OPT4_O_MRAP_02_gmg_F": 
		{
            GVAR(boxArry) = GVAR(irifGMG);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };
        case "OPT_O_T_LSV_02_armed_F": 
		{
            GVAR(boxArry) = GVAR(QuilinHMG);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };
        case "OPT4_O_LSV_02_AT_F": 
		{
            GVAR(boxArry) = GVAR(QuilinAT);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };
        case "OPT4_O_APC_Wheeled_02_rcws_F": 
		{
            GVAR(boxArry) = GVAR(Marid);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };
        case "OPT4_O_APC_Wheeled_03_cannon_F": 
		{
            GVAR(boxArry) = GVAR(Gorgon);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };
        case "OPT4_O_APC_Tracked_02_cannon_F": 
		{
            GVAR(boxArry) = GVAR(Kamysh);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };
        case "OPT4_O_APC_Tracked_02_AA_F": 
		{
            GVAR(boxArry) = GVAR(Tigris);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };    
        case "OPT4_O_MBT_02_cannon_F": 
		{
            GVAR(boxArry) = GVAR(Varsuk);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };
        case "OPT4_O_MBT_04_cannon_F": 
		{
            GVAR(boxArry) = GVAR(Angara);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };
        case "OPT4_O_MBT_02_arty_F": 
		{
            GVAR(boxArry) = GVAR(Sochor);
            GVAR(side) = east;
            GVAR(pylon) = [];
        }; 
		case "OPT4_O_T_MRAP_02_hmg_ghex_F": 
		{
            GVAR(boxArry) = GVAR(irifHMG);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };
        case "OPT4_O_T_MRAP_02_gmg_ghex_F": 
		{
            GVAR(boxArry) = GVAR(irifGMG);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };
        case "OPT_O_T_LSV_02_armed_ghex_F": 
		{
            GVAR(boxArry) = GVAR(QuilinHMG);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };
        case "OPT4_O_LSV_02_AT_GHEX_F": 
		{
            GVAR(boxArry) = GVAR(QuilinAT);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };
        case "OPT4_O_T_APC_Wheeled_02_rcws_ghex_F": 
		{
            GVAR(boxArry) = GVAR(Marid);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };
        case "OPT4_O_APC_Wheeled_03_cannon_ghex_F": 
		{
            GVAR(boxArry) = GVAR(Gorgon);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };
        case "OPT4_O_T_APC_Tracked_02_cannon_ghex_F": 
		{
            GVAR(boxArry) = GVAR(Kamysh);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };
        case "OPT4_O_T_APC_Tracked_02_AA_ghex_F": 
		{
            GVAR(boxArry) = GVAR(Tigris);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };    
        case "OPT4_O_T_MBT_02_cannon_ghex_F": 
		{
            GVAR(boxArry) = GVAR(Varsuk);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };		
        case "OPT4_O_T_MBT_02_arty_ghex_F": 
		{
            GVAR(boxArry) = GVAR(Sochor);
            GVAR(side) = east;
            GVAR(pylon) = [];
        };
        //AAF
        case "OPT_I_Heli_light_03_F": 
		{
            GVAR(boxArry) = GVAR(hellcat2);
            GVAR(side) = independent;
            GVAR(pylon) = ["pylonleft1", "pylonright1"];
        };		
        case "OPT4_I_MRAP_03_hmg_F": 
		{
            GVAR(boxArry) = GVAR(striderHMG2);
            GVAR(side) = independent;
            GVAR(pylon) = [];
        };
        case "OPT4_I_MRAP_03_gmg_F": 
		{
            GVAR(boxArry) = GVAR(striderGMG2);
            GVAR(side) = independent;
            GVAR(pylon) = [];
        };
        case "OPT4_I_C_Offroad_02_AT_F": 
		{
            GVAR(boxArry) = GVAR(MB4WDAT);
            GVAR(side) = independent;
            GVAR(pylon) = [];
        };
        case "OPT4_I_APC_tracked_03_cannon_F": 
		{
            GVAR(boxArry) = GVAR(mora2);
            GVAR(side) = independent;
            GVAR(pylon) = [];
        };
        case "OPT4_I_APC_Wheeled_03_cannon_F": 
		{
            GVAR(boxArry) = GVAR(gorgon2);
            GVAR(side) = independent;
            GVAR(pylon) = [];
        };
        case "OPT4_I_LT_01_AT_F": 
		{
            GVAR(boxArry) = GVAR(NyxAT);
            GVAR(side) = independent;
            GVAR(pylon) = [];
        };
        case "OPT4_I_LT_01_AA_F": 
		{
            GVAR(boxArry) = GVAR(NyxAA);
            GVAR(side) = independent;
            GVAR(pylon) = [];
        };
        case "OPT4_I_MBT_03_cannon_F": 
		{
            GVAR(boxArry) = GVAR(Kuma);
            GVAR(side) = independent;
            GVAR(pylon) = [];
        };          
        default 
		{
            GVAR(boxArry) = [];
            GVAR(side) = civilian;
			GVAR(pylon) = [];
        };
    };
};

