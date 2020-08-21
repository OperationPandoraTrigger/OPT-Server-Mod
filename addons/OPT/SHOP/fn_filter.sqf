/**
* Description:
* Funktion Waffen+Magazine Filtern
* 
* Author: 
* [GNC]Lord-MDB
*
* Arguments:
* 0 <OBJECT> Fahrzeug, dass ausgelesen werden soll
* 
* Return Value:
* 0 <ARRAY> _waffenMagazinArray 
* 
* Server only:
* no
*
* Public:
* no
* 
* Global:
* no
* 
* Sideeffects:
* no
* 
* Example:
*
*/

#include "macros.hpp"

params 
[
    ["_veh", objNull]
];

private _magazineVeh = magazines _veh;
private _weaponsVeh = weapons _veh;
private _magazineVehArrayNew  = [];
private _waffenMagazinArray  = [];

_weaponsVeh deleteAt (_weaponsVeh find "OPT_CMFlareLauncher");
_weaponsVeh deleteAt (_weaponsVeh find "OPT_CMFlareLauncher_Triples");
_weaponsVeh deleteAt (_weaponsVeh find "CMFlareLauncher");
_weaponsVeh deleteAt (_weaponsVeh find "CMFlareLauncher_Triples");
_weaponsVeh deleteAt (_weaponsVeh find "SmokeLauncher");
_weaponsVeh = _weaponsVeh select {_x != ""};

[
    "96Rnd_CMFlare_Chaff_Magazine",
    "120Rnd_CMFlare_Chaff_Magazine",
    "240Rnd_CMFlare_Chaff_Magazine",
    "60Rnd_CMFlare_Chaff_Magazine",
    "192Rnd_CMFlare_Chaff_Magazine",
    "168Rnd_CMFlare_Chaff_Magazine",
    "300Rnd_CMFlare_Chaff_Magazine",
    "OPT_12Rnd_CMFlare_Chaff_Magazine",
    "OPT_20Rnd_CMFlare_Chaff_Magazine",
    "OPT_30Rnd_CMFlare_Chaff_Magazine",
    "OPT_72Rnd_CMFlare_Chaff_Magazine",
    "60Rnd_CMFlareMagazine",
    "120Rnd_CMFlareMagazine",
    "240Rnd_CMFlareMagazine",
    "SmokeLauncherMag"
] apply
{
    _magazineVeh deleteAt (_magazineVeh find _x);                
};

_magazineVeh = _magazineVeh select {_x != ""};

_waffenMagazinArray =[_weaponsVeh,_magazineVeh];

_waffenMagazinArray