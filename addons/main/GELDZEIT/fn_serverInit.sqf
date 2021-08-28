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

#define LOGGING_VERSION 11

// Missionsnamen-Rekonstruktor (Symlink opt_latest -> opt_v123)
GVAR(missionName) = missionName;
if (GVAR(missionName) isEqualTo "opt_latest") then
{
    GVAR(missionName) = "opt_v" + getMissionConfigValue "onLoadMission";
};

private _time = systemTime;
["Logging", "Start", [LOGGING_VERSION, EGVAR(SECTORCONTROL,nato_faction), EGVAR(SECTORCONTROL,csat_faction), format ["%1-%2-%3 %4:%5:%6", _time select 0, _time select 1, _time select 2, _time select 3, _time select 4, _time select 5]]] call EFUNC(LOGGING,writelog);
["Mission", "Load", [0, 0, GVAR(missionName)]] call EFUNC(LOGGING,writelog);

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

    // DynamicSimulation
    enableDynamicSimulationSystem true;
    "Group" setDynamicSimulationDistance 250;
    "Vehicle" setDynamicSimulationDistance 200;
    "EmptyVehicle" setDynamicSimulationDistance 150;
    "Prop" setDynamicSimulationDistance 50;

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

                    // OPT Methode
                    {player enableSimulation true;} remoteExec ["call", -2];

                    // Offizielle Methode
                    // {disableUserInput false;} remoteExec ["call", -2];

                    // ACE Methode
                    // {[false] call ace_common_fnc_disableUserInput;} remoteExec ["call", -2];

                    // Logeintrag
                    ["Mission", "Truce", [0, 0, GVAR(missionName)]] call EFUNC(LOGGING,writelog);
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
                    ["Mission", "Start", [0, 0, GVAR(missionName)]] call EFUNC(LOGGING,writelog);

                    // Nach Ablauf der Waffenruhe die Sektorenmarker von der Karte entfernen
                    {
                        deleteMarker _x;
                    } forEach (OPT_SECTORCONTROL_NATOSectorMarkers + OPT_SECTORCONTROL_CSATSectorMarkers);

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
                    ["Mission", "End", [EGVAR(SECTORCONTROL,nato_points), EGVAR(SECTORCONTROL,csat_points), GVAR(missionName)]] call EFUNC(LOGGING,writelog);
                    [] call FUNC(endAAR);

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
    GVAR(BEAMJOBS) pushBackUnique GVAR(BEAMJOB);
    while {count GVAR(BEAMJOBS) > 0} do
    {
        // Ersten Job aus dem Array ziehen
        private _beamjob = GVAR(BEAMJOBS) deleteAt 0;   // FIFO
        private _player = _beamjob select 0;
        private _destination = _beamjob select 1;

        // Checken ob das Ziel frei ist
        private _freiePads = [[_destination], 8] call OPT_SHOP_fnc_checkpad;
        if ((count _freiePads) > 0) then
        {
            // Beamen
            {cutText ["Teleport...", "BLACK OUT", 0.1];} remoteExec ["call", _player];
            private _velocity = velocityModelSpace vehicle _player;
            private _playerHeight = getPosASL vehicle _player select 2;
            private _playerSurfaceHeight = lineIntersectsSurfaces [getPosASL vehicle _player, (getposASL vehicle _player) vectorAdd [0, 0, -5000], vehicle _player] select 0 select 0 select 2;
            private _heightAboveGround = _playerHeight - _playerSurfaceHeight;

            vehicle _player setPosASL (getPosASL _destination vectorAdd [0, 0, 1000]);
            vehicle _player setdir getdir _destination;

            if ((vehicle _player isKindOf "Air") && (_heightAboveGround > 2)) then
            {
                vehicle _player setVectorUp [0, 0, 1];
                vehicle _player setPosASL (getPosASL _destination vectorAdd [0, 0, _heightAboveGround + 20]);
            }
            else
            {
                vehicle _player setVectorUp vectorUp _destination;
                vehicle _player setPosASL (getPosASL _destination vectorAdd [0, 0, 0.2]);
            };

            [vehicle _player, _velocity] remoteExec ["setVelocityModelSpace", _player];
            {cutText ["Teleport...", "BLACK IN", 0.5];} remoteExec ["call", _player];
        }
        else
        {
            // Das Ziel ist belegt
            {
                hint format ["%1\n\n%2", MLOC(BEAM), MLOC(BEAM_BUSY)];
                playSound "additemok";
            } remoteExec ["call", _player];
        };
    };
};
