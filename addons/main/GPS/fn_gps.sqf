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
    GVAR(markerPool) = [];

    // create special local player marker
    private _ownmarker = format["OPT_GPS_MARKER_OWN_%1_%2", getPLayerUID player, getPlayerID player];
    GVAR(markerplayer) = createMarkerLocal [_ownmarker, position (vehicle player)];
    GVAR(markerplayer) setMarkerTypeLocal "mil_circle_noShadow";  
    GVAR(markerplayer) setMarkerColorLocal "ColorYellow";  
    GVAR(markerplayer) setMarkerSizeLocal [0.7, 0.7];
    GVAR(markerplayer) setMarkerAlphaLocal 1;

    [{
        private _unitsToMark = [];
        {
            private _sideIdUnit = getnumber (configFile >> "CfgVehicles" >> (typeof _x) >> "side");
            private _sideIdPlayer = playerSide call BIS_fnc_sideID;   

            if (_sideIdUnit == _sideIdPlayer) then
            {
                _unitsToMark pushBack _x;
            };
        } forEach playableUnits;

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

        // update others markers
        {
            private _marker = format["OPT_GPS_MARKER_%1_%2", getPlayerUID _x, getPlayerID _x];
            private _newmarker = createMarkerLocal [_marker, [0, 0]];

            // Neuen Marker nur einmalig initialisieren
            if !(_newmarker isEqualTo "") then
            {
                GVAR(markerPool) pushBackUnique _marker;
            };

            _marker setMarkerPosLocal (vehicle _x);
            private _name = name _x;

            if (getDammage _x > 0.9) then   // Alte Methode aus Schlacht <= 6: if ((lifeState _x isEqualTo "INCAPACITATED") and !(incapacitatedState _x == "")) then
            {   // Spieler ist bewusstlos
                _marker setMarkerDirLocal getDirVisual (vehicle _x);
                _marker setMarkerTypeLocal "loc_Hospital";  // brauchbare Todesmarker: loc_Hospital, KIA
                _marker setMarkerSizeLocal [0.8, 0.8];
                _marker setMarkerColor "ColorRed";
                _marker setMarkerAlphaLocal 1;

                // keinen Verwundeten-Namen beim eigenen Marker oder wenn es deaktiviert ist anhängen
                if (GVAR(SHOW_PLAYERNAMES) && _x != player) then
                {
                    _marker setMarkerTextLocal format [MLOC(PLAYER_INJURED), _name];
                };
            }
            else
            {   // Spieler lebt
                _marker setMarkerDirLocal getDirVisual (vehicle _x) + 90; // Um 90 Grad drehen damit die Ausrichtung vom "MemoryFragment" Icon zur Blickrichtung passt
                _marker setMarkerAlphaLocal 0.7;

                if (!(GVAR(SHOW_PLAYERNAMES)) || _x == player) then
                {
                    // keinen Spielernamen beim eigenen Marker oder wenn es deaktiviert ist anhängen
                    continue;
                };

                if (vehicle _x != _x) then
                {   // Spieler in Fahrzeug
                    private _vec_name = getText (configFile >> "cfgVehicles" >> typeOf (vehicle _x) >> "displayName");

                    // Spezialfall Drohne
                    if ((vehicle _x) in allUnitsUAV) then
                    {
                        private _operator = (UAVControl vehicle _x) select 0;

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
        } forEach _unitsToMark;
    }, 1 / GVAR(FPS), _this] call CFUNC(addPerFrameHandler);
};
