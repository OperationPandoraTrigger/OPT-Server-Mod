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

#define LOGGING_VERSION 8

private _time = systemTime;
["Logging", "Start", [LOGGING_VERSION, OPT_GELDZEIT_Fraktionauswahl, format ["%1-%2-%3 %4:%5:%6", _time select 0, _time select 1, _time select 2, _time select 3, _time select 4, _time select 5]]] call OPT_LOGGING_fnc_writelog;
["Mission", "Load", [0, 0, 0, missionName]] call OPT_LOGGING_fnc_writelog;

GVAR(GAMESTAGE) = GAMESTAGE_FREEZE;
publicVariable QGVAR(GAMESTAGE);

GVAR(playerList) = [];

["missionStarted",
{
    GVAR(startTime) = serverTime;
    publicVariable QGVAR(startTime);

    GVAR(Timestamp_Waffenruhestart) = GVAR(startTime) + GVAR(FREEZETIME);
    GVAR(Timestamp_Spielzeitstart) = GVAR(startTime) + GVAR(FREEZETIME) + GVAR(TRUCETIME);
    GVAR(Timestamp_Spielzeitende) = GVAR(startTime) + GVAR(PLAYTIME);   // Freeze- & Trucetime zählt zur Spielzeit dazu!

    // Aktuellen Spielabschnitt setzen
    [{
        switch (GVAR(GAMESTAGE)) do 
        {
            case GAMESTAGE_FREEZE: 
            {
                // Nach Ablauf der Freezetime die Waffenruhe auslösen
                if (serverTime > GVAR(Timestamp_Waffenruhestart)) then
                {
                    GVAR(GAMESTAGE) = GAMESTAGE_TRUCE;
                    publicVariable QGVAR(GAMESTAGE);

                    // Gefreezte Spieler auftauen
                    {player enableSimulation true;} remoteExec ["call", -2];

                    // Logeintrag
                    ["Mission", "Truce", [0, 0, 0, missionName]] call OPT_LOGGING_fnc_writelog;
                };
            };

            case GAMESTAGE_TRUCE: 
            {
                // Nach Ablauf der Waffenruhe die Spielzeit auslösen
                if (serverTime > GVAR(Timestamp_Spielzeitstart)) then
                {
                    GVAR(GAMESTAGE) = GAMESTAGE_WAR;
                    publicVariable QGVAR(GAMESTAGE);

                    // Missionsstart loggen
                    ["Mission", "Start", [0, 0, 0, missionName]] call OPT_LOGGING_fnc_writelog;

                    // Nach Ablauf der Waffenruhe die Sektorenmarker von der Karte entfernen
                    [] call OPT_SECTORCONTROL_fnc_deletesectormarkers;
                };
            };

            case GAMESTAGE_WAR: 
            {
                // Nach Ablauf der Spielzeit das Ende auslösen
                if (serverTime > GVAR(Timestamp_Spielzeitende)) then
                {
                    GVAR(GAMESTAGE) = GAMESTAGE_END;
                    publicVariable QGVAR(GAMESTAGE);

                    // Spielerliste loggen
                    [] call FUNC(writePlayerList);

                    // Endpunktestand loggen
                    ["Mission", "End", [OPT_SECTORCONTROL_nato_points, OPT_SECTORCONTROL_csat_points, OPT_SECTORCONTROL_aaf_points, missionName]] call OPT_LOGGING_fnc_writelog;

                    [EVENT_SPIELUHR_ENDBILDSCHIRM,[]] call CFUNC(globalEvent);
                };
            };

            case GAMESTAGE_END: 
            {
                // do nothing and watch people disconnecting...
            };

            default
            {
                GVAR(GAMESTAGE) = GAMESTAGE_FREEZE;
                publicVariable QGVAR(GAMESTAGE);
            };
        }; 
    }, 1, _this] call CFUNC(addPerFrameHandler);
}] call CFUNC(addEventhandler);
