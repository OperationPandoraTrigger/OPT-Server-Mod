/**
* Description:
* Gets the uniticonid for a particular unit
* 
* Author:
* Senshi
*
* Arguments:
* 0: <OBJECT> 	_unit   Unit
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
* _iconID = [player] call FUNC(getIconID);
*/

#include "macros.hpp";

params ["_unit"];

// _unit may be OBJECT (unit)


DUMP("GET ICON ID");
DUMP(toLower format [QGVAR(IconId_%1), netId _unit]);
toLower format [QGVAR(IconId_%1), netId _unit];
