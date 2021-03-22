/**
* Author: James, form
* open map and choose teleport
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call func(teleport);
*
*/
#include "macros.hpp"

private _txt = MLOC(TELEPORT_MSG);
private _header = MLOC(TELEPORT_MSG_HEADER);
hint format ["%1\n\n%2", _header, _txt];

openMap true;

[QGVAR(onMapSingleClick), "onMapSingleClick", {
    /*
    units: Array - leader selected units, same as groupSelectedUnits (same as _units param)
    pos: Array - world Position3D of the click in format [x,y,0] (same as _pos param)
    alt: Boolean - true if Alt key was pressed (same as _alt param)
    shift: Boolean - true if Shift key was pressed (same as _shift param)
    */

    // Teleport für Boote auf Wasserhöhe + 0,2m
    if (surfaceIsWater _pos) then
    {
        vehicle player setPosASL [(random 100) - 50, (random 100) - 50, 1000 + random 100];
        vehicle player setVectorUp [0,0,1];
        vehicle player setPosASL [_pos vectorAdd [0, 0, 0.2]];
    }
    else
    {
        // Höhe der neuen Position von +5000 bis -5000 auf Intersection checken - für die neue Zielhöhe
        _pos set [2, 5000];
        _pos = lineIntersectsSurfaces [_pos, _pos vectorAdd [0, 0, -10000]] select 0 select 0 vectorAdd [0, 0, 0.1];

        // fliegendes Luftfahrzeug? -> teleport in selber höhe zum grund (+20m)
        private _playerHeight = getPosASL vehicle player select 2;
        private _playerSurfaceHeight = lineIntersectsSurfaces [getPosASL vehicle player, (getposASL vehicle player) vectorAdd [0, 0, -10000], vehicle player] select 0 select 0 select 2;
        private _heightAboveGround = _playerHeight - _playerSurfaceHeight;
        if ((vehicle player isKindOf "Air") and (_heightAboveGround > 2)) then
        {
            vehicle player setPosASL (_pos vectorAdd [0, 0, _heightAboveGround + 20]);
        }
        else
        {
            // sonst normaler teleport
            vehicle player setPosASL _pos;
        };
    };
    
    [QGVAR(onMapSingleClick), "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
    openMap false;
}] call BIS_fnc_addStackedEventHandler;
