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

#define LOGGING_VERSION 9

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
                    {
                        deleteMarker _x;
                    } forEach (OPT_SECTORCONTROL_NATOSectorMarkers + OPT_SECTORCONTROL_CSATSectorMarkers + OPT_SECTORCONTROL_AAFSectorMarkers);

                    // Nach Ablauf der Waffenruhe die Grenzlinien von der Karte entfernen
                    if !(OPT_SECTORCONTROL_trainingon && OPT_SECTORCONTROL_trainingDontDeleteBorderMarkers) then
                    {
                        {
                            deleteMarker _x;
                        } forEach OPT_SECTORCONTROL_BorderMarkers;
                    };
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

// Beam-System (Serverseitiger Teil)
GVAR(BEAMJOBS) = [];
GVAR(BEAMJOB) = [];
publicVariable QGVAR(BEAMJOB);

QGVAR(BEAMJOB) addPublicVariableEventHandler
{
    ["DEBUG", "BEAM", ["EH fired.", _this]] call OPT_LOGGING_fnc_writelog;

    GVAR(BEAMJOBS) pushBackUnique GVAR(BEAMJOB);
    while {count GVAR(BEAMJOBS) > 0} do
    {
        // Ersten Job aus dem Array ziehen
        private _beamjob = GVAR(BEAMJOBS) deleteAt 0;   // FIFO
        private _player = _beamjob select 0;
        private _destination = _beamjob select 1;

        // Checken ob das Ziel frei ist
        private _freiePads = [[_destination], 15] call OPT_SHOP_fnc_checkpad;
        if ((count _freiePads) > 0) then 
        {
            // Beamen
            {cutText ["Teleport...", "BLACK OUT", 0.1];} remoteExec ["call", _player];
            vehicle _player setPosASL (getPosASL _destination vectorAdd [0, 0, 1000]);
            vehicle _player setVectorUp vectorUp _destination;
            vehicle _player setdir getdir _destination;
            vehicle _player setPosASL (getPosASL _destination vectorAdd [0, 0, 0.2]);
            {cutText ["Teleport...", "BLACK IN", 0.5];} remoteExec ["call", _player];
        }
        else
        {
            // Das Ziel ist belegt
            {
                hint "BEAM\n\nDie Zielposition ist derzeit leider belegt.";
                playSound "additemok";
            } remoteExec ["call", _player];
        };
    };
};
