/**
* Description: Preis feststellung für Fahrzeug
* 
* 
* Author:
* [GNC]Lord-MDB
*
* Arguments:
* 0 <String> Classname des Fahrzeugs
*
* Return value:
* 0 <Number> Kosten des Fahrzeugs
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
    ["_class", "", [""], [1]]
];

if (_class isEqualTo "") exitWith {ERROR_LOG("getprice: Fehler bei _class");0};

private _unitCost = 0;
private _index = (GVAR(all) apply {toLower (_x select 0)}) find (toLower _class);

if (_index != -1) then 
{
    private _friendOrEnemy = 2; // default is own side
    if (
        ((GVAR(allNato) apply {toLower (_x select 0)} find (toLower _class) != -1) and PLAYER_SIDE == east) 
        or 
        ((GVAR(allCsat) apply {toLower (_x select 0)} find (toLower _class) != -1) and PLAYER_SIDE == west)
        ) 
    then 
    {
        _friendOrEnemy = 3;
    };

    _unitCost = (GVAR(all) select _index) select _friendOrEnemy;
    if (typeName _unitCost != "SCALAR") then 
    {
        _unitCost = 0;
        ERROR_LOG("getprice: Fehler bei Preisermittlung");
    };

};

_unitCost