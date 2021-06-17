/**
* Description:
* Prueft (Ver)kaufs Pads auf freien Platz
* 
* Author: 
* form
*
* Arguments:
* 0 <ARRAY> Pads, die geprueft werden
* 1 <FLOAT> Maximale Entfernung die geprueft wird
* 
* Return Value:
* 0 <OBJ> Das erste freie Pad
* 
* Server only:
* no
*
* Public:
* no
* 
* Global:
* no
* 
* Example:
* private _freiesPad = [GVAR(pads), GVAR(Checkbereich)] call FUNC(checkpad);
*/
#include "macros.hpp"

scopeName "checkpad";
params 
[
    ["_pads", [objNull]],
    ["_distance", 0]
];

private _freiePads = [];

// freie Pads suchen
{
    private _things = [];

    // Objekte in der Nähe suchen
    private _objects = _x nearObjects _distance;
    {
        // Objekt bekannt? (Shop-Objekt oder lebender Soldat)
        if (_x in GVAR(all_item_classnames) || (_x isKindOf "CAManBase" && alive _x)) then
        {
            _things pushBack _x;
            continue;
        };
    } forEach _objects;

    // Wenn Liste leer -> Pad ist frei!
    if (count _things == 0) then 
    {
        _freiePads append [_x];
        breakTo "checkpad";
    };
} forEach _pads;

_freiePads
