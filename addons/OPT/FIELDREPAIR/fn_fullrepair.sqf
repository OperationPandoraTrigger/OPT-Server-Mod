/**
* Author: James
* fully repair a vehicle - no damage left
*
* Arguments:
* None
*
* Return Value:
* None 
*
* Example:
* [vehicle] call func(fullRepair);
*
*/
#include "macros.hpp"

params [["_veh", objNull]];

if (_veh isEqualTo objNull) exitWith {false};

_veh setDamage 0;
[_veh] call FUNC(setMinFuel); // Free 10% refuel, yay
_veh setVariable [QGVAR(longRepairTimes), 0 , true ]; // Reset free repairs
_veh setVariable [QGVAR(freeRefuelCount), 0 , true ]; // Reset reserve fuel

true

