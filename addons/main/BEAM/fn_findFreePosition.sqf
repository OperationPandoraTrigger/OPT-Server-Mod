/**
* Description:
* Finds suitable position near a destination with enough space for a vehicle
*
* Author:
* form
*
* Arguments:
* 0: <ARRAY>    position where to search
* 1: <NUMBER>   search-radius around position (optional, default: 50)
* 2: <STRING>   classname of vehicle that must have enough space at the destination (optional, default: players vehicle)
* 3: <NUMBER>   number of tries to find a suitable position (optional, default: 100)
*
* Return Value:
* <ARRAY>       Position of the destination or an empty array
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
* [] call FUNC(findFreePosition);
*/
#include "macros.hpp"

params
[
    "_pos",
    ["_radius", 50],
    ["_vehicle", typeOf vehicle player],
    ["_maxTries", 100]
];

private _newPos = [];

while {_maxTries > 0} do
{
    _maxTries = _maxTries - 1;

    if (_radius > 0) then
    {
        // Position innerhalb des Such-Radius randomisieren und dort in einem kleinen Bereich einen freien Ort für das Fahrzeug suchen
        _newPos = (_pos vectorAdd [_radius / 2 - random _radius, _radius / 2 - random _radius, 0]) findEmptyPosition [5, 10, _vehicle];
    }
    else
    {
        // Bei Suchradius=0 die exakte Position übernehmen
        _newPos = _pos;
    };

    if (count _newPos > 0) then
    {
        // Zusätzlicher Kollisionscheck (2D)
        private _tmp = _newPos select [0, 2];
        private _objects = _tmp nearObjects (sizeOf _vehicle);
        {
            // Objekt bekannt? (Shop-Objekt oder lebender Soldat)
            if (typeOf _x in EGVAR(SHOP,all_item_classnames) || (_x isKindOf "CAManBase" && alive _x)) then
            {
                // Position löschen und abbrechen
                _newPos = [];
                break;
            };
        } forEach _objects;

        // Wenn keine Objekte in der Nähe -> Position freigeben
        if (count _newPos > 0) then { break };
    };
};

// Return position
_newPos;
