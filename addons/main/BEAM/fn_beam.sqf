/**
* Description:
* Teleport player and their vehicle to selected destination.
*
* Author:
* [GNC]Lord-MDB, form
*
* Arguments:
* no
*
* Return Value:
* None
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
* Sideeffects:
* no
*
* Example:
* [] call FUNC(beam);
*/
#include "macros.hpp"

// Minimalentfernung zum Beam-Platz
#define MIN_DISTANCE_TO_BEAMSPOT 10

private _Basis = objNull;

if ((playerSide == east) and ((player distance Teleport_CSAT_Basis1) < MIN_DISTANCE_TO_BEAMSPOT)) then
{
    _Basis = Teleport_CSAT_Basis2;
};

if ((playerSide == west) and ((player distance Teleport_NATO_Basis1) < MIN_DISTANCE_TO_BEAMSPOT)) then
{
    _Basis = Teleport_NATO_Basis2;
};

if ((playerSide == east) and ((player distance Teleport_CSAT_Basis2) < MIN_DISTANCE_TO_BEAMSPOT)) then
{
    _Basis = Teleport_CSAT_Basis1;
};

if ((playerSide == west) and ((player distance Teleport_NATO_Basis2) < MIN_DISTANCE_TO_BEAMSPOT)) then
{
    _Basis = Teleport_NATO_Basis1;
};

if !(isNull _Basis) then
{
    // Beam loggen
    ["Transport", "Beam", [getPlayerUID player, name player, side player, position vehicle player, position _Basis, position vehicle player distance _Basis]] remoteExec [QEFUNC(LOGGING,writelog), 2];

    // Vor dem Beamen die bisherige Reisesdistanz loggen
    true call EFUNC(LOGGING,tracker);

    // Beam-Auftrag an den Server weiterleiten
    GVAR(BEAMJOB) = [player, _Basis];
    publicVariableServer QGVAR(BEAMJOB);

    // Nach dem Beamen die Reisedistanz zurücksetzen
    [{
        EGVAR(LOGGING,LAST_POSITION) = nil;
        EGVAR(LOGGING,LAST_DISTANCE) = 0;
    }, 3,""] call CLib_fnc_wait;
};
