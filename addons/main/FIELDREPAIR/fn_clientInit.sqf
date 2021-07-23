/**
* Description:
* Initialisierung Reperatursystem
*
* Author:
* Lord-MDB
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* No
*
* Public:
* No
* 
* Global:
* No
*
* API:
* No
*
* Example:
* [] call FUNC(clientInit);
*/
#include "macros.hpp"

["missionStarted",
{
    GVAR(mutexAction) = false;
}] call CFUNC(addEventhandler);
