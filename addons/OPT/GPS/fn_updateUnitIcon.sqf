/**
* Description:
* Updates the icon for a unit. Effectively removes and re-adds it.
* 
* Author:
* Senshi
*
* Arguments:
* 0: <OBJECT/STRING> _unit     Unit
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
* [player] call FUNC(updateUnitIcon);
* [str player] call FUNC(updateUnitIcon);
*/

#include "macros.hpp";

params ["_unit"];

DUMP("UPDATE UNIT ICON");

// _unit might be a string (if called by remoteExec). As we need the actual object to attach the icon, we search for the unit if necessary.
private _unitObj = if (_unit isEqualType objNull) then { _unit} else {(allPlayers select {str _x == _unit}) select 0 };
DUMP(format ["UNIT OBJ %1", _unitObj]);

[_unitObj] call FUNC(removeUnitFromGPS);
[_unitObj] call FUNC(addUnitToGPS);
