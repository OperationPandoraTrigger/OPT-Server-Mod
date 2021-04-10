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

// Nur, wenn via CBA aktiviert
if (GVAR(SHOW_MARKERS)) then
{
    ResetAllMarkersAndUpdateOwn =
    {
        // alle Marker zum Ursprung zurueck und Grundeinstellungen als Marker für einzelne Spieler
        GVAR(markerPool) apply
        {
            _x setMarkerAlphaLocal 0;
            _x setMarkerTextLocal "";
            _x setMarkerPosLocal [0, 0];
            _x setMarkerTypeLocal "MemoryFragment"; // brauchbare Spielermarker: MemoryFragment, mil_triangle_noShadow, mil_start_noShadow, mil_arrow_noShadow
            _x setMarkerSizeLocal [0.5, 0.5];
            _x setMarkerColor "ColorWhite";
        };

        // update own player marker
        GVAR(markerplayer) setMarkerPosLocal (vehicle player);
    };
    
    UpdateOthersMarkers =
    {
        private _player = _this select 3;
        private _vehicleplayer = vehicle _player;

        private _marker = format["OPT_GPS_MARKER_%1", _this select 0];
        private _newmarker = createMarkerLocal [_marker, [0, 0]];

        // Neuen Marker nur einmalig initialisieren
        if !(_newmarker isEqualTo "") then
        {
            GVAR(markerPool) pushBackUnique _marker;
        };

        _marker setMarkerPosLocal _vehicleplayer;
        private _name = _this select 1;

        if (getDammage _player > 0.9) then   // Alte Methode aus Schlacht <= 6: if ((lifeState _player isEqualTo "INCAPACITATED") and !(incapacitatedState _player == "")) then
        {   // Spieler ist bewusstlos
            _marker setMarkerDirLocal getDirVisual _vehicleplayer;
            _marker setMarkerTypeLocal "loc_Hospital";  // brauchbare Todesmarker: loc_Hospital, KIA
            _marker setMarkerSizeLocal [0.8, 0.8];
            _marker setMarkerColor "ColorRed";

            // keinen Verwundeten-Namen beim eigenen Marker oder wenn es deaktiviert ist anhängen
            if (GVAR(SHOW_PLAYERNAMES) && _player != player) then
            {
                _marker setMarkerTextLocal format [MLOC(PLAYER_INJURED), _name];
            };

            _marker setMarkerAlphaLocal 1;
        }
        else
        {   // Spieler lebt
            _marker setMarkerDirLocal getDirVisual _vehicleplayer + 90; // Um 90 Grad drehen damit die Ausrichtung vom "MemoryFragment" Icon zur Blickrichtung passt
            _marker setMarkerAlphaLocal 0.7;

            if (!(GVAR(SHOW_PLAYERNAMES)) || _player == player) then
            {
                // keinen Spielernamen beim eigenen Marker oder wenn es deaktiviert ist anhängen
                continue;
            };

            if (_vehicleplayer != _player) then
            {   // Spieler in Fahrzeug
                private _vec_name = getText (configFile >> "cfgVehicles" >> typeOf _vehicleplayer >> "displayName");

                // Spezialfall Drohne
                if (_vehicleplayer in allUnitsUAV) then
                {
                    private _operator = (UAVControl _vehicleplayer) select 0;

                    // UAV Operator ja/nein
                    if (!isNull _operator) then
                    {
                        _marker setMarkerTextLocal format["%1 (%2)", _vec_name, name _operator];
                    } 
                    else
                    {
                        _marker setMarkerTextLocal format["%1 (---)", _vec_name];
                    };
                }
                else
                {
                    _marker setMarkerTextLocal format["%1 (%2)", _vec_name, _name];
                };
            }
            else
            {   // Spieler zu Fuß
                _marker setMarkerTextLocal _name;
            };
        };
    };

    GVAR(markerPool) = [];

    // create special local player marker
    private _ownmarker = format["OPT_GPS_MARKER_OWN_%1", getPLayerUID player];
    GVAR(markerplayer) = createMarkerLocal [_ownmarker, position (vehicle player)];
    GVAR(markerplayer) setMarkerTypeLocal "mil_circle_noShadow";
    GVAR(markerplayer) setMarkerColorLocal "ColorYellow";
    GVAR(markerplayer) setMarkerSizeLocal [0.7, 0.7];
    GVAR(markerplayer) setMarkerAlphaLocal 1;

    // Je nach Spielerseite einen eigenen PFH anmelden, der ein vorsortiertes Array benutzt
    switch (playerSide) do 
    {
        case west: 
        {
            [{
                [] call ResetAllMarkersAndUpdateOwn;
                {
                    _x call UpdateOthersMarkers;
                } forEach OPT_GELDZEIT_playerListActiveWEST;
            }, 1 / GVAR(FPS), _this] call CFUNC(addPerFrameHandler);
        };

        case east: 
        {
            [{
                [] call ResetAllMarkersAndUpdateOwn;
                {
                    _x call UpdateOthersMarkers;
                } forEach OPT_GELDZEIT_playerListActiveEAST;
            }, 1 / GVAR(FPS), _this] call CFUNC(addPerFrameHandler);
        };

        case independent: 
        {
            [{
                [] call ResetAllMarkersAndUpdateOwn;
                {
                    _x call UpdateOthersMarkers;
                } forEach OPT_GELDZEIT_playerListActiveGUER;
            }, 1 / GVAR(FPS), _this] call CFUNC(addPerFrameHandler);
        };
    };
};
