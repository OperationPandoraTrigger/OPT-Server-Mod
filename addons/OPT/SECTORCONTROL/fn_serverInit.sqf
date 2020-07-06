/**
* Description:
* Initialisierung Flaggensystem Server
* 
* Author:
* Lord-MDB
*
* Arguments:
*
* Return Value:
*
* Server Only:
* Yes
* 
* Global:
* No
* 
* API:
* No
* 
* Example:
* [] call FUNC(serverInit);
*/

#include "macros.hpp"

["missionStarted", {

	// start flag setup (setting owner)
	[] call FUNC(setupFlag);

	// calculate first time the dominator (it's needed if assynchrone number of flags are defined)
    [sideUnknown, objNull] call FUNC(setFlagOwner);

}] call CFUNC(addEventhandler);