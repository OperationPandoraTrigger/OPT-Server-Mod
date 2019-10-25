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

params ["_arg"];

DUMP("UPDATE UNIT ICON");

// _arg might be a string (if called by remoteExec). As we need the actual object to attach the icon, we search for the unit if necessary.
private _unit = if (_arg isEqualType objNull) then { _arg} else {objectFromNetId _arg};
DUMP("UNIT OBJ " + str _unit);


// Check if unit is in a vehicle.
if (objectParent _unit == objNull) then {
	[_unit] call FUNC(removeUnitFromGPS);
	[_unit] call FUNC(addUnitToGPS);
} else {
	[objectParent _unit] call FUNC(removeUnitFromGPS);
	// [objectParent _unit] call FUNC(addVehicleToGPS);
}
