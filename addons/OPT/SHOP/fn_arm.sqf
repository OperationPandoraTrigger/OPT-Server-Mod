/**
* Description:Fahrzeuge bewaffnen aus Datensatz.
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

params 
[
    ["_veh", objNull],
    ["_airRaktenweaponNew", []],
    ["_airRaktenmagazinNew", []],
    ["_airGunweaponNew", []],
    ["_airGunmagazinNew", []],
    ["_vehWeaponNew", []],
    ["_vehMagazinNew", []],
    ["_pylon", []],
    ["_raketencontrol", []],
    ["_zusatz", []],
    ["_weaponold", []],
    ["_magazinold", []]
];

systemChat format ["arm: VW:%1 VM:%2",_vehWeaponNew ,_vehMagazinNew];

//Datalink ausrüsten
if ((_zusatz select 2) == 1) then 
{
    _veh setVehicleReportOwnPosition true;
    _veh setVehicleReportRemoteTargets true;
    _veh setVehicleReceiveRemoteTargets true;                                              
};   

//Dahtkäfig ausrüsten
if ((_zusatz select 0) == 1) then 
{
    _veh animateSource ["showSLATHull", 1];
    _veh animateSource ["showSLATTurret", 1];
};

//Tranung ausrüsten
if ((_zusatz select 1) == 1) then 
{
    _veh animateSource ["showCamonetPlates1", 1];
    _veh animateSource ["showCamonetPlates2", 1];
    _veh animateSource ["showCamonetHull", 1];
    _veh animateSource ["showCamonetCannon", 1];
    _veh animateSource ["showCamonetTurret", 1];
};   
 
//Fahrzeug entwaffnen wenn Fahrzeug bewaffnet war
if ((count _weaponold) > 0) then 
{
    {_veh removeWeapon _x} forEach _weaponold;    
    {_veh removeMagazine _x} forEach _magazinold;    

    _pylon apply 
    {
        _veh setPylonLoadOut [_x, ""];     
    };    
 };

//Fahrzeug bewaffnen
if (_veh isKindOf "Air") then  
{    
    //Hauptgeschütz
    if ((count _airGunmagazinNew) > 0) then 
	{    
        if ((_veh isKindOf "OPT_B_Heli_Attack_01_F_un") or (_veh isKindOf "OPT_O_Heli_Attack_02_F_un")) then 
		{
            {
                _veh addMagazineTurret [_x, [0]]                    
            } forEach _airGunmagazinNew;

            {
                _veh addWeaponTurret [_x, [0]]
            } forEach _airGunweaponNew;         
                                       
        } 
		else 
		{    
            {
                _veh addMagazine [_x, 9999];
            } forEach _airGunmagazinNew;

            {
                _veh addWeapon _x
            } forEach _airGunweaponNew;    
        };
    };    

    //Raketen
    if ((count _airRaktenmagazinNew) > 0) then 
	{
        for "_i" from 1 to (count _airRaktenmagazinNew) do 
		{
            if ((_veh isKindOf "OPT_B_Heli_Attack_01_F_un") or (_veh isKindOf "OPT_O_Heli_Attack_02_F_un")) then 
			{
                if (_raketencontrol select (_i - 1) == 0) then 
				{                            
                    _veh setPylonLoadOut [_pylon select (_i - 1), _airRaktenmagazinNew select (_i - 1), true, [0]];                                 
                } 
				else 
				{
                     _veh setPylonLoadOut [_pylon select (_i - 1), _airRaktenmagazinNew select (_i - 1)];     
                };

            } 
			else 
			{    
                _veh setPylonLoadOut [_pylon select (_i - 1), _airRaktenmagazinNew select (_i - 1)];     
            };
        };    
    };
} 
else  
{
    // Fahrzeug Geschütze
    if ((count _vehMagazinNew) > 0) then 
	{                
        {
            _veh addMagazine [_x, 9999];
        } forEach _vehMagazinNew;

        {
            _veh addWeapon _x;
        } forEach _vehWeaponNew;
    };
};

 
    
  
