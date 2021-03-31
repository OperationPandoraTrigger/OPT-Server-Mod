/**
* Description:
* Init Server Zeit und Geldsystem
* 
* Author:
* Lord-MDB, form
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

#define LOGGING_VERSION 7

private _time = systemTime;
["Logging", "Start", [LOGGING_VERSION, OPT_GELDZEIT_Fraktionauswahl, format ["%1-%2-%3 %4:%5:%6", _time select 0, _time select 1, _time select 2, _time select 3, _time select 4, _time select 5]]] call OPT_LOGGING_fnc_writelog;
["Mission", "Load", [0, 0, 0, missionName]] call OPT_LOGGING_fnc_writelog;

//Init Statussignale
GVAR(FreeztimeEnde) = false;
publicVariable QGVAR(FreeztimeEnde);

GVAR(Waffenruhestart) = false;
publicVariable QGVAR(Waffenruhestart);

GVAR(Spielzeitstart) = false;
publicVariable QGVAR(Spielzeitstart);

GVAR(SpielzeitEnde) = false;

GVAR(playerList) = [];

["missionStarted", {
    GVAR(startTime) = serverTime;
    publicVariable QGVAR(startTime);

    GVAR(Timestamp_Waffenruhestart) = GVAR(startTime) + GVAR(FREEZETIME);
    GVAR(Timestamp_Spielzeitstart) = GVAR(startTime) + GVAR(FREEZETIME) + GVAR(TRUCETIME);
    GVAR(Timestamp_Spielzeitende) = GVAR(startTime) + GVAR(PLAYTIME);   // Freeze- & Trucetime zählt zur Spielzeit dazu!

    // Aktuellen Spielabschnitt setzen
    [{
        private _timeElapsed = serverTime - GVAR(startTime); 

        // Nach Ablauf der Freezetime die Waffenruhe auslösen
        if (!GVAR(FreeztimeEnde) && serverTime > GVAR(Timestamp_Waffenruhestart)) then
        {
            GVAR(FreeztimeEnde) = true;
            publicVariable QGVAR(FreeztimeEnde);

            GVAR(Waffenruhestart) = true;
            publicVariable QGVAR(Waffenruhestart);

            // Logeintrag
            ["Mission", "Truce", [0, 0, 0, missionName]] call OPT_LOGGING_fnc_writelog;
        };

        // Nach Ablauf der Waffenruhe die Spielzeit auslösen
        if (GVAR(Waffenruhestart) && !GVAR(Spielzeitstart) && serverTime > GVAR(Timestamp_Spielzeitstart)) then
        {
            GVAR(Spielzeitstart) = true;
            publicVariable QGVAR(Spielzeitstart);

            // Missionsstart loggen
            ["Mission", "Start", [0, 0, 0, missionName]] call OPT_LOGGING_fnc_writelog;

            // Nach Ablauf der Waffenruhe die Sektorenmarker von der Karte entfernen
            [] call OPT_SECTORCONTROL_fnc_deletesectormarkers;
        };

        // Nach Ablauf der Spielzeit das Ende auslösen
        if (GVAR(Spielzeitstart) && !GVAR(SpielzeitEnde) && serverTime > GVAR(Timestamp_Spielzeitende)) then
        {
            GVAR(SpielzeitEnde) = true;

            // Spielerliste loggen
            [] call FUNC(writePlayerList);

            // Endpunktestand loggen
            ["Mission", "End", [OPT_SECTORCONTROL_nato_points, OPT_SECTORCONTROL_csat_points, OPT_SECTORCONTROL_aaf_points, missionName]] call OPT_LOGGING_fnc_writelog;

            [EVENT_SPIELUHR_ENDBILDSCHIRM,[]] call CFUNC(globalEvent);
        };
    }, 1, _this] call CFUNC(addPerFrameHandler);
}] call CFUNC(addEventhandler);
