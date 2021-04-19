/*
* Description:
* Spieler-Anzeige auf Karte und GPS
* 
* Author:
* [GNC]Lord-MDB, form
*
* Arguments:
*
* Return Value:
*
* Server Only:
* No
* 
* Global:
* No
* 
* API:
* No
* 
* Example:
* [] call FUNC(gps);
*/

#include "macros.hpp";

// Markers with no update in the last n seconds will be deleted
#define MAX_MARKER_AGE 10

GVAR(MarkerPool) = createHashMap;
GVAR(LastCleanUp) = time;

// create special local player marker
private _markerOwn = format["OPT_GPS_OWN_%1", getPlayerID player];
GVAR(markerOwn) = createMarkerLocal [_markerOwn, position (vehicle player)];
GVAR(markerOwn) setMarkerTypeLocal "mil_circle_noShadow";  
GVAR(markerOwn) setMarkerColorLocal "ColorYellow";  
GVAR(markerOwn) setMarkerSizeLocal [0.7, 0.7];
GVAR(markerOwn) setMarkerAlphaLocal 1;

[{
    // update own player marker (circle only)
    GVAR(markerOwn) setMarkerPosLocal (vehicle player);

    // get all players from own side
    private _allUnits = allPlayers select {(side group _x) isEqualTo (side group player)};

    // update all players
    {
        private _playerName = name _x;
        private _playerVehicle = vehicle _x;
        private _playerID = getPlayerID _x;
        private _markerAlive = format["OPT_GPS_ALIVE_%1", _playerID];
        private _markerDead = format["OPT_GPS_DEAD_%1", _playerID];

        // Marker nur einmalig initialisieren
        if !(_playerID in GVAR(MarkerPool)) then
        {
            createMarkerLocal [_markerAlive, _playerVehicle];
            _markerAlive setMarkerAlphaLocal 0;
            _markerAlive setMarkerTypeLocal "loc_ViewTower"; // brauchbare Spielermarker: MemoryFragment, mil_triangle_noShadow, mil_start_noShadow, mil_arrow_noShadow, loc_ViewTower
            _markerAlive setMarkerSizeLocal [1.2, 1.2];
            _markerAlive setMarkerColor "ColorWhite";

            createMarkerLocal [_markerDead, _playerVehicle];
            _markerDead setMarkerAlphaLocal 0;
            _markerDead setMarkerTypeLocal "loc_Hospital";  // brauchbare Todesmarker: loc_Hospital, KIA
            _markerDead setMarkerSizeLocal [0.8, 0.8];
            _markerDead setMarkerColor "ColorRed";
        };

        // Zeit des letzten Updates speichern (für späteren Cleanup)
        GVAR(MarkerPool) set [_playerID, time];

        // Spieler am Leben
        if (damage _x < 0.9) then
        {
            _markerDead setMarkerAlphaLocal 0;

            _markerAlive setMarkerPosLocal _playerVehicle;
            _markerAlive setMarkerDirLocal getDirVisual _playerVehicle;
            _markerAlive setMarkerAlphaLocal 0.7;

            // keinen Spielernamen beim eigenen Marker oder wenn es deaktiviert ist anhängen
            if (!(GVAR(SHOW_NAMES)) || _x isEqualTo player) then
            {
                _markerAlive setMarkerTextLocal "";
            }
            else
            {
                // Spieler in Fahrzeug
                if (_playerVehicle != _x) then
                {
                    private _vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _playerVehicle >> "displayName");

                    // Spezialfall Drohne
                    if (_playerVehicle in allUnitsUAV) then
                    {
                        private _operatorName = (UAVControl _playerVehicle) select 0;
                        // UAV Operator ja/nein
                        if (!isNull _operator) then
                        {
                            _markerAlive setMarkerTextLocal format["%1 (%2)", _vehicleName, name _operatorName];
                        }
                        else
                        {
                            _markerAlive setMarkerTextLocal format["%1 (---)", _vehicleName];
                        };
                    } 
                    else
                    {
                        _markerAlive setMarkerTextLocal format["%1 (%2)", _vehicleName, _playerName];
                    };
                }
                // Spieler zu Fuß
                else
                {
                    _markerAlive setMarkerTextLocal _playerName;
                };
            };
        }
        // Spieler bewusstlos
        else
        {
            _markerAlive setMarkerAlphaLocal 0;

            // playableUnits enthält nicht die Spieler die gerade respawnen
            if (_x in playableUnits) then
            {
                _markerDead setMarkerPosLocal _playerVehicle;
                _markerDead setMarkerDirLocal getDirVisual _playerVehicle;
                _markerDead setMarkerAlphaLocal 1;

                // keinen Verwundeten-Namen beim eigenen Marker oder wenn es deaktiviert ist anhängen
                if (!(GVAR(SHOW_NAMES)) || _x isEqualTo player) then
                {
                    _markerDead setMarkerTextLocal "";
                }
                else
                {
                    _markerDead setMarkerTextLocal _playerName;
                };
            }
            // Marker ausblenden wenn Spieler respawned
            else
            {
                _markerDead setMarkerAlphaLocal 0;
            };
        };
    } forEach _allUnits;

    // Cleanup old markers
    if (time - GVAR(LastCleanUp) > MAX_MARKER_AGE) then
    {
        {
            private _age = time - _y;
            if (_age > MAX_MARKER_AGE) then
            {
                deleteMarkerLocal format["OPT_GPS_ALIVE_%1", _x];
                deleteMarkerLocal format["OPT_GPS_DEAD_%1", _x];
                GVAR(MarkerPool) deleteAt _x;
            };
        } forEach +GVAR(MarkerPool);   // das Plus ist so gewollt (durch eine Kopie iterieren damit wir uns nicht zwischendrin selbst abwürgen)
        GVAR(LastCleanUp) = time;
    };
}, 1 / GVAR(REFRESH_RATE), _this] call CFUNC(addPerFrameHandler);
