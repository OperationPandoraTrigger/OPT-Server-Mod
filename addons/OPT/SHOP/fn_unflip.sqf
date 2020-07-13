/**
* Author: Lord-MDB
* Unflip von Fahrzeugen 
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call Func(unflip);
*
*/
#include "macros.hpp"

_veh = cursorTarget;

_veh setVectorUp [0,0,1];
_veh setPosATL [(getPosATL _veh) select 0, (getPosATL _veh) select 1, 0.3];