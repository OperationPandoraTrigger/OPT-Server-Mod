/**
* Description:Kauf ausführen und Fahrzeug erstellen.
* 
* 
* Author:
* [GNC]Lord-MDB
*
* Arguments:
* 0 <Array> Datensatz mit Bewaffnung
* 1 <Objekt> Aufstellort des Fahrzeugs
* 2 <Bool> Spieler in Fahrzeug setzen
* 3 <Number> Fahrzeugkosten ohne Bewaffnung
*
* Return value:
* 0 <Number> Gesamtkosten des Fahrzeugs 
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
    ["_Datensatz", []], 
    ["_box", objNull],
    ["_moveInVeh", nil],
	["_unitCost", 0]
];

private _airRaketenmagazin = [];
private _airRaketenweapon = [];
private _airGunmagazin = [];
private _airGunweapon = [];
private _vehMagazin = [];
private _vehWeapon = [];
private _pylon = [];
private _raketencontrol = [];
private _zusatz = [];
private _waffenkosten = 0;
private _weaponold = [];
private _magazinold = [];
private _kosten = 0;

//Datensatz aufschüsseln
private _class = _Datensatz select 0;
_airRaketenweapon = _Datensatz select 1;
_airRaketenmagazin = _Datensatz select 2;
_airGunweapon = _Datensatz select 3;
_airGunmagazin = _Datensatz select 4;
_vehWeapon = _Datensatz select 5;
_vehMagazin = _Datensatz select 6;
_pylon = _Datensatz select 7;
_raketencontrol = _Datensatz select 8;
_zusatz = _Datensatz select 9;
_waffenkosten = _Datensatz select 10;

//Konstanten für Fahrzeugerstellung
#define HEIGHT_OFFSET_GROUND 0.1
#define HEIGHT_OFFSET_WATER 0.2

private _veh = createVehicle [_class, (position _box), [], 0, "NONE"];
private _posi = getPosASL _box vectorAdd [0, 0, HEIGHT_OFFSET_GROUND];
_veh setdir getdir _box;
_veh setPosASL _posi;

//check Box liegt im Wasser
if ((surfaceIsWater (position _box)) and (_veh isKindOf "Ship")) then 
{
    _veh setPos [(position _box select 0),(position _box select 1), HEIGHT_OFFSET_WATER]; 
};

_veh setDamage 0;

//Fahrzeug bewaffnen
if (((count _airRaketenmagazin) > 0) or 
    ((count _airGunmagazin) > 0) or 
    ((count _vehMagazin) > 0)) then 
{
    [_veh,
    _airRaketenweapon,
    _airRaketenmagazin,
    _airGunweapon,
    _airGunmagazin,
    _vehWeapon,
    _vehMagazin,
    _pylon,
    _raketencontrol,
    _zusatz,
    _weaponold,
    _magazinold] call FUNC(arm);
};    

// Spieler in Fahrzeug setzen
if (_moveInVeh) then 
{
    Player moveInDriver _veh;

};

// Erzeugt Crew für Drohnen
private _uavs = [
	"OPT_B_UGV_01_F",
	"OPT_B_UGV_01_rcws_F",
	"OPT_O_UGV_01_F",
	"OPT_O_UGV_01_rcws_F",
	"B_UCSV_01",
    "OPT_B_UAV_02_light_F",
    "OPT_B_UAV_02_CAS_F",
    "OPT_B_UAV_02_CAS_F",
	"OPT_B_UAV_02_F",
	"OPT_B_UAV_01_F",
	"OPT_O_UAV_01_F",
    "OPT_O_UAV_02_light_F",
    "OPT_O_UAV_02_CAS_F",
    "OPT_O_UAV_02_F",
	"OPT_B_Static_Designator_01_F",
	"OPT_O_Static_Designator_02_F",
    "OPT_I_Static_Designator_01_F",
    "OPT_B_UGV_01_ghex_F",
	"OPT_O_T_UGV_01_ghex_F",
    "OPT_I_UAV_02_light_F",
    "OPT_I_UGV_01_F"
	];

if (_class in (_uavs)) then 
{
	createVehicleCrew (_veh);
	_veh setSkill 1.0;
			
};

_kosten = _unitCost + _waffenkosten;

[Name Player, playerSide, typeOf _veh, _kosten, "-"] remoteExecCall ["OPT_GELDZEIT_fnc_updateBudget", 2, false];

_kosten