/**
* Description:
* Initialisierung Intro
*
* Author:
* form
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

["missionStarted",
{
    if (GVAR(PlayIntro)) then
    {
        // Vorspann Video
        GVAR(IntroHandle) = [GVAR(IntroFile)] spawn BIS_fnc_playVideo;
        // Info und Spieler
        [{
            [] call FUNC(dialog);
            
        }, {scriptDone GVAR(IntroHandle)}, ""] call CLib_fnc_waitUntil;
    };
}] call CFUNC(addEventhandler);
