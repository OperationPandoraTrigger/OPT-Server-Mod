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

private _Basis = "";

switch GVAR(Fraktionauswahl) do 
{
	case "AAFvsCSAT" : 
	{
        if ((PLAYERSIDE == east) and (player distance2D (getPos Teleport_CSAT_Basis1) < 20)) then
        {
            _Basis = Teleport_CSAT_Basis2;
        };

        if ((PLAYERSIDE == independent) and (player distance2D (getPos Teleport_AAF_Basis1) < 20)) then
        {
            _Basis = Teleport_AAF_Basis2;
        };

        if ((PLAYERSIDE == east) and (player distance2D (getPos Teleport_CSAT_Basis2) < 20)) then
        {
            _Basis = Teleport_CSAT_Basis1;
        };

        if ((PLAYERSIDE == independent) and (player distance2D (getPos Teleport_AAF_Basis2) < 20)) then
        {
            _Basis = Teleport_AAF_Basis1;
        };
	};

	case "NATOvsCSAT" : 
	{
        if ((PLAYERSIDE == east) and (player distance2D (getPos Teleport_CSAT_Basis1) < 20)) then
        {
            _Basis = Teleport_CSAT_Basis2;
        };

        if ((PLAYERSIDE == west) and (player distance2D (getPos Teleport_Nato_Basis1) < 20)) then
        {
            _Basis = Teleport_NATO_Basis2;
        };

        if ((PLAYERSIDE == east) and (player distance2D (getPos Teleport_CSAT_Basis2) < 20)) then
        {
            _Basis = Teleport_CSAT_Basis1;
        };

        if ((PLAYERSIDE == west) and (player distance2D (getPos Teleport_Nato_Basis2) < 20)) then
        {
            _Basis = Teleport_NATO_Basis1;
        };	
	};

	case "NATOvsAAF" : 
	{
        if ((PLAYERSIDE == west) and (player distance2D (getPos Teleport_Nato_Basis1) < 20)) then
        {
            _Basis = Teleport_NATO_Basis2;
        };

        if ((PLAYERSIDE == independent) and (player distance2D (getPos Teleport_AAF_Basis1) < 20)) then
        {
            _Basis = Teleport_AAF_Basis2;
        };

        if ((PLAYERSIDE == west) and (player distance2D (getPos Teleport_Nato_Basis2) < 20)) then
        {
            _Basis = Teleport_NATO_Basis1;
        };

        if ((PLAYERSIDE == independent) and (player distance2D (getPos Teleport_AAF_Basis2) < 20)) then
        {
            _Basis = Teleport_AAF_Basis1;
        };			
	};

	default 
	{
		ERROR_LOG("clientinit: Fehlehalte Datenübergabe keine Fraktionauswahl erkannt");	
	};
};

(["Basis"] call BIS_fnc_rscLayer) cutText ["Teleport...", "BLACK OUT", 3]; // fade out in black

// beam player
vehicle player setPosASL [(random 100) - 50, (random 100) - 50, 1000 + random 100];
vehicle player setVectorUp [0,0,1];
vehicle player setPosASL (getPosASL _Basis vectorAdd [(random 2) + 2, (random 2) + 2, 0.2]);

(["Basis"] call BIS_fnc_rscLayer) cutText ["", "BLACK IN", 3];
