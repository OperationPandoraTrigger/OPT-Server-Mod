/**
* Description:
* Test if unit is leader of a group
* 
* Author:
* Senshi
*
* Arguments:
* 0: <OBJECT> _unit Zu prüfende Unit
*
* Return value:
* 0: <BOOL> True, wenn Leader, sonst false
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
* _isLeader = [_unit] call FUNC(isUnitLeader);
*/

#include "macros.hpp";

params ["_unit"];

_unit == leader group _unit;