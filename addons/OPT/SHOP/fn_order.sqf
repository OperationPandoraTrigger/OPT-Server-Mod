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

params 
[
    ["_Datensatz", []], 
    ["_box", objNull],
    ["_moveInVeh", nil],
	["_unitCost", 0]
];

private _airRaktenmagazin = [];
private _airRaktenweapon = [];
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
_airRaktenweapon = _Datensatz select 1;
_airRaktenmagazin = _Datensatz select 2;
_airGunweapon = _Datensatz select 3;
_airGunmagazin = _Datensatz select 4;
_vehWeapon = _Datensatz select 5;
_vehMagazin = _Datensatz select 6;
_pylon = _Datensatz select 7;
_raketencontrol = _Datensatz select 8;
_zusatz = _Datensatz select 9;
_waffenkosten = _Datensatz select 10;

//Fahrzeug erstellen
private _heightOffset = 0.1;

private _veh = createVehicle [_class, (position _box), [], 0, "NONE"];
private _posi = getPosASL _box vectorAdd [0, 0, _heightOffset];
_veh setdir getdir _box;
_veh setPosASL _posi;

//check Box liegt im Wasser
if ((surfaceIsWater (position _box)) and (_veh isKindOf "Ship")) then 
{
    _veh setPos [(position _box select 0),(position _box select 1), 0.2]; 
};

_veh setDamage 0;

//Fahrzeug bewaffnen
if (((count _airRaktenmagazin) > 0) or 
    ((count _airGunmagazin) > 0) or 
    ((count _vehMagazin) > 0)) then 
{
    [_veh,
    _airRaktenweapon,
    _airRaktenmagazin,
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

_kosten = _unitCost + _waffenkosten;

[Name Player, playerSide, typeOf _veh, _kosten, "-"] call opt_common_fnc_updateBudget;

_kosten