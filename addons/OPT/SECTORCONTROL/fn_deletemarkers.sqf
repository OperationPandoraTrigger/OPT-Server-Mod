/**
* Description:
* Deletes all flag pole position markers which were set by HL or PL during Waffenruhe.
* Is called via fnc_setupFlag.sqf on mission start.
*
* Author:
* Lord-MDB
*
* Arguments:
*
* Return Value:
*
* Server Only:
* no
* 
* Global:
* No
* 
* API:
* No
* 
* Example:
* remoteExecCall [QFUNC(deleteMarkers)];
*/
#include "macros.hpp"

allMapMarkers apply
{
	if (getMarkerType _x isEqualTo "selector_selectedMission") then
	{
		deleteMarkerLocal _x;
	};
};
