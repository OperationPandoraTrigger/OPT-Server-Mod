#include "macros.hpp";


params ["_vehicle"];

if (isNull _vehicle) exitWith { false };

// Don't show destroyed
if (damage _vehicle == 1) exitWith { false };
// Only show manned
if (({alive _x} count crew _vehicle) == 0) exitWith { false };
// Only show manned by own side
if (side group (crew _vehicle) select 0 != side group CLibPlayer) exitWith { false};


true
