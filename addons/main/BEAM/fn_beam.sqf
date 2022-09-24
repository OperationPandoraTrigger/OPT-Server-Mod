/**
* Description:
* Teleport player and their vehicle to selected destination.
*
* Author:
* form
*
* Arguments:
* 0: <NUMBER> position
* 1: <NUMBER> direction
* 2: <NUMBER> desired search radius of placement
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
    "_beamPosition",
    "_beamDirection",
    "_radius"
];

// Fluggeräte in 50-150 m Höhe spawnen
if (typeOf vehicle player in EGVAR(SHOP,air)) then
{
    // Vor dem Beamen die bisherige Reisesdistanz loggen
    true call EFUNC(LOGGING,tracker);

    // Beam loggen
    ["Transport", "Beam", [getPlayerUID player, name player, side player, position vehicle player, _beamPosition, position vehicle player distance _beamPosition]] remoteExec [QEFUNC(LOGGING,writelog), 2];

    // Beamen
    vehicle player setPosASL (_beamPosition vectorAdd [0, 0, 50 + random 100]);
    vehicle player setDir _beamDirection;
    vehicle player setVectorUp [0, 0, 1];

    // Nach dem Beamen die Reisedistanz zurücksetzen
    EGVAR(LOGGING,LAST_POSITION) = nil;
    EGVAR(LOGGING,LAST_DISTANCE) = 0;
}

// Normale Fahrzeuge und Personen
else
{
    // Freie Position suchen
    private _newPos = [_beamPosition, _radius] call FUNC(findFreePosition);

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

        // Bei nicht präzisem Beam selbstständig die Höhe der Oberfläche suchen
        if (_radius > 0 ) then
        {
            _newPos set [2, 0];
            _newPos = AGLToASL _newPos;
        };

        // Beam loggen
        ["Transport", "Beam", [getPlayerUID player, name player, side player, position vehicle player, _newPos, position vehicle player distance _newPos]] remoteExec [QEFUNC(LOGGING,writelog), 2];

        // Beamen
        vehicle player setPosASL (_newPos vectorAdd [0, 0, 50 + random 100]);
        vehicle player setDir _beamDirection;
        vehicle player setVectorUp surfaceNormal _newPos;
        vehicle player setPosASL _newPos;

        // Nach dem Beamen die Reisedistanz zurücksetzen
        EGVAR(LOGGING,LAST_POSITION) = nil;
        EGVAR(LOGGING,LAST_DISTANCE) = 0;
    };
};
