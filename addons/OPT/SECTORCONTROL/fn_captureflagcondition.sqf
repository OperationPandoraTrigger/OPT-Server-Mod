/**
* Author: James
* condition for addaction entry to capture the flag
*
* Arguments:
* 0: <OBJECT> flag
* 1: <OBJECT> unit 
*
* Return Value:
* 0: <BOOl> true - flag can be captured, false - otherwise
*
* Example:
* [flag, player] call FUNC(captureFlagcaptureflagcondition);
*
* Server only:
* no
*
* Public:
* yes
*/
#include "macros.hpp"

/* PARAMS */
params [
   ["_flag", objNull, [objNull], 1],
   ["_unit", objNull, [objNull], 1]
];

if (_flag isEqualTo objNull or _unit isEqualTo objNull) exitWith{false};

// Flagge kann nur nach Missionsstart, in 5 m Radius, 
// ausserhalb eines Fahrzeugs 
// in Restspielzeit gezogen werden 
// nur von der anderen Seite

vehicle _unit == _unit and
OPT_GELDZEIT_Spielzeitstart and
(_flag distance player) <= GVAR(flagDistanceToPlayer) and
OPT_GELDZEIT_PLAYTIME - (serverTime - OPT_GELDZEIT_startTime) > 0 and
(side _unit != _flag getVariable ['owner', sideUnknown])