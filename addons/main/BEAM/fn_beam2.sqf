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

// Freie Position suchen
private _newPos = [_beamPosition, GVAR(SearchRadiusBeam)] call FUNC(findFreePosition);

// Abbruch, wenn kein sicherer Ort gefunden wurde
if (count _newPos == 0) then
{
    hint format ["%1", MLOC(BEAM_BUSY)];
    playSound "additemok";
}
// Den Teleport durchführen. (Zuerst in die Luft zum sicheren Ausrichten und dann final platzieren)
else
{
    // Vor dem Beamen die bisherige Reisesdistanz loggen
    true call EFUNC(LOGGING,tracker);

    _newPos set [2, 0];
    _newPos = AGLToASL _newPos;
    vehicle player setPosASL (_newPos vectorAdd [0, 0, 100]);
    vehicle player setVectorUp surfaceNormal _newPos;
    vehicle player setPosASL _newPos;
    closeDialog 0;

    // Nach dem Beamen die Reisedistanz zurücksetzen
    EGVAR(LOGGING,LAST_POSITION) = nil;
    EGVAR(LOGGING,LAST_DISTANCE) = 0;
};
