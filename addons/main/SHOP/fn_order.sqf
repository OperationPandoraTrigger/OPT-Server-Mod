/**
* Description:Kaufanfrage an Server Senden.
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

GVAR(order_Datensatz) = _Datensatz;
GVAR(order_box) = _box;
GVAR(order_moveInVeh) = _moveInVeh;
GVAR(order_unitCost) = _unitCost;

private _classSend = GVAR(order_Datensatz) select 0;
private _waffenkosten = GVAR(order_Datensatz) select 10;

private _order_kosten = GVAR(order_unitCost) + _waffenkosten;

//Hardcap Check
[clientOwner,_classSend,GVAR(vehicleType),playerside] remoteExecCall [QFUNC(hardcap_check), 2, false];

_order_kosten
