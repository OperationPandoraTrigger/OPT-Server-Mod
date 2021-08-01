/**
* Description:
* Initialisierung CARGO System
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

#define OPT_CARGO_ACE_maxWeightCarry 30000
#define OPT_CARGO_ACE_maxWeightDrag  30000

["missionStarted",
{
    /* set maximal weight values */
    missionNamespace setVariable ["ACE_maxWeightCarry", OPT_CARGO_ACE_maxWeightCarry];
    missionNamespace setVariable ["ACE_maxWeightDrag", OPT_CARGO_ACE_maxWeightDrag];

    [] call FUNC(setupCargoSpaceAndSize);
    [] call FUNC(cbaclassevents);
}] call CFUNC(addEventhandler);
