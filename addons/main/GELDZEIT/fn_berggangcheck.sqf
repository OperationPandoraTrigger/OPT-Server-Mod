/**
* Author: [GNC]Lord-MDB
* Kontrolliert ob Berggang verfügbar ist.
*
* Arguments:
* 0: <OBJECT> Fahrzeug
*
* Return Value:
* None
*
* Example:
* [vehicle] call FUNC(berggangCheck);
*
*/
#include "macros.hpp"

params ["_veh"];

// return condition
(speed _veh < GVAR(Mountain_MaxSpeed)) &&
(_veh isKindOf 'landVehicle') &&
(alive _veh) &&
(isengineon _veh) &&
(canMove _veh) &&
((driver _veh) == player) &&
((vectorUp _veh) select 2 < GVAR(Mountain_Slope)) &&
(player in _veh)
