/**
* Description:
* Test if unit is leader of a group
* 
* Author:
* Senshi
*
* Arguments:
* 0: <OBJECT> _unit     Unit to test
*
* Return value:
* 0: <BOOL>             True if leader
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

(typeof _unit in [
    "OPT_NATO_Gruppenfuehrer", 
    "OPT_CSAT_Gruppenfuehrer",
    "OPT_NATO_Offizier",
    "OPT_CSAT_Offizier",
    "OPT_NATO_Pilot",
    "OPT_CSAT_Pilot"
]
|| roleDescription _unit in [
    "GF-Crew@Lowe"
] )
