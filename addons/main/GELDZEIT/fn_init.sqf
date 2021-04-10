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

// Wenn Spieler die Verbindung trennen -> In der Spielerliste als Disconnected flaggen
addMissionEventHandler ["HandleDisconnect",
{
    params ["_unit", "_id", "_uid", "_name"];

    // Finde Spieler in der Liste
    private _pos = (GVAR(playerList) apply {_x select 0}) find _uid;

    if (_pos != -1) then
    {
        // Alten Eintrag aus der Liste holen, als Disconnected flaggen und zurückschicken
        private _entry = GVAR(playerList) select _pos;
        _entry set [4, false];
        _entry remoteExecCall [QFUNC(updatePlayerList), 2, false]; 
    };
    false;
}];

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
