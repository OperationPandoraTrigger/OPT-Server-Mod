/**
* Description:Magazine Auslesen vom Fahrzeug.
*
*
* Author:
* [GNC]Lord-MDB
*
* Arguments:
* 0 <Objekt> Fahrzeug das Ausgelesen wird
*
* Return value:
* 0 <Array> Gefilterte Fahrzeug Magazine
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
    ["_veh", objNull, [objNull], 1]
];

if (_veh isEqualTo objNull) exitWith{ERROR_LOG("auslesenMagazine: kein Fahrzeug übergeben");[]};

// Magazine feststellen
private _magazineVehArry = magazinesAmmo _veh;

//kontrolle Bewaffnung Auslesung
[
    ["96Rnd_CMFlare_Chaff_Magazine", 96],
    ["120Rnd_CMFlare_Chaff_Magazine", 120],
    ["240Rnd_CMFlare_Chaff_Magazine", 240],
    ["60Rnd_CMFlare_Chaff_Magazine", 60],
    ["192Rnd_CMFlare_Chaff_Magazine", 192],
    ["168Rnd_CMFlare_Chaff_Magazine", 168],
    ["300Rnd_CMFlare_Chaff_Magazine", 300],
    ["OPT_12Rnd_CMFlare_Chaff_Magazine", 12],
    ["OPT_20Rnd_CMFlare_Chaff_Magazine", 20],
    ["OPT_30Rnd_CMFlare_Chaff_Magazine", 30],
    ["OPT_72Rnd_CMFlare_Chaff_Magazine", 72],
    ["60Rnd_CMFlareMagazine", 60],
    ["120Rnd_CMFlareMagazine", 120],
    ["240Rnd_CMFlareMagazine", 240],
    ["SmokeLauncherMag", 2]
] apply
{
    _magazineVehArry deleteAt (_magazineVehArry find _x);
};

_magazineVehArry
