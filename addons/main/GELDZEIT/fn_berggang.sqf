/**
* Author: [GNC]Lord-MDB
* Bergang Fahrzeugen
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call Func(berggang);
*
*/
#include "macros.hpp"

params [["_veh", objNull]];

GVAR(BergangFahrzeug) = _veh;

[{

    params ["_args", "_handle"];

    private _steigung = (100 - GVAR(Steigungfahrzeug)+1)/100;
    private _veh = GVAR(BergangFahrzeug);

    if ((speed _veh < GVAR(Geschwindigkeitfahrzeug)) and
       (_veh isKindOf 'landVehicle') and
       (alive _veh) and
       (isengineon _veh) and 
       (canMove _veh) and
       ((driver _veh) == player) and
       ((vectorUp _veh) select 2 < _steigung) and
       (player in _veh)) then
    {

        _vel = velocity _veh;
        _dir = direction _veh;
        _speed = GVAR(BerggangGeschwindigkeitfahrzeug);

        _veh setVelocity [(_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed),(_vel select 2)];
    };

    //PFH Löschung
    if (! alive _veh or (speed _veh > 20))  then
    {
        _handle call CFUNC(removePerframeHandler);
    };

}, 0.1, _this] call CFUNC(addPerFrameHandler);
