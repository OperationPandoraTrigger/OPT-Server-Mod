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

    // Marker für Spieleranzahl löschen
    GVAR(playercount_handler) call CBA_fnc_removePerFrameHandler;
    deleteMarker "Marker_NumPlayers";
}] call CFUNC(addEventhandler);

// Sektoren initialisieren (Sektormarker, Flaggenpositionen, Beampunkte)
[] call FUNC(setupsectors);

// Anzeige der Anzahl von eingeslotteten Spielern als Marker auf der Karte
// Wie oft (in Sekunden) wird die Spieleranzahl aktualisiert
#define PLAYERCOUNT_INTERVAL 1

private _worldsize = (worldName call BIS_fnc_mapSize);
createMarkerLocal ["Marker_NumPlayers", [0, worldsize + 500]];
"Marker_NumPlayers" setMarkerTypeLocal "hd_end_noShadow";  
"Marker_NumPlayers" setMarkerColorLocal "ColorBlack";  
"Marker_NumPlayers" setMarkerSizeLocal [1, 1];
"Marker_NumPlayers" setMarkerAlphaLocal 1;

switch OPT_GELDZEIT_Fraktionauswahl do 
{
    case "AAFvsCSAT":
    {
        GVAR(playercount_handler) =
        [{
            "Marker_NumPlayers" setMarkerText format["Eingeslottet: AAF: %1 // CSAT: %2", playersNumber independent, playersNumber east];
        }, PLAYERCOUNT_INTERVAL] call CBA_fnc_addPerFrameHandler;    // Der CLib PFH funktioniert hier noch nicht vor dem Missionsstart
    };
    case "NATOvsCSAT":
    {
        GVAR(playercount_handler) =
        [{
            "Marker_NumPlayers" setMarkerText format["Eingeslottet: NATO: %1 // CSAT: %2", playersNumber west, playersNumber east];
        }, PLAYERCOUNT_INTERVAL] call CBA_fnc_addPerFrameHandler;    // Der CLib PFH funktioniert hier noch nicht vor dem Missionsstart
    };
    case "NATOvsAAF":
    {
        GVAR(playercount_handler) =
        [{
            "Marker_NumPlayers" setMarkerText format["Eingeslottet: NATO: %1 // AAF: %2", playersNumber west, playersNumber independent];
        }, PLAYERCOUNT_INTERVAL] call CBA_fnc_addPerFrameHandler;    // Der CLib PFH funktioniert hier noch nicht vor dem Missionsstart
    };
    default 
    {
        ERROR_LOG("RulesClientInit: Fehlerhafte Datenübergabe - Keine Fraktionauswahl erkannt");
    };
};
