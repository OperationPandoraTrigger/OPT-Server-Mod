/**
* Description:
* Gets the uniticonid for a particular unit
* 
* Author:
* Senshi
*
* Arguments:
* 0: <OBJECT/STRING> 	_unit   Unit
*
* Return Value:
* 0: <String>					Unique Icon-ID
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
* _iconID = [player] call FUNC(getUnitIconID);
* _iconID = [str player] call FUNC(getUnitIconID);
*/

#include "macros.hpp";

params ["_unit"];

// _unit may be OBJECT or STRING (unit name)


DUMP("GET ICON ID");
DUMP(toLower format [QGVAR(IconId_Player_%1), netId _unit]);
toLower format [QGVAR(IconId_Player_%1), netId _unit];
