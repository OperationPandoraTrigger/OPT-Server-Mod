/**
* Description:
* Initialisierung Flaggensystem Server
* 
* Author:
* Lord-MDB
*
* Arguments:
*
* Return Value:
*
* Server Only:
* Yes
* 
* Global:
* No
* 
* API:
* No
* 
* Example:
* [] call FUNC(serverInit);
*/
#include "macros.hpp"

//init Startwerte
GVAR(csat_points) = 0;
publicVariable QGVAR(csat_points);

GVAR(nato_points) = 0;
publicVariable QGVAR(nato_points);

GVAR(aaf_points) = 0;
publicVariable QGVAR(aaf_points);

GVAR(draw) = 0;
publicVariable QGVAR(draw);

GVAR(csat_win)= 0;
publicVariable QGVAR(csat_win);

GVAR(nato_win) = 0;
publicVariable QGVAR(nato_win);

GVAR(aaf_win)= 0;
publicVariable QGVAR(aaf_win);

GVAR(dominator) = sideUnknown;
publicVariable QGVAR(dominator);

GVAR(nato_flags) = [];
publicVariable QGVAR(nato_flags);

GVAR(csat_flags) = [];
publicVariable QGVAR(csat_flags);

GVAR(aaf_flags) = [];
publicVariable QGVAR(aaf_flags);

DFUNC(startflagsetup) = 
{
    //Punkte Erfassung wärend der Spielzeit
    [] call FUNC(punkte);
    
    // start flag setup (setting owner)
    [] call FUNC(setupFlag);

    // calculate first time the dominator (it's needed if assynchrone number of flags are defined)
    [sideUnknown, objNull] call FUNC(setFlagOwner);    
};    

["missionStarted",
{
    // Finale Fahnenmasten und Markierungen setzen
    [] call FUNC(setupflagpoles);
    [FUNC(startflagsetup), {(OPT_GELDZEIT_GAMESTAGE == GAMESTAGE_WAR)}, "Awesome Delay"] call CLib_fnc_waitUntil;
}] call CFUNC(addEventhandler);

// Sektorenmarker auf die Karte zeichnen sobald die Mission durchgeladen ist
[] call FUNC(drawsectormarkers);

// Flaggen Arrays und Markierungen setzen sobald die Mission durchgeladen ist
[] call FUNC(setupflagpositions);
