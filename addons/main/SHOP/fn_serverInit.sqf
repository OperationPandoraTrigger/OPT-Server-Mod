/**
* Description:
* Init Server Hardcap Daten für Shop
*
* Author:
* form
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

// Gutschrift-System
GVAR(RECENT_ORDERS) = createHashMap;
publicVariable QGVAR(RECENT_ORDERS);

// Hardcap initialisieren
GVAR(hardcapmode) call FUNC(hardcapinit);
