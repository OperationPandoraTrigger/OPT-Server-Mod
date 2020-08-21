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
* yes
* 
* API:
* No
*
* Example:
* [] call FUNC(Init);
*/
#include "macros.hpp"

/* INITIALIZE GLOBAL VARS*/
GVAR(canTransportCargo) = []; // holds cargo definitions for all objects with cargo space
GVAR(canBeTransported)  = []; // holds all objects that can be transported
GVAR(canBeDragged) = []; // holds all objects that can be dragged
GVAR(canBeCarried) = []; // holds all objects that can be carried

[] call FUNC(setupCargoSpaceAndSize);

[] call FUNC(cbaclassevents);
