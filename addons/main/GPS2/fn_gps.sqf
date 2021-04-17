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

#define MAX_MARKER_AGE 10

GVAR(HashMapAlive) = createHashMap;
GVAR(HashMapDead) = createHashMap;
GVAR(HashMapTime) = createHashMap;

// create special local player marker
private _markerOwn = format["OPT_GPS_OWN_%1", getPLayerID player];
GVAR(markerOwn) = createMarkerLocal [_markerOwn, position (vehicle player)];
GVAR(markerOwn) setMarkerTypeLocal "mil_circle_noShadow";  
GVAR(markerOwn) setMarkerColorLocal "ColorYellow";  
GVAR(markerOwn) setMarkerSizeLocal [0.7, 0.7];
GVAR(markerOwn) setMarkerAlphaLocal 1;

[{
    // update own player marker (circle only)
    GVAR(markerOwn) setMarkerPosLocal (vehicle player);

    // get all players from own side
    private _unitsAlive = allUnits select {!(damage _x > 0.9) && (side group _x) isEqualTo (side group player)};
    private _unitsDead = playableUnits select {damage _x > 0.9 && (side group _x) isEqualTo (side group player)};

    // update alive players
    {
        private _name = name _x;
        private _id = getPlayerID _x;
        private _markerAlive = format["OPT_GPS_ALIVE_%1", _id];
        private _markerDead = format["OPT_GPS_DEAD_%1", _id];

        // Zeit des letzten Updates speichern (für späteren Cleanup)
        GVAR(HashMapTime) set [_id, time];

        // Spielermarker nur einmalig initialisieren
        if !(_id in GVAR(HashMapAlive)) then
        {
            createMarkerLocal [_markerAlive, (vehicle _x)];
            _markerAlive setMarkerAlphaLocal 0;
            _markerAlive setMarkerTypeLocal "MemoryFragment"; // brauchbare Spielermarker: MemoryFragment, mil_triangle_noShadow, mil_start_noShadow, mil_arrow_noShadow
            _markerAlive setMarkerSizeLocal [0.5, 0.5];
            _markerAlive setMarkerColor "ColorWhite";
            GVAR(HashMapAlive) set [_id, _markerAlive];
        };

        _markerAlive setMarkerPosLocal (vehicle _x);
        _markerAlive setMarkerDirLocal getDirVisual (vehicle _x) + 90; // Um 90 Grad drehen damit die Ausrichtung vom "MemoryFragment" Icon zur Blickrichtung passt
        _markerAlive setMarkerAlphaLocal 0.7;
        _markerDead setMarkerAlphaLocal 0;

        // keinen Spielernamen beim eigenen Marker oder wenn es deaktiviert ist anhängen
        if (!(GVAR(SHOW_PLAYERNAMES)) || _x isEqualTo player) then
        {
            _markerAlive setMarkerTextLocal "";
            continue;
        };

        // Spieler in Fahrzeug
        if (vehicle _x != _x) then
        {
            private _vehicle = getText (configFile >> "cfgVehicles" >> typeOf (vehicle _x) >> "displayName");

            // Spezialfall Drohne
            if ((vehicle _x) in allUnitsUAV) then
            {
                private _operator = (UAVControl vehicle _x) select 0;
                // UAV Operator ja/nein
                if (!isNull _operator) then
                {
                    _markerAlive setMarkerTextLocal format["%1 (%2)", _vehicle, name _operator];
                }
                else
                {
                    _markerAlive setMarkerTextLocal format["%1 (---)", _vehicle];
                };
            } 
            else
            {
                _markerAlive setMarkerTextLocal format["%1 (%2)", _vehicle, _name];
            };
        }
        // Spieler zu Fuß
        else
        {
            _markerAlive setMarkerTextLocal _name;
        };
    } forEach _unitsAlive;

    // update dead players
    {
        private _name = name _x;
        private _id = getPlayerID _x;
        private _markerAlive = format["OPT_GPS_ALIVE_%1", _id];
        private _markerDead = format["OPT_GPS_DEAD_%1", _id];

        // Zeit des letzten Updates speichern (für späteren Cleanup)
        GVAR(HashMapTime) set [_id, time];

        // Todesmarker nur einmalig initialisieren
        if !(_id in GVAR(HashMapDead)) then
        {
            createMarkerLocal [_markerDead, (vehicle _x)];
            _markerDead setMarkerAlphaLocal 0;
            _markerDead setMarkerTypeLocal "loc_Hospital";  // brauchbare Todesmarker: loc_Hospital, KIA
            _markerDead setMarkerSizeLocal [0.8, 0.8];
            _markerDead setMarkerColor "ColorRed";
            GVAR(HashMapDead) set [_id, _markerDead];
        };

        _markerDead setMarkerPosLocal (vehicle _x);
        _markerDead setMarkerDirLocal getDirVisual (vehicle _x);
        _markerDead setMarkerAlphaLocal 1;
        _markerAlive setMarkerAlphaLocal 0;

        // keinen Verwundeten-Namen beim eigenen Marker oder wenn es deaktiviert ist anhängen
        if (!(GVAR(SHOW_PLAYERNAMES)) || _x isEqualTo player) then
        {
            _markerDead setMarkerTextLocal "";
            continue;
        };

        _markerDead setMarkerTextLocal _name;
    } forEach _unitsDead;
}, 1 / GVAR(FPS), _this] call CFUNC(addPerFrameHandler);

[{
   // Cleanup old markers
    {
        private _age = time - _y;
        if (_age > MAX_MARKER_AGE) then
        {
            deleteMarkerLocal (GVAR(HashMapAlive) get _x);
            deleteMarkerLocal (GVAR(HashMapDead) get _x);
            GVAR(HashMapAlive) deleteAt _x;
            GVAR(HashMapDead) deleteAt _x;
            GVAR(HashMapTime) deleteAt _x;
        };
    } forEach +GVAR(HashMapTime);   // das Plus ist so gewollt (durch eine Kopie iterieren damit wir uns nicht zwischendrin selbst abwürgen)
}, MAX_MARKER_AGE, _this] call CFUNC(addPerFrameHandler);
