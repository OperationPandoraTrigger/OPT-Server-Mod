/**
* Author: [GNC]Lord-MDB
* Bergang für Fahrzeuge
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call FUNC(berggang);
*
*/
#include "macros.hpp"

params [["_veh", objNull]];

GVAR(Mountain_Vehicle) = _veh;

[{
    params ["_args", "_handle"];
    private _veh = GVAR(Mountain_Vehicle);

    if ([_veh] call FUNC(berggangCheck)) then
    {
        _veh setVelocity (velocity _veh vectorAdd [sin direction _veh * GVAR(Mountain_Boost), cos direction _veh * GVAR(Mountain_Boost), 0]);
    };

    //PFH Löschung
    if (!alive _veh || speed _veh > 20 || !(player in _veh))  then
    {
        _handle call CFUNC(removePerframeHandler);
    };
}, 0.1, _this] call CFUNC(addPerFrameHandler);
