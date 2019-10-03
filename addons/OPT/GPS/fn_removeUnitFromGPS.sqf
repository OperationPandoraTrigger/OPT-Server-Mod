#include "macros.hpp"


params ["_unit"];

DUMP("UNIT ICON REMOVED");
DUMP("UNIT");
DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
private _iconId = toLower format [QGVAR(IconId_Player_%1_%2), _unit, "true"];
[_iconID] call CFUNC(removeMapGraphicsGroup);

private _iconId = toLower format [QGVAR(IconId_Player_%1_%2), _unit, "false"];
[_iconID] call CFUNC(removeMapGraphicsGroup);
DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
