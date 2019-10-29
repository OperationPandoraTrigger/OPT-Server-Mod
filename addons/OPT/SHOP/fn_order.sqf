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
    ["_Datensatz", []], 
    ["_box", objNull],
    ["_moveInVeh", nil]
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
private _kosten = 0;
private _weaponold = [];
private _magazinold = [];

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
_kosten = _Datensatz select 10;

//Fahrzeug erstellen
private _veh = createVehicle [_class, (position _box), [], 0, "NONE"];
_veh setdir getdir _box;

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

systemChat format ["order:D:%1 B:%2 M:%3",_Datensatz,_box,_moveInVeh];

