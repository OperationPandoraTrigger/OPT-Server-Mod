/**
* Description:
* initialize all flag poles
*
* Author:
* Lord-MDB, form
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
* [] call fnc_setupflagpoles.sqf;

Diese Datei erzeugt für alle gewählten Sektoren die Fahnenmasten sowie Markierungen der MinenZonen.
*/
#include "macros.hpp"

private _PreMineZoneMarkerID = 0;

CreateFlags = {
    if (isServer) then
    {
        _this params ["_pos", "_side", "_texture"];
        private _flag = createVehicle ["FlagPole_F", _pos, [], 0, "CAN_COLLIDE"];
        _flag setVariable ["opt_flag", true, true];
        _flag setVariable ["start_owner", _side, true];

        if (GVAR(flagStartNeutral)) then // Nur Fahnenmast ohne Flagge zum Start gewünscht?
        {
            _flag setVariable ["owner", sideUnknown, true];
        }
        else
        {
            _flag setFlagTexture _texture;
            _flag setVariable ["owner", _side, true];
        };

        // Create MineZoneMarker for all possible flags (will be deleted after Waffenruhe)
        if (GVAR(flagFreeMineZoneMarkerOn)) then
        {
            _PreMineZoneMarkerID = _PreMineZoneMarkerID + 1;
            private _markerName = format["PreMineZoneMarkerStage2_%1", _PreMineZoneMarkerID];
            private _marker = createMarkerLocal [_markerName, _pos];
            GVAR(PreMineZoneMarkers) pushBack _marker;
            _marker setMarkerShapeLocal "ELLIPSE";
            _marker setMarkerBrushLocal "Solid";
            _marker setMarkerColorLocal "ColorRed";
            _marker setMarkerAlphaLocal 0.5;
            _marker setMarkerSize [GVAR(flagFreeMineZoneRadius), GVAR(flagFreeMineZoneRadius)];
        };
        publicVariable QGVAR(PreMineZoneMarkers);
    };
};

// Delete MineZoneMarkers from all possible flags
{
    deleteMarker _x;
} foreach GVAR(PreMineZoneMarkers);
GVAR(PreMineZoneMarkers) = [];

// NATO Flaggen
GVAR(nato_flags_pos) = [];
{
    {
        [_x, west, GVAR(westflag)] call CreateFlags;
    } forEach ((GVAR(AllSectors) select _x) select 1);
} forEach GVAR(nato_sectors);

//CSAT Flaggen
GVAR(csat_flags_pos) = [];
{
    {
        [_x, east, GVAR(eastflag)] call CreateFlags;
    } forEach ((GVAR(AllSectors) select _x) select 1);
} forEach GVAR(csat_sectors);
