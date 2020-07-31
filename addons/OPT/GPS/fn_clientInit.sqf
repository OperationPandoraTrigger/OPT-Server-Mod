/**
* Description:
* Init GPS 
* 
* Author:
* [GNC]Lord-MDB
*
* Arguments:
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
* [] call FUNC(clientinit);
*/
#include "macros.hpp"

["missionStarted", {
 
[] call FUNC(gps);

[] call FUNC(gps_Unconscious);

}] call CFUNC(addEventhandler);
