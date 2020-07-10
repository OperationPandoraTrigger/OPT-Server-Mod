/**
* Description:
* Einfrieren der Spieler beim Start
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
* [] call FUNC(frezztime);
*/
#include "macros.hpp"

DFUNC(Player_freeze_time) = 
{
	// gib Spieler frei
	player enableSimulation true;
};

// friere Spieler, falls freezeTime aktiv
if (!GVAR(Waffenruhestart)) then 
{

	// freeze Spieler zu Beginn
	player enableSimulation false;

	// warte OPT_PARAM_FREEZE_TIME
	[FUNC(Player_freeze_time), GVAR(FREEZETIME),""] call CLib_fnc_wait;

};




