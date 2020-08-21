/**
* Description:Loadout laden für Standartausführung der Bewaffnung
* 
* 
* Author:
* [GNC]Lord-MDB
*
* Arguments:
* 0 <String> Classname des Fahrzeugs
*
* Return value:
* 0 <Array> Datensatz für Bewaffnung des Fahrzeugs
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

params [
    ["_class", ""]
];

private _boxArry = [];
private _side = civilian;
private _pylon = [];
private _loadouts = [];
private _loadoutarry = [];
private _raktenHeliArry = [];
private _gunHeliArry = [];
private _gunVehArry = [];
private _vehWeaponMagazinArry = [];
private _airRaktenWeaponMagazinArry = [];
private _airGunWeaponMagazinArry = [];
private _airRaktenmagazin = [];
private _airRaktenweapon = [];
private _airGunmagazin = [];
private _airGunweapon = [];
private _vehMagazin = [];
private _vehWeapon = [];
private _zusatz = [];
private _raketencontrol = [];
private _kosten = 0;
private _auswertungLoadout = [];


if (_class in (GVAR(vehClassWestWW) + GVAR(vehClassEastWW) + GVAR(vehClassindependentWW))) then 
{
    switch (_class) do 
	{
        // WEST
        case "OPT4_B_Heli_Light_01_armed_F": 
		{
            _boxArry = GVAR(pawnee);
            _side = west;
            _pylon = ["pylonleft1", "pylonright1"];
			_loadouts = GVAR(pawneeLoadout);
            _raktenHeliArry = GVAR(raktenHeliWest);
            _gunHeliArry = GVAR(gunHeliWest);

        };
        case "OPT4_B_Heli_light_03_green_F": 
		{
            _boxArry = GVAR(hellcat1);
            _side = west;
            _pylon = ["pylonleft1", "pylonright1"];
			_loadouts = GVAR(hellcat1Loadout);
            _raktenHeliArry = GVAR(raktenHeliWest);
            _gunHeliArry = GVAR(Gunheliwest);
        }; 
        case "OPT4_B_Heli_Attack_01_F": 
		{
            _boxArry = GVAR(blackfoot);
            _side = west;
            _pylon = ["pylonleft1","pylonleft3","pylonright1","pylonright3"];
			_loadouts = GVAR(blackfootLoadout);
            _raktenHeliArry = GVAR(raktenHeliWest);
            _gunHeliArry = GVAR(gunHeliWest);
        };
        case "OPT4_B_MRAP_01_hmg_F": 
		{
            _boxArry = GVAR(hunterHMG);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(hunterHMGLoadout);
            _gunVehArry = GVAR(gunVehWest);
        };
        case "OPT4_B_MRAP_01_gmg_F": 
		{
            _boxArry = GVAR(hunterGMG);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(hunterGMGLoadout);
            _gunVehArry = GVAR(gunVehWest);
        };
        case "OPT4_B_MRAP_03_gmg_F": 
		{
            _boxArry = GVAR(striderGMG);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(striderGMGLoadout);
            _gunVehArry = GVAR(gunVehWest);
        };
        case "OPT_B_T_LSV_01_armed_F": 
		{
            _boxArry = GVAR(prowlerHMG);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(prowlerHMGLoadout);
            _gunVehArry = GVAR(gunVehWest);
        };
        case "OPT4_B_LSV_01_AT_F": 
		{
            _boxArry = GVAR(prowlerAT);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(prowlerATLoadout);
            _gunVehArry = GVAR(gunVehWest);
        };
        case "OPT4_B_APC_Tracked_01_rcws_F": 
		{
            _boxArry = GVAR(panther);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(pantherLoadout);
            _gunVehArry = GVAR(gunVehWest);
        };
        case "OPT4_B_APC_Wheeled_01_cannon_F": 
		{
            _boxArry = GVAR(marshall);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(marshallLoadout);
            _gunVehArry = GVAR(gunVehWest);
        };
        case "OPT4_B_APC_tracked_03_cannon_F": 
		{
            _boxArry = GVAR(mora);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(moraLoadout);
            _gunVehArry = GVAR(gunVehWest);
        };
        case "OPT4_B_APC_Tracked_01_AA_F": 
		{
            _boxArry = GVAR(Cheetah);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(Cheetahloadout);
            _gunVehArry = GVAR(gunVehWest);
        };
        case "OPT4_B_MBT_01_TUSK_F": 
		{
            _boxArry = GVAR(slammerUp);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(slammerUpLoadout);
            _gunVehArry = GVAR(gunVehWest);
        };    
        case "OPT4_B_MBT_01_arty_F": 
		{
            _boxArry = GVAR(scorcher);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(scorcherLoadout);
            _gunVehArry = GVAR(gunVehWest);
        }; 
        
		case "OPT4_B_MRAP_01_hmg_ghex_F": 
		{
            _boxArry = GVAR(HunterHMG);
             _side = west;
             _pylon = [];
			_loadouts = GVAR(HunterHMGloadout);
            _gunVehArry = GVAR(gunVehWest);
        };
        case "OPT4_B_MRAP_01_gmg_ghex_F": 
		{
            _boxArry = GVAR(HunterGMG);
             _side = west;
             _pylon = [];
			_loadouts = GVAR(HunterGMGloadout);
            _gunVehArry = GVAR(gunVehWest);
        };
        case "OPT4_B_MRAP_03_gmg_ghex_F": 
		{
            _boxArry = GVAR(StriderGMG);
             _side = west;
             _pylon = [];
			_loadouts = GVAR(StriderGMGloadout);
            _gunVehArry = GVAR(gunVehWest);
        };
        case "OPT_B_T_LSV_01_armed_ghex_F": 
		{
            _boxArry = GVAR(ProwlerHMG);
             _side = west;
             _pylon = [];
			_loadouts = GVAR(ProwlerHMGloadout);
            _gunVehArry = GVAR(gunVehWest);
        };
        case "OPT4_B_LSV_01_AT_ghex_F": 
		{
            _boxArry = GVAR(ProwlerAT);
             _side = west;
             _pylon = [];
			_loadouts = GVAR(ProwlerATloadout);
            _gunVehArry = GVAR(gunVehWest);
        };
        case "OPT4_B_APC_Tracked_01_rcws_ghex_F": 
		{
            _boxArry = GVAR(Panther);
             _side = west;
             _pylon = [];
			_loadouts = GVAR(Pantherloadout);
            _gunVehArry = GVAR(gunVehWest);
        };
        case "OPT4_B_APC_Wheeled_01_cannon_ghex_F": 
		{
            _boxArry = GVAR(Marshall);
             _side = west;
             _pylon = [];
			_loadouts = GVAR(Marshallloadout);
            _gunVehArry = GVAR(gunVehWest);
        };
        case "OPT4_B_APC_tracked_03_cannon_ghex_F": 
		{
            _boxArry = GVAR(Mora);
             _side = west;
             _pylon = [];
			_loadouts = GVAR(Moraloadout);
            _gunVehArry = GVAR(gunVehWest);
        };
        case "OPT4_B_APC_Tracked_01_AA_ghex_F": 
		{
            _boxArry = GVAR(Cheetah);
             _side = west;
             _pylon = [];
			_loadouts = GVAR(Cheetahloadout);
            _gunVehArry = GVAR(gunVehWest);
        };
        case "OPT4_B_MBT_01_TUSK_ghex_F": 
		{
            _boxArry = GVAR(SlammerUp);
             _side = west;
             _pylon = [];
			_loadouts = GVAR(SlammerUploadout);
            _gunVehArry = GVAR(gunVehWest);
        };    
        case "OPT4_B_MBT_01_arty_ghex_F": 
		{
            _boxArry = GVAR(Scorcher);
             _side = west;
             _pylon = [];
			_loadouts = GVAR(Scorcherloadout);
            _gunVehArry = GVAR(gunVehWest);
        }; 
  
        // EAST
        case "OPT4_O_Heli_Light_02_F": 
		{
            _boxArry = GVAR(orca);
            _side = east;
            _pylon = ["pylonleft1", "pylonright1"];
			_loadouts = GVAR(orcaLoadout);
            _raktenHeliArry = GVAR(raktenHeliEast);
            _gunHeliArry = GVAR(gunHeliEast);
        };
        case "OPT4_O_Heli_Attack_02_F": 
		{
            _boxArry = GVAR(kajman);
            _side = east;
            _pylon = ["pylonleft1","pylonleft2","pylonright1","pylonright2"];
			_loadouts = GVAR(kajmanLoadout);
            _raktenHeliArry = GVAR(raktenHeliEast);
            _gunHeliArry = GVAR(gunHeliEast);
        };  
        case "OPT4_O_Heli_light_03_green_F": 
		{
            _boxArry = GVAR(hellcat);
            _side = east;
            _pylon = ["pylonleft1","pylonright1"];
			_loadouts = GVAR(hellcatLoadout);
            _raktenHeliArry = GVAR(raktenHeliEast);
            _gunHeliArry = GVAR(gunHeliEast);
        }; 			
        case "OPT4_O_MRAP_02_hmg_F": 
		{
            _boxArry = GVAR(irifHMG);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(irifHMGloadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_MRAP_02_gmg_F": 
		{
            _boxArry = GVAR(irifGMG);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(irifGMGloadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT_O_T_LSV_02_armed_F": 
		{
            _boxArry = GVAR(QuilinHMG);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(QuilinHMGloadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_LSV_02_AT_F": 
		{
            _boxArry = GVAR(QuilinAT);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(QuilinATloadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_APC_Wheeled_02_rcws_F": 
		{
            _boxArry = GVAR(Marid);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(Maridloadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_APC_Wheeled_03_cannon_F": 
		{
            _boxArry = GVAR(Gorgon);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(Gorgonloadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_APC_Tracked_02_cannon_F": 
		{
            _boxArry = GVAR(Kamysh);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(Kamyshloadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_APC_Tracked_02_AA_F": 
		{
            _boxArry = GVAR(Tigris);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(Tigrisloadout);
            _gunVehArry = GVAR(gunVehEast);
        };    
        case "OPT4_O_MBT_02_cannon_F": 
		{
            _boxArry = GVAR(Varsuk);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(Varsukloadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_MBT_04_cannon_F": 
		{
            _boxArry = GVAR(Angara);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(AngaraLoadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_MBT_02_arty_F": 
		{
            _boxArry = GVAR(Sochor);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(Sochorloadout);
            _gunVehArry = GVAR(gunVehEast);
        }; 
		case "OPT4_O_T_MRAP_02_hmg_ghex_F": 
		{
            _boxArry = GVAR(irifHMG);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(irifHMGloadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_T_MRAP_02_gmg_ghex_F": 
		{
            _boxArry = GVAR(irifGMG);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(irifGMGloadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT_O_T_LSV_02_armed_ghex_F": 
		{
            _boxArry = GVAR(QuilinHMG);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(QuilinHMGloadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_LSV_02_AT_GHEX_F": 
		{
            _boxArry = GVAR(QuilinAT);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(QuilinATloadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_T_APC_Wheeled_02_rcws_ghex_F": 
		{
            _boxArry = GVAR(Marid);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(Maridloadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_APC_Wheeled_03_cannon_ghex_F": 
		{
            _boxArry = GVAR(Gorgon);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(Gorgonloadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_T_APC_Tracked_02_cannon_ghex_F": 
		{
            _boxArry = GVAR(Kamysh);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(Kamyshloadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_T_APC_Tracked_02_AA_ghex_F": 
		{
            _boxArry = GVAR(Tigris);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(Tigrisloadout);
            _gunVehArry = GVAR(gunVehEast);
        };    
        case "OPT4_O_T_MBT_02_cannon_ghex_F": 
		{
            _boxArry = GVAR(Varsuk);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(Varsukloadout);
            _gunVehArry = GVAR(gunVehEast);
        };		
        case "OPT4_O_T_MBT_02_arty_ghex_F": 
		{
            _boxArry = GVAR(Sochor);
             _side = east;
             _pylon = [];
			_loadouts = GVAR(Sochorloadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        //AAF
        case "OPT_I_Heli_light_03_F": 
		{
            _boxArry = GVAR(hellcat2);
            _side = independent;
            _pylon = ["pylonleft1", "pylonright1"];
			_loadouts = GVAR(hellcat2Loadout);
            _raktenHeliArry = GVAR(raktenHeliindependent);
            _gunHeliArry = GVAR(gunHeliindependent);
        };		
        case "OPT4_I_MRAP_03_hmg_F": 
		{
            _boxArry = GVAR(striderHMG2);
             _side = independent;
             _pylon = [];
			_loadouts = GVAR(striderHMG2Loadout);
            _gunVehArry = GVAR(gunVehindependent);
        };
        case "OPT4_I_MRAP_03_gmg_F": 
		{
            _boxArry = GVAR(striderGMG2);
            _side = independent;
            _pylon = [];
			_loadouts = GVAR(striderGMG2Loadout);
            _gunVehArry = GVAR(gunVehindependent);
        };
        case "OPT4_I_C_Offroad_02_AT_F": 
		{
            _boxArry = GVAR(MB4WDAT);
            _side = independent;
            _pylon = [];
			_loadouts = GVAR(MB4WDATLoadout);
            _gunVehArry = GVAR(gunVehindependent);
        };
        case "OPT4_I_APC_tracked_03_cannon_F": 
		{
            _boxArry = GVAR(mora2);
            _side = independent;
            _pylon = [];
			_loadouts = GVAR(mora2Loadout);
            _gunVehArry = GVAR(gunVehindependent);
        };
        case "OPT4_I_APC_Wheeled_03_cannon_F": 
		{
            _boxArry = GVAR(gorgon2);
            _side = independent;
            _pylon = [];
			_loadouts = GVAR(gorgon2Loadout);
            _gunVehArry = GVAR(gunVehindependent);
        };
        case "OPT4_I_LT_01_AT_F": 
		{
            _boxArry = GVAR(NyxAT);
            _side = independent;
            _pylon = [];
			_loadouts = GVAR(NyxATLoadout);
            _gunVehArry = GVAR(gunVehindependent);
        };
        case "OPT4_I_LT_01_AA_F": 
		{
            _boxArry = GVAR(NyxAA);
            _side = independent;
            _pylon = [];
			_loadouts = GVAR(NyxAALoadout);
            _gunVehArry = GVAR(gunVehindependent);
        };
        case "OPT4_I_MBT_03_cannon_F": 
		{
            _boxArry = GVAR(Kuma);
            _side = independent;
            _pylon = [];
			_loadouts = GVAR(KumaLoadout);
            _gunVehArry = GVAR(gunVehindependent);
        };    
        default 
		{
            _boxArry = [];
            _side = civilian;
			_pylon = [];
			_loadouts = [];
        };
    };

    // Waffen über Loadoutsetting erfassen
    if (_class isKindOf "Air") then 
    {
        _loadoutarry = _loadouts select 0;

        _loadoutarry apply 
        {
            _airRaktenWeaponMagazinArry pushBack (_raktenHeliArry select _x);
        };

        _loadoutarry = _loadouts select 1;
        
        _loadoutarry apply 
        {
            _airGunWeaponMagazinArry pushBack (_gunHeliArry select _x);
        };       
    }
    else    
    {
        _loadoutarry = _loadouts select 1;

        _loadoutarry apply 
        {
            _vehWeaponMagazinArry pushBack (_gunVehArry select _x);
        };   
    };

    _loadoutarry = _loadouts select 2;
    _Zusatz append _loadoutarry;

    _loadoutarry = _loadouts select 3;
    _Zusatz append _loadoutarry;

    //Waffenarray/Magazinarray/kosten erstellen
    if (_class isKindOf "Air") then 
    {
        _airRaktenWeaponMagazinArry apply 
        {
            _airRaktenweapon pushBack (_x select 1);
            _airRaktenmagazin pushBack (_x select 0);
            _kosten = _kosten + (_x select 3);
            _raketencontrol pushBack (_x select 5);
        };

        _airGunWeaponMagazinArry apply 
        {
            _airGunweapon pushBack (_x select 1);
            _airGunmagazin pushBack (_x select 0);
            _kosten = _kosten + (_x select 3);
        };

    }
    else    
    {    
        _vehWeaponMagazinArry apply 
        {
            _vehWeapon pushBack (_x select 1);
            _vehMagazin pushBack (_x select 0);
            _kosten = _kosten + (_x select 3);
        };
    };    
};

_auswertungLoadout append [_class];
_auswertungLoadout pushBack _airRaktenweapon;
_auswertungLoadout pushBack _airRaktenmagazin;
_auswertungLoadout pushBack _airGunweapon;
_auswertungLoadout pushBack _airGunmagazin;
_auswertungLoadout pushBack _vehWeapon;
_auswertungLoadout pushBack _vehMagazin;
_auswertungLoadout pushBack _pylon;
_auswertungLoadout pushBack _raketencontrol;
_auswertungLoadout pushBack _Zusatz;
_auswertungLoadout append [_kosten];

_auswertungLoadout

