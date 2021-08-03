/**
* Author: James
* check if vehicle is flipped around
*
* Arguments:
* 0: <OBJECT> vehicle to check
* 1: <OBJECT> unit to give action to flip
*
* Return Value:
* None
*
* Example:
* [vec, unit] call Func(flipCheck);
*
*/
#include "macros.hpp"

params ["_target", "_caller"];

private _ret = false;
private _cond =
(
    (speed _target < 1) and
    ((_target distance _caller) < 10) and
    (_target isKindOf 'landVehicle') and
    (alive _target) and
    ((vectorUp _target) select 2 < 0.4) and
    !(player in _target)
);

if (_cond) then
{
    _ret = true;
};

_ret
