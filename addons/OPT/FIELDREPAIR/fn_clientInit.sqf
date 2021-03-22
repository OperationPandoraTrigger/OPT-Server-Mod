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

    //pioniers
    GVAR(pioniers) = 
    [
        "OPT_NATO_Pionier_T",
        "OPT_CSAT_Pionier_T",
        "OPT_NATO_Pionier",
        "OPT_CSAT_Pionier",
        "O_soldier_repair_F",
        "I_Soldier_repair_F",
        "I_engineer_F",
        "O_engineer_F"
    ];
}] call CFUNC(addEventhandler);
