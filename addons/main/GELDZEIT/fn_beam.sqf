/**
* Description:
* Teleport player and their vehicle to selected destination.
*
* Author:
* [GNC]Lord-MDB
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

switch GVAR(Fraktionauswahl) do
{
    case "AAFvsCSAT":
    {
        if ((playerSide == east) and ((player distance Teleport_CSAT_Basis1) < MIN_DISTANCE_TO_BEAMSPOT)) then
        {
            _Basis = Teleport_CSAT_Basis2;
        };

        if ((playerSide == independent) and ((player distance Teleport_AAF_Basis1) < MIN_DISTANCE_TO_BEAMSPOT)) then
        {
            _Basis = Teleport_AAF_Basis2;
        };

        if ((playerSide == east) and ((player distance Teleport_CSAT_Basis2) < MIN_DISTANCE_TO_BEAMSPOT)) then
        {
            _Basis = Teleport_CSAT_Basis1;
        };

        if ((playerSide == independent) and ((player distance Teleport_AAF_Basis2) < MIN_DISTANCE_TO_BEAMSPOT)) then
        {
            _Basis = Teleport_AAF_Basis1;
        };
    };

    case "NATOvsCSAT":
    {
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
    };

    case "NATOvsAAF":
    {
        if ((playerSide == west) and ((player distance Teleport_NATO_Basis1) < MIN_DISTANCE_TO_BEAMSPOT)) then
        {
            _Basis = Teleport_NATO_Basis2;
        };

        if ((playerSide == independent) and ((player distance Teleport_AAF_Basis1) < MIN_DISTANCE_TO_BEAMSPOT)) then
        {
            _Basis = Teleport_AAF_Basis2;
        };

        if ((playerSide == west) and ((player distance Teleport_NATO_Basis2) < MIN_DISTANCE_TO_BEAMSPOT)) then
        {
            _Basis = Teleport_NATO_Basis1;
        };

        if ((playerSide == independent) and ((player distance Teleport_AAF_Basis2) < MIN_DISTANCE_TO_BEAMSPOT)) then
        {
            _Basis = Teleport_AAF_Basis1;
        };
    };

    default
    {
        ERROR_LOG("GeldzeitBeam: Fehlerhafte Datenübergabe - Keine Fraktionauswahl erkannt");
    };
};

if !(isNull _Basis) then
{
    // Beam-Auftrag an den Server weiterleiten
    GVAR(BEAMJOB) = [player, _Basis];
    publicVariableServer QGVAR(BEAMJOB);

    // Alles weitere zum Beamen ist in GELDZEIT\fn_serverInit.sqf
};
