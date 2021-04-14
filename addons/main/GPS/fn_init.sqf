/**
* Description:
* Spielermarker bei Disconnect löschen
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
* [] call FUNC(init);
*/
#include "macros.hpp"

// Wenn Spieler die Verbindung trennen -> Broadcast zum Marker-Löschen
addMissionEventHandler ["HandleDisconnect",
{
    params ["_unit", "_id", "_uid", "_name"];
    private _marker = format["OPT_GPS_MARKER_%1", _uid];
    _marker remoteExecCall ["deleteMarkerLocal", -2, false]; 
    false;
}];
