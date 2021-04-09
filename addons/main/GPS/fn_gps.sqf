/**
* Description:
* GPS Steuerung für Spieler
* 
* Author:
* [GNC]Lord-MDB
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

#define GPS_UPDATE_INTERVAL 1

GVAR(markerPool) = [];

// create special local player marker
GVAR(markerplayer) = createMarkerLocal ["GPS_MARKER_OWN", [0, 0]];
GVAR(markerplayer) setMarkerTypeLocal "mil_circle";
GVAR(markerplayer) setMarkerColorLocal "ColorBrown";
GVAR(markerplayer) setMarkerSizeLocal [0.8, 0.8];
GVAR(markerplayer) setMarkerAlphaLocal 0.6;

[{
    private _unitsToMark = [];
    {
        private _Sideidunit = getnumber (configFile >> "CfgVehicles" >> (typeof _x) >> "side");
        private _sideidplayer = playerSide call BIS_fnc_sideID;   

        if (_Sideidunit == _sideidplayer) then
        {
            _unitsToMark pushBack _x;
        };
    } foreach playableUnits;

    // alle Marker zum Ursprung zurueck
    GVAR(markerPool) apply
    {
        _x setMarkerTextLocal "";
        _x setMarkerPosLocal [0, 0];             
        _x setMarkerAlphaLocal 1;
        _x setMarkerTypeLocal "mil_triangle";
    };

    // update own player marker
    GVAR(markerplayer) setMarkerPosLocal (vehicle player);   

    // update others markers
    {
        private _marker = format["GPS_MARKER_%1_%2", getPlayerUID _x, getPlayerID _x];
        private _newmarker = createMarkerLocal [_marker, [0, 0]];

        // Neuen Marker erstmalig initialisieren
        if !(_newmarker isEqualTo "") then
        {
            GVAR(markerPool) pushBackUnique _marker;

            switch (playerSide) do 
            {
                case west:
                { 
                    _marker setMarkerColorLocal "colorBLUFOR";
                };

                case east:
                { 
                    _marker setMarkerColorLocal "colorOPFOR";
                };

                case independent:
                { 
                    _marker setMarkerColorLocal "colorIndependent";
                };

                default { };
            };

            _marker setMarkerSizeLocal [0.8, 0.8];
        };

        private _name = name _x;

        if !((lifeState _x isEqualTo "INCAPACITATED") and !(incapacitatedState _x == "")) then 
        {   // Spieler lebt
            _marker setMarkerPosLocal (vehicle _x);
            _marker setMarkerDirLocal (getDirVisual (vehicle _x));

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
                _marker setMarkerAlphaLocal 0.6;
            } 
            else 
            {   // Spieler zu Fuß
                if (isPlayer _x) then 
                {
                    _marker setMarkerTextLocal _name;
                };
            };
        }
        else
        {   // Spieler ist bewusstlos
            _marker setMarkerAlphaLocal 0.6;      
            _marker setMarkerPosLocal (vehicle _x);
            _marker setMarkerDirLocal (getDirVisual (vehicle _x));
            _marker setMarkerTextLocal format [MLOC(PLAYER_INJURED), _name];
            _marker setMarkerTypeLocal "loc_Hospital";
        };
    } forEach _unitsToMark;
}, GPS_UPDATE_INTERVAL, _this] call CFUNC(addPerFrameHandler);
