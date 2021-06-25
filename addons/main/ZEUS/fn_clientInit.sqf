/**
* Author: Fank
* Creates Zeus for client
*
* Arguments:
* None
*
* Return Value:
* None
*
*/
#include "macros.hpp"

if (!OPT_SECTORCONTROL_trainingon) exitWith {};

["missionStarted",
{
    [ZEUS_SWAP_EVENT, [player]] call CFUNC(serverEvent);

    player addEventHandler ["Respawn", {
        params ["_unit","_corpse"];
        [ZEUS_SWAP_EVENT, [_unit, _corpse]] call CFUNC(serverEvent);
    }];
}] call CFUNC(addEventhandler);
