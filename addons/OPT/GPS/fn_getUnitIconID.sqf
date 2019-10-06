#include "macros.hpp";

params ["_unit"];

// _unit may be OBJECT or STRING (unit name)


DUMP("GET ICON ID");
DUMP(toLower format [QGVAR(IconId_Player_%1), _unit]);
toLower format [QGVAR(IconId_Player_%1), _unit];
