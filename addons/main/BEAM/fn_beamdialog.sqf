/**
* Description:
* initialize beam dialog and fill listbox with available options
* if component is disabled, only options with level -1 are available
* after mission start, only options with level -1 are available
*
* Author:
* Lord
*
* Edit by:
* Manu, form
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* no
*
* Public:
* yes
*
* Global:
* no
*
* Example:
* call EFUNC(beam,beamDialog);
*/

#include "macros.hpp"

// Minimalentfernung zum Beam-Platz
#define MIN_DISTANCE_TO_BEAMSPOT 10

// Überprüfung ob Spieler in der Nähe eines Beampunktes ist (wichtig für Hotkey-Aufruf)
private _nearBeamSpot = false;

if ((playerSide == west) and ((player distance Teleport_NATO_Basis1) < MIN_DISTANCE_TO_BEAMSPOT)) then
{
    _nearBeamSpot = true;
};

if ((playerSide == west) and ((player distance Teleport_NATO_Basis2) < MIN_DISTANCE_TO_BEAMSPOT)) then
{
    _nearBeamSpot = true;
};

if ((playerSide == east) and ((player distance Teleport_CSAT_Basis1) < MIN_DISTANCE_TO_BEAMSPOT)) then
{
    _nearBeamSpot = true;
};

if ((playerSide == east) and ((player distance Teleport_CSAT_Basis2) < MIN_DISTANCE_TO_BEAMSPOT)) then
{
    _nearBeamSpot = true;
};

if ((playerSide == east) and ((player distance Teleport_CSAT_Basis3) < MIN_DISTANCE_TO_BEAMSPOT)) then
{
    _nearBeamSpot = true;
};

// Abbrechen wenn kein eigenes Beam-Pad in der Nähe ist
if (!_nearBeamSpot) exitWith {};

// Abbrechen wenn Luftfahrzeug am Boden steht
if (typeOf vehicle player in EGVAR(SHOP,air) && isTouchingGround vehicle player) exitWith
{
    hint format ["%1", MLOC(BEAM_AIRGROUND)];
    playSound "additemok";
};

// Fahrzeug abbremsen, bevor der Dialog aufgeht
vehicle player setVelocity [0, 0, 0];

// alte Beam-Verbotszonen löschen
{
    deleteMarkerLocal _x;
} forEach GVAR(BeamZoneDeniedMarkers);
GVAR(BeamZoneDeniedMarkers) = [];

GVAR(ForbiddenZones) = [];

switch playerSide do
{
    case west:
    {
        // In Kriegszeiten alle aktiven Fahnen (eigene und feindliche) fürs Beamen verbieten
        if (EGVAR(GELDZEIT,GAMESTAGE) == GAMESTAGE_WAR) then {GVAR(ForbiddenZones) = EGVAR(SECTORCONTROL,nato_flags) + EGVAR(SECTORCONTROL,csat_flags)}

        // ansonsten (z.B. in Waffenruhe) nur feindliche Fahnen verbieten (alle wählbaren in deren Verteidigungssektor)
        else
        {
            {
                {
                    GVAR(ForbiddenZones) pushBack _x;
                } forEach ((EGVAR(SECTORCONTROL,AllSectors) select _x) select 1);
            } forEach EGVAR(SECTORCONTROL,csat_sectors);
        };

        GVAR(ForbiddenZones) pushBack Teleport_CSAT_Basis1;
//        GVAR(ForbiddenZones) pushBack Teleport_CSAT_Basis2;
//        GVAR(ForbiddenZones) pushBack Teleport_CSAT_Basis3;
        GVAR(ExactZones) = [Teleport_NATO_Basis1, Teleport_NATO_Basis2];
    };

    case east:
    {
        // In Kriegszeiten alle aktiven Fahnen (eigene und feindliche) fürs Beamen verbieten
        if (EGVAR(GELDZEIT,GAMESTAGE) == GAMESTAGE_WAR) then {GVAR(ForbiddenZones) = EGVAR(SECTORCONTROL,nato_flags) + EGVAR(SECTORCONTROL,csat_flags)}

        // ansonsten (z.B. in Waffenruhe) nur feindliche Fahnen verbieten (alle wählbaren in deren Verteidigungssektor)
        else
        {
            {
                {
                    GVAR(ForbiddenZones) pushBack _x;
                } forEach ((EGVAR(SECTORCONTROL,AllSectors) select _x) select 1);
            } forEach EGVAR(SECTORCONTROL,nato_sectors);
        };

        GVAR(ForbiddenZones) pushBack Teleport_NATO_Basis1;
//        GVAR(ForbiddenZones) pushBack Teleport_NATO_Basis2;
        GVAR(ExactZones) = [Teleport_CSAT_Basis1, Teleport_CSAT_Basis2, Teleport_CSAT_Basis3];
    };
};

// Größe der Zone für Fußsoldaten
if (vehicle player == player) then
{
    GVAR(BeamRadius) = GVAR(BeamRadiusMan);
}
// Größe der Zone je nach Fahrzeugklasse
else
{
    {
        _x params ["_Classname", "_BuyPrice", "_SellPrice", "_SellPriceEnemy", "_NeedsCargo", "_GivesCargo", "_Draggable", "_Carriable", "_CanRepair", "_GrabOffset", "_GrabDir", "_HeightOffset", "_Side", "_HardCap", "_BeamRadius"];
        if (typeOf vehicle player isEqualTo _Classname) then
        {
            GVAR(BeamRadius) = _BeamRadius;
            break;
        };
    } forEach EGVAR(SHOP,DB_all);
};

