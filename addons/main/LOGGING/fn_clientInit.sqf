/**
* Description:
* Init Tracker
*
* Author:
* form
*
* Arguments:
*
* Return Value:
*
* Server Only:
* No
*
* Global:
* No
*
* API:
* No
*
* Example:
* call FUNC(clientinit);
*/
#include "macros.hpp"
#define TRACKER_REFRESH 5

["missionStarted",
{
    // Tracker nach dem (re)joinen invalidieren
    GVAR(LAST_POSITION) = nil;

    // Tracker für Reisedistanz alle 'TRACKER_REFRESH' Sekunden ausführen
    [{
        false call FUNC(tracker);
    }, TRACKER_REFRESH, _this] call CFUNC(addPerFrameHandler);

}] call CFUNC(addEventhandler);

["Respawn",
{
    // Tracker nach Respawn invalidieren
    GVAR(LAST_POSITION) = nil;
    GVAR(LAST_DISTANCE) = 0;
}] call CFUNC(addEventhandler);

if (EGVAR(SECTORCONTROL,trainingon) && EGVAR(SECTORCONTROL,trainingAllowPositionLogging)) then
{
    // Logging of own position
    player addAction ["Log position", {[] call FUNC(logpos)}, [], 1, false, true, "", "alive _target"];

    ["Respawn",
    {
        // Logging of own position
        player addAction ["Log position", {[] call FUNC(logpos)}, [], 1, false, true, "", "alive _target"];
    }] call CFUNC(addEventhandler);
};
