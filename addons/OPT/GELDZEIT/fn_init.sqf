/**
* Description:
* Setzen Zeus für Spieler
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
* yes 
* 
* Global:
* yes
* 
* API:
* No
*
* Example:
* [] call FUNC(playerinit);
*/
#include "macros.hpp"

["missionStarted",
{
	//Zeus zur Verfügung stellen
	if (OPT_SECTORCONTROL_trainingon) then
	{ 
		[] call FUNC(zeus);

		Player addEventHandler ["Respawn",
		{
			[] call FUNC(zeus);
		}];	
	};	
}] call CFUNC(addEventhandler);
