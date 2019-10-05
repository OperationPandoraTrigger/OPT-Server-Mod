#include "macros.hpp";

params ["_unit"];


// if (_unit isEqualType objNull) then {
// 	DUMP(format ["%1 is of type %2", _unit, typeName _unit]);
// };
// ASSERT_IS_OBJECT(_unit);


DUMP("GET ICON ID");
DUMP(toLower format [QGVAR(IconId_Player_%1), _unit]);
toLower format [QGVAR(IconId_Player_%1), _unit];
