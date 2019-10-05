#include "macros.hpp";

params ["_unitname"];

DUMP("UPDATE UNIT ICON");
private _iconId = [_unitname] call FUNC(getUnitIconID);
private _unitObj = (allPlayers select {str _x == _unitname}) select 0;
DUMP(format["ICON ID %1", _iconId]);
DUMP(format ["UNIT OBJ %1", _unitObj]);

[_unitObj] call FUNC(removeUnitFromGPS);
[_unitObj, _iconId] call FUNC(addUnitToGPS);
