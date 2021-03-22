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
    ace_maptools_mapGpsShow = false;    // disable GPS on map - can be reactivated by user via ace-menu
}] call CFUNC(addEventhandler);
