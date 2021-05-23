/**
* Description:
* Erhöht den Treibstoffverbrauch in abhängigkeit der Höhe
* 
* Author: Lord-MDB
* 
* Arguments:
* none
*
* Return Value:
* None
*
*
* Server only:
* no
*
* Global:
* no
* 
* Public:
* no
*
* Example:
* [Veh] call func(spritverbrauch);
*/
#include "macros.hpp"

params 
[
    ["_veh", objNull]
];

GVAR(Vehobjekt) = _veh;

private _vehcheck = [{

if (! alive GVAR(Vehobjekt)) then 
{

    _vehcheck call CFUNC(removePerframeHandler); 
};

}, 0] call CFUNC(addPerFrameHandler);

