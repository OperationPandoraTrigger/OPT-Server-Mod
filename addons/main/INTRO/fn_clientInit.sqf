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
        [GVAR(IntroFile)] call BIS_fnc_playVideo;
    };
}] call CFUNC(addEventhandler);
