/**
* Description:Magazine Auslesen vom Fahrzeug.
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
    ["_veh", objNull, [objNull], 1]
];

if (_veh isEqualTo objNull) exitWith{[]};

// Magazine feststellen
private _magazineVehArry = magazinesAmmo _veh;

//kontrolle Bewaffnung Auslesung
private _magazineFilter2 = 
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
    ["OPT_30Rnd_CMFlare_Chaff_Magazine", 30]
];

{
    _magazineVehArry deleteAt (_magazineVehArry find _x);                
} forEach _magazineFilter2;


_magazineVehArry