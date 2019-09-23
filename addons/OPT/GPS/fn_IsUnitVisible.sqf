#include "macros.hpp";

params ["_unit"];

!isNull _unit && alive _unit && side group _unit == side group CLib_Player && simulationEnabled _unit
