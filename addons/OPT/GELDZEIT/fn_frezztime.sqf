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

// Spieler in der Freezetime einfrieren
if (GVAR(GAMESTAGE) == GAMESTAGE_FREEZE) then 
{
    // Spieler zu Beginn einfrieren
    player enableSimulation false;
};
