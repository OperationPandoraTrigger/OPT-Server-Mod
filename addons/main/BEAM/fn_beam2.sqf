/**
* Description:
* Teleport player and their vehicle to selected destination.
* Check for truce time and level of teleport location.
*
* Author:
* James
*
* Edit by:
* Manu, form
*
* Arguments:
* 0: <NUMBER> current selected index of listbox control
*
* Return Value:
* None
*
* Server only:
* no
*
* Public:
* no - should be called from beam dialog
*
* Global:
* no
*
* Example:
* [0] spawn EFUNC(beam,beam);
*/
#include "macros.hpp"

params
[
    ["_idx", -1, [0], 1]
];

if (_idx == -1) exitWith {};

private _beamPosition = (GVAR(box) select _idx) select 0;
private _beamLevel = (GVAR(box) select _idx) select 3;
private _newPos = [0, 0, 0];

// Sicheren freien Ort für die eigene Fahrzeuggröße suchen
private _size = (sizeOf typeOf (vehicle player)) / 2;
_newPos = [_beamPosition, 0, GVAR(SearchRadius), _size, 0, 1] call BIS_fnc_findSafePos;

// Abbruch, wenn kein sicherer Ort gefunden wird. (BIS_fnc_findSafePos gibt dann die Kartenmitte zurück)
private _worldsize = (worldName call BIS_fnc_mapSize);
if ((_newPos select 0) == (_worldsize / 2) && (_newPos select 1) == (_worldsize / 2)) then
{
    hint format ["%1", MLOC(BEAM_BUSY)];
    playSound "additemok";
}
// Den Teleport durchführen. (Zuerst in die Luft zum sicheren Ausrichten und dann final platzieren)
else
{
    _newPos set [2, 0];
    _newPos = AGLToASL _newPos;
    vehicle player setPosASL (_newPos vectorAdd [0, 0, 100]);
    vehicle player setVectorUp surfaceNormal _newPos;
    vehicle player setPosASL _newPos;
    closeDialog 0;
};
