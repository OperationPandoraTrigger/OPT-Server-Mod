/**
* Author: [GNC]Lord-MDB
* Kontrolliet ob Berggang verfügbar ist.
*
* Arguments:
* 0: <OBJECT> Fahrzeug
* 1: <OBJECT> Einheit die den Bergang nutz
*
* Return Value:
* None
*
* Example:
* [vec, unit] call Func(berggangCheck);
*
*/
#include "macros.hpp"

params ["_target", "_caller"];

private _ret = false;
private _steigung = (100 - GVAR(Steigungfahrzeug)+1)/100;

private _cond =
(
    (speed _target < GVAR(Geschwindigkeitfahrzeug)) and
    (_target isKindOf 'landVehicle') and
    (alive _target) and
    (isengineon _target) and 
    (canMove _target) and
    ((driver _target) == player) and
    ((vectorUp _target) select 2 < _steigung) and
    (player in _target)
);

if (_cond) then
{
    _ret = true;
};

_ret
