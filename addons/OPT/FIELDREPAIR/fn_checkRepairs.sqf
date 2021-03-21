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

private _txt = format[MLOC(REPAIRS_LEFT), _veh getVariable QGVAR(repair_cargo), GVAR(DEFAULT_REPAIR_TRUCK_USES)];
private _header = MLOC(FIELD_REPAIR_HEADER);
hint Format ["%1 \n\n %2",_header,_txt];