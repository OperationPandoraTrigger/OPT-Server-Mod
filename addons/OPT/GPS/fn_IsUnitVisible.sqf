/**
* Description:
* Test if unit is supposed to be visible on map
* 
* Author:
* Senshi
*
* Arguments:
* 0: <OBJECT> _unit Unit to check
*
* Return value:
* 0: <BOOL> If visible: true, else false
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
* _isVisible = [_unit] call FUNC(isUnitVisible);
*/

#include "macros.hpp";

params ["_unit"];

!isNull _unit 
&& {
	alive _unit // Only show alive
	&& side group _unit == side group CLib_Player // Only show same side
	&& simulationEnabled _unit
	// && isPlayer _unit
}