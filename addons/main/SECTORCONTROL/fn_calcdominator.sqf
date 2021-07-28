/**
* Author: James
* calculate current dominator according to the flags hold by this side
*
* Arguments:
* None
*
* Return Value:
* 0: <SIDE> side of dominator, sideUnknown if none
*
* Example:
* [] call (func)calcDominator;
*
*/
#include "macros.hpp"

private _nato_owner = 0;
private _csat_owner = 0;
{
    if (_x getVariable ["owner", sideUnknown] isEqualTo west) then { _nato_owner = _nato_owner + 1; };
    if (_x getVariable ["owner", sideUnknown] isEqualTo east) then { _csat_owner = _csat_owner + 1; };
} forEach GVAR(nato_flags) + GVAR(csat_flags);

private _side = switch (true) do
{
    case (_nato_owner > _csat_owner) : {west};
    case (_nato_owner < _csat_owner) : {east};
    case (_nato_owner == _csat_owner) : {sideUnknown};
};

_side
