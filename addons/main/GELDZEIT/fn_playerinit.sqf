/**
* Description:
* Setzen einiger Standartwerte für die Mission
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
* [] call FUNC(playerinit);
*/
#include "macros.hpp"

// new command since 1.52 - to disable the player raycasts in PvP cause not needed functionality but a lot of cpu calcuation
disableRemoteSensors true;
setTerrainGrid 3.125;
enableEnvironment true;
enableRadio false;
//0 fadeRadio 0;    <-- produce the mysterie bug ;-P
player disableConversation true;
enableSentences false;
oldSubs = showSubtitles false;
enableSaving [false, false];
enableTeamswitch false;

[] call FUNC(briefing);

["missionStarted",
{
    // setup earplug ace menu
    [] call FUNC(earplugs);

    // setup earplug hotkey
    [
        "OPT",
        QGVAR(cba_addKeybind_earplug),
        ["Ohrenstöpsel", "Ohrenstöpsel Schnellzugriff"],
        {
            if (LastVolume > 0.3) then
            {
                LastVolume = 0.25;
                1 fadeSound 0.25;
            }
            else
            {
                LastVolume = MaxVolume;
                1 fadeSound MaxVolume;
            };
        },
        {},
        [
            DIK_F1,
            [false, false, false] // [shift, ctrl, alt]
        ]
    ] call CBA_fnc_addKeybind;
}] call CFUNC(addEventhandler);
