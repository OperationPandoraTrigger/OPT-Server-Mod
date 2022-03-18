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
        //Vorspann Video
        [GVAR(IntroFile)] call BIS_fnc_playVideo;

        //Info und Spieler
        [{
            [] call FUNC(dialog);
            
        }, GVAR(Introvideolange) ,"6"] call CLib_fnc_wait;
    };
}] call CFUNC(addEventhandler);