//  Beamen erlaubt?
if (GVAR(BeamRadius) > -0.00001) then
{
    // Verbotszonen zeichnen
    {
        private _markerName = format["BeamZoneDeniedMarker_%1", count GVAR(BeamZoneDeniedMarkers) + 1];
        private _marker = createMarkerLocal [_markerName, _x];
        _marker setMarkerShapeLocal "ELLIPSE";
        _marker setMarkerBrushLocal "FDiagonal";
        _marker setMarkerColorLocal "ColorBlack";
        _marker setMarkerAlphaLocal 1;
        _marker setMarkerSizeLocal [GVAR(BeamRadius) * 1000 * GVAR(BeamRadiusFactor), GVAR(BeamRadius) * 1000 * GVAR(BeamRadiusFactor)];
        GVAR(BeamZoneDeniedMarkers) pushBack _marker;
    } forEach GVAR(ForbiddenZones);

    private _header = MLOC(BEAM_MSG_HEADER);
    private _txt = MLOC(BEAM_MSG);
    hint format ["%1\n\n%2", _header, _txt];

    // Karte öffnen
    openMap true;

    // Feindliche Sektoren merken
    GVAR(EnemySectorsAll) = [];
    switch playerSide do
    {
        case west:
        {
            GVAR(EnemySectorsAll) = EGVAR(SECTORCONTROL,csat_allsectors);
        };

        case east:
        {
            GVAR(EnemySectorsAll) = EGVAR(SECTORCONTROL,nato_allsectors);
        };
    };

    // Feindliche Sektoren markieren
    private _MapControl = findDisplay 12 displayCtrl 51;
    OPT_BEAM_MapHandler = _MapControl ctrlAddEventHandler ["Draw",
    {
        params ["_control"];
        private _color = [];
        {
            if (_forEachIndex in OPT_BEAM_EnemySectorsAll) then
            {
                _color = [0, 0, 0, 1]; // OPFOR
                _control drawTriangle [_x # 3, _color, "\A3\ui_f\data\map\markerbrushes\fdiagonal_ca.paa"];
            };
        } forEach OPT_SECTORCONTROL_AllSectors;
    }];    

    // Zoomfahrt auf gesamte Karte
    [[worldSize, worldSize], [worldSize / 2, worldSize / 2], 0.75] call BIS_fnc_zoomOnArea;

    [QGVAR(onMapSingleClick), "onMapSingleClick",
    {
        /*
        units: Array - leader selected units, same as groupSelectedUnits (same as _units param)
        pos: Array - world Position3D of the click in format [x,y,0] (same as _pos param)
        alt: Boolean - true if Alt key was pressed (same as _alt param)
        shift: Boolean - true if Shift key was pressed (same as _shift param)
        */
        private _newPos = [0, 0, 0];
        private _dir = getDir vehicle player;
        private _fail = false;
        private _exact = false;

        // Verbotene Bereiche checken (und ob innerhalb der Kartengrenzen)
        private _inMap = _pos inArea [[worldSize / 2, worldSize / 2], worldSize / 2, worldSize / 2, 0, true, -1];
        {
            if (_pos inArea _x || !_inMap) then
            {
                private _header = MLOC(BEAM_MSG_HEADER);
                private _txt = MLOC(BEAM_FORBIDDEN);
                hint format ["%1\n\n%2", _header, _txt];
                playSound "additemok";
                _fail = true;
                break;
            };
        } forEach GVAR(BeamZoneDeniedMarkers);

        // Feindliche Sektoren verbieten
        {
            if (_pos inPolygon _x) then
            {
                private _header = MLOC(BEAM_MSG_HEADER);
                private _txt = MLOC(BEAM_FORBIDDEN_SECTOR);
                hint format ["%1\n\n%2", _header, _txt];
                playSound "additemok";
                _fail = true;
                break;
            };
        } forEach EGVAR(SECTORCONTROL,EnemySectorPolygons);

        // Ziel in der Nähe der eigenen (Außen)Basis? Dann exakt auf das Beampad beamen
        {
            if (_pos distance2D _x < 250) then
            {
                _pos = getPosASL _x;
                _dir = getDir _x;
                _exact = true;
                break;
            };
        } forEach GVAR(ExactZones);

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
                // sonst normaler Teleport
                _newPos = _pos;
                _newPos set [2, 0];
                _newPos = AGLToASL _newPos;
            };
        };

        if !(_fail) then
        {
            // Exakte positionierung (SearchRadius=0) bei Heimat- und Außenbasis
            if (_exact) then
            {
                [_newPos, _dir, 0] call FUNC(beam);
            }
            // Sonst freien Platz im Umkreis suchen
            else
            {
                [_newPos, _dir, GVAR(SearchRadiusBeam)] call FUNC(beam);
            };

            // Clickhandler löschen
            [QGVAR(onMapSingleClick), "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

            // Marker auf Karte löschen
            if !(isNil "OPT_BEAM_MapHandler") then
            {
                private _MapControl = findDisplay 12 displayCtrl 51;
                _MapControl ctrlRemoveEventHandler ["Draw", OPT_BEAM_MapHandler];
            };

            // Beam-Verbotszonen löschen
            {
                deleteMarkerLocal _x;
            } forEach GVAR(BeamZoneDeniedMarkers);
            GVAR(BeamZoneDeniedMarkers) = [];

            openMap false;
        };
    }] call BIS_fnc_addStackedEventHandler;
}

// Beamen nicht erlaubt!
else
{
    private _header = MLOC(BEAM_MSG_HEADER);
    private _txt = MLOC(BEAM_LOCKED);
    hint format ["%1\n\n%2", _header, _txt];
    playSound "additemok";
};
