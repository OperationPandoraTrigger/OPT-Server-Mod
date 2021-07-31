/**
* Author: form
* log all player/clients that have connected since beginning.
* log name, side, and UID
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call func(writePlayerList);
*
* Server only:
* yes
*
* Public:
* yes
*/
#include "macros.hpp"

{
    ["Player", "List", [_x select 0, _x select 1, _x select 2]] call EFUNC(LOGGING,writelog);
} forEach GVAR(playerList);
