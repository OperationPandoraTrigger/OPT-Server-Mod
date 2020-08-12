/**
* Author: Senshi
* Return how many repairs are left
*
* Arguments:
* 0: <OBJECT> vehicle
*
* Return Value:
* None
*
* Example:
* [vehicle] call func(checkRepairs);
*
*/

#include "macros.hpp"

params [["_veh", objNull]];

private _txt = format[STR_REPAIRS_LEFT, _veh getVariable QGVAR(repair_cargo), GVAR(DEFAULT_REPAIR_TRUCK_USES)];
private _header = parseText "<t size='2.0' color='#D7DF01'>STR_FIELDREPAIR</t>";
hint Format ["%1 \n\n %2",_header,_txt];