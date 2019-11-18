/**
* Description:Kauf ausführen und Fahrzeug erstellen.
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


if (_class in (GVAR(vehClassWestWW) + GVAR(vehClassEastWW))) then 
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
			_loadouts = GVAR(irifHMGLoadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_MRAP_02_gmg_F": 
		{
            _boxArry = GVAR(irifGMG);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(irifGMGLoadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT_O_T_LSV_02_armed_F": 
		{
            _boxArry = GVAR(quilinHMG);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(quilinHMGLoadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_LSV_02_AT_F": 
		{
            _boxArry = GVAR(quilinAT);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(quilinATLoadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_APC_Wheeled_02_rcws_F": 
		{
            _boxArry = GVAR(marid);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(maridLoadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_APC_Wheeled_03_cannon_F": 
		{
            _boxArry = GVAR(gorgon);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(gorgonLoadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_APC_Tracked_02_cannon_F": 
		{
            _boxArry = GVAR(kamysh);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(kamyshLoadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_APC_Tracked_02_AA_F": 
		{
            _boxArry = GVAR(tigris);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(tigrisLoadout);
            _gunVehArry = GVAR(gunVehEast);
        };    
        case "OPT4_O_MBT_02_cannon_F": 
		{
            _boxArry = GVAR(varsuk);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(varsukLoadout);
            _gunVehArry = GVAR(gunVehEast);
        };
        case "OPT4_O_MBT_02_arty_F": 
		{
            _boxArry = GVAR(sochor);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(sochorLoadout);
            _gunVehArry = GVAR(gunVehEast);
        }; 
        case "OPT4_O_T_MBT_02_arty_ghex_F": 
		{
            _boxArry = GVAR(sochor);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(sochorLoadout);
            _gunVehArry = GVAR(gunVehEast);
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

systemChat format ["Load:%1",_auswertungLoadout];

_auswertungLoadout

