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

private _header = MLOC(TELEPORT_MSG_HEADER);
private _txt = MLOC(TELEPORT_MSG);
hint format ["%1\n\n%2", _header, _txt];

openMap true;

[QGVAR(onMapSingleClick), "onMapSingleClick", {
    /*
    units: Array - leader selected units, same as groupSelectedUnits (same as _units param)
    pos: Array - world Position3D of the click in format [x,y,0] (same as _pos param)
    alt: Boolean - true if Alt key was pressed (same as _alt param)
    shift: Boolean - true if Shift key was pressed (same as _shift param)
    */

    private _newPos = [0, 0, 0];
    private _fail = false;

    // Teleport auf Wasser oder Brücken
    if ((surfaceIsWater _pos) and !(vehicle player isKindOf "Air")) then
    {
        // Höhe der neuen Position von +2500 bis -2500 auf Intersection (Brücke) checken - für die neue Zielhöhe
        _pos = lineIntersectsSurfaces [_pos vectorAdd [0, 0, 2500], _pos vectorAdd [0, 0, -2500]] select 0 select 0;
        // Zielhöhe niemals unterhalb der Wasseroberfläche
        if ((_pos select 2) < 0) then
        {
            _pos set [2, 0];
        };
        _newPos = _pos vectorAdd [0, 0, 0.2];
    }
    // Teleport auf normales Gelände
    else
    {
        // Höhe der neuen Position von +4000 bis -1000 auf Intersection checken - für die neue Zielhöhe
        _pos = lineIntersectsSurfaces [_pos vectorAdd [0, 0, 4000], _pos vectorAdd [0, 0, -1000]] select 0 select 0;

        // fliegendes Luftfahrzeug? -> teleport in selber höhe zum grund (+20m)
        private _playerHeight = getPosASL vehicle player select 2;
        private _playerSurfaceHeight = lineIntersectsSurfaces [getPosASL vehicle player, (getposASL vehicle player) vectorAdd [0, 0, -5000], vehicle player] select 0 select 0 select 2;
        private _heightAboveGround = _playerHeight - _playerSurfaceHeight;
        if ((vehicle player isKindOf "Air") and (_heightAboveGround > 2)) then
        {
            _newPos = _pos vectorAdd [0, 0, _heightAboveGround + 20];
        }
        else
        {
            // sonst normaler Teleport, aber sicheren Ort suchen
            _newPos = [_pos, GVAR(SearchRadiusTeleport)] call FUNC(findFreePosition);

            // Abbruch, wenn kein sicherer Ort gefunden wurde
            if (count _newPos == 0) then
            {
                private _header = MLOC(TELEPORT_MSG_HEADER);
                private _txt = MLOC(TELEPORT_FAIL);
                hint format ["%1\n\n%2", _header, _txt];
                playSound "additemok";
                _fail = true;
            }
            else
            {
                _newPos set [2, 0];
                _newPos = AGLToASL _newPos;
            };
        };
    };

    if !(_fail) then
    {
        private _velocity = [0, 0, 0];
        if (vehicle player != player) then
        {
            // Als Fahrzeugführer wird die alte Geschwindigkeit beibehalten
            _velocity = velocityModelSpace vehicle player;
        };

        // Vor dem Beamen die bisherige Reisesdistanz loggen
        true call EFUNC(LOGGING,tracker);

        // Teleport loggen
        ["Transport", "Teleport", [getPlayerUID player, name player, side player, position vehicle player, _newPos, position vehicle player distance _newPos]] remoteExec [QEFUNC(LOGGING,writelog), 2];

        // Den Teleport durchführen. (Zuerst in die Luft zum sicheren Ausrichten und dann final platzieren)
        vehicle player setPosASL (_newPos vectorAdd [0, 0, 100]);
        vehicle player setVectorUp surfaceNormal _newPos;
        vehicle player setVelocityModelSpace _velocity;
        vehicle player setPosASL _newPos;

        // Nach dem Beamen die Reisedistanz zurücksetzen
        EGVAR(LOGGING,LAST_POSITION) = nil;
        EGVAR(LOGGING,LAST_DISTANCE) = 0;

        [QGVAR(onMapSingleClick), "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
        openMap false;
    };
}] call BIS_fnc_addStackedEventHandler;
