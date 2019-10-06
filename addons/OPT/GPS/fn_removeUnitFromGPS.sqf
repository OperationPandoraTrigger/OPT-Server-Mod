/**
* Description:
* Removes a uniticon for a unit to be shown on mapControls
* 
* Author:
* Senshi
*
* Arguments:
* 0: <OBJECT/STRING> _unit     Unit to remove
*
* Return Value:
*
* Server Only:
* No
* 
* Global:
* No
* 
* API:
* No
* 
* Example:
* [player] call FUNC(removeUnitFromGPS);
* ["player"] call FUNC(removeUnitFromGPS);
*/

#include "macros.hpp"

params ["_unit"];

DUMP("UNIT ICON REMOVED");
DUMP(_unit);
DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
private _iconId = [_unit] call FUNC(getUnitIconID);
DUMP("ICON ID: " + _iconId);
[_iconID] call CFUNC(removeMapGraphicsGroup);
DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
