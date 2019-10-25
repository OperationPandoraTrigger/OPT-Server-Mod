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
* [str player] call FUNC(removeUnitFromGPS);
*/

#include "macros.hpp"

params ["_arg"];

DUMP("UNIT ICON REMOVED");
DUMP(_arg);

// _arg might be a string (if called by remoteExec). As we need the actual object to attach the icon, we search for the unit if necessary.
private _unit = if (_arg isEqualType objNull) then { _arg} else {objectFromNetId _arg};
DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
private _iconId = [_unit] call FUNC(getIconID);
DUMP("ICON ID: " + _iconId);
[_iconID] call CFUNC(removeMapGraphicsGroup);
DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
