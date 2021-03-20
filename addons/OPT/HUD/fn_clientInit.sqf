/**
* Description:
* Initialisierung HUD System 
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

["missionStarted", {
	(["OPT_HUD"] call BIS_fnc_rscLayer) cutRsc ["opt_hud_DefaultMenu", "PLAIN", 1];
	[] call FUNC(updateHUD);
}] call CFUNC(addEventhandler);
