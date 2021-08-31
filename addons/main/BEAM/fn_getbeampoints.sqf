/**
* Description:
* provides a list of all valid beampoints for your playerside
*
* Author:
* form
*
*
* Arguments:
* 0: playerSide. Can be west or east
*
* Return Value:
* Array of valid beampoints
* Format: [[position, description, level], ... ]
*
* Level 0: Heimat- und Außenbasis
* Level 1: Fahnenpunkte
* Level 2: Beampunkte
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
* playerSide call FUNC(getbeampoints);
*/

#include "macros.hpp"

params [["_side", civilian]];

private _Homebase = nil;
private _Outpost = nil;
private _OwnSectorsAll = [];
private _OwnSectorsSelected = [];
private _OwnFlagsSelected = [];
private _EnemySectorsAll = [];
private _EnemySectorsSelected = [];
private _EnemyFlagsSelected = [];

switch playerSide do
{
    case west:
    {
        _Homebase = west_Basis_Teleport1;
        _Outpost = west_Basis_Teleport2;
        _OwnSectorsAll = EGVAR(SECTORCONTROL,nato_allsectors);
        _OwnSectorsSelected = EGVAR(SECTORCONTROL,nato_sectors);
        _OwnFlagsSelected = EGVAR(SECTORCONTROL,nato_flags);
        _EnemySectorsAll = EGVAR(SECTORCONTROL,csat_allsectors);
        _EnemySectorsSelected = EGVAR(SECTORCONTROL,csat_sectors);
        _EnemyFlagsSelected = EGVAR(SECTORCONTROL,csat_flags);
    };

    case east:
    {
        _Homebase = east_Basis_Teleport1;
        _Outpost = east_Basis_Teleport2;
        _OwnSectorsAll = EGVAR(SECTORCONTROL,csat_allsectors);
        _OwnSectorsSelected = EGVAR(SECTORCONTROL,csat_sectors);
        _OwnFlagsSelected = EGVAR(SECTORCONTROL,csat_flags);
        _EnemySectorsAll = EGVAR(SECTORCONTROL,nato_allsectors);
        _EnemySectorsSelected = EGVAR(SECTORCONTROL,nato_sectors);
        _EnemyFlagsSelected = EGVAR(SECTORCONTROL,nato_flags);
    };
};

// Beam-Pads in Basis und Außenposten zur Liste der Beampunkte hinzufügen
private _points = [];
_points pushBack [position _Homebase, "Heimatbasis", 0];
_points pushBack [position _Outpost, "Außenposten", 0];

// Flaggen- und Beampositionen der eigenen Sektoren zur Liste der Beampunkte hinzufügen
{
    private _sector = _x;
    {
        _points pushBack [_x, format ["Sektor %1 / Fahne %2", _sector, _forEachIndex + 1], 1];
    } forEach ((EGVAR(SECTORCONTROL,AllSectors) select _x) select 1);  // Flaggen Positionen
    {
        _points pushBack [_x, format ["Sektor %1 / Beampunkt %2", _sector, _forEachIndex + 1], 2];
    } forEach ((EGVAR(SECTORCONTROL,AllSectors) select _x) select 2);  // Beam-Positionen
} forEach _OwnSectorsAll;

// Erlaubte Positionen filtern
private _beampoints = [];
{
    private _pos = _x select 0;
    private _denied = false;

    // Spieler schon vor Ort?
    if (_pos distance position vehicle player < GVAR(SearchRadius)) then {_denied = true};

    // Punkt zu nah an allen möglichen A-Fahnen? (Nur während der Waffenruhe)
    if (!_denied && EGVAR(GELDZEIT,GAMESTAGE) != GAMESTAGE_WAR) then
    {
        {
            {
                if (_pos distance _x < GVAR(MinDistance)) then {_denied = true};
            } forEach ((EGVAR(SECTORCONTROL,AllSectors) select _x) select 1);
        } forEach _EnemySectorsSelected;
    };

    // Punkt zu nah an aktiven Fahnen? (In der Schlacht)
    if (!_denied && EGVAR(GELDZEIT,GAMESTAGE) == GAMESTAGE_WAR) then
    {
        {
            if (_pos distance position _x < GVAR(MinDistance)) then {_denied = true};
        } forEach (_OwnFlagsSelected + _EnemyFlagsSelected);
    };

    // Wenn OK dann übernehmen
    if (!_denied) then {_beampoints pushBack _x};
} forEach _points;

// Punkte zurückgeben
_beampoints;
