/**
* Description:
* Initialisierung Grenzlinie
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

	["nameOfGroup", [["POLYGON", [[100,100,0], [110,110,0], [90, 100,0]], [1,0,0,0.5]]]] call CFUNC(addMapGraphicsGroup);

}, []] call CFUNC(addEventHandler); 	