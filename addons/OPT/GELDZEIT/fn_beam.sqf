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
#define MIN_DISTANCE_TO_BEAMSPOT 20

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

        if ((playerSide == west) and ((player distance Teleport_Nato_Basis1) < MIN_DISTANCE_TO_BEAMSPOT)) then
        {
            _Basis = Teleport_NATO_Basis2;
        };

        if ((playerSide == east) and ((player distance Teleport_CSAT_Basis2) < MIN_DISTANCE_TO_BEAMSPOT)) then
        {
            _Basis = Teleport_CSAT_Basis1;
        };

        if ((playerSide == west) and ((player distance Teleport_Nato_Basis2) < MIN_DISTANCE_TO_BEAMSPOT)) then
        {
            _Basis = Teleport_NATO_Basis1;
        };    
    };

    case "NATOvsAAF":
    {
        if ((playerSide == west) and ((player distance Teleport_Nato_Basis1) < MIN_DISTANCE_TO_BEAMSPOT)) then
        {
            _Basis = Teleport_NATO_Basis2;
        };

        if ((playerSide == independent) and ((player distance Teleport_AAF_Basis1) < MIN_DISTANCE_TO_BEAMSPOT)) then
        {
            _Basis = Teleport_AAF_Basis2;
        };

        if ((playerSide == west) and ((player distance Teleport_Nato_Basis2) < MIN_DISTANCE_TO_BEAMSPOT)) then
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
    (["Basis"] call BIS_fnc_rscLayer) cutText ["Teleport...", "BLACK OUT", 3]; // fade out in black

    // beam player
    vehicle player setPosASL [(random 100) - 50, (random 100) - 50, 1000 + random 100];
    vehicle player setVectorUp [0,0,1];
    vehicle player setPosASL (getPosASL _Basis vectorAdd [(random 2) + 2, (random 2) + 2, 0.2]);

    (["Basis"] call BIS_fnc_rscLayer) cutText ["", "BLACK IN", 3];
};
