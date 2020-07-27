/**
* Author: James
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

private _cat = "Fraktionsübersicht";
private _message = "";
private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;

{
    _message = format["%1 (%2), PUID %3", _x select 1, _x select 2, _x select 0];
    diag_log format["[%1] (%2) Log: %3 --- %4","OPT",_cat,_timestamp,_message];

} forEach GVAR(playerList);
