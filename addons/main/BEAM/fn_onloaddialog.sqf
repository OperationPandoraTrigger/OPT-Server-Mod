/**
* Description:
* initialize beam dialog and fill listbox with available options
* if component is disabled, only options with level -1 are available
* after mission start, only options with level -1 are available
*
* Author:
* Lord
*
* Edit by:
* Manu, form
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* no
*
* Public:
* no - should be called via onLoad from beam dialog
*
* Global:
* no
*
* Sideeffects:
* fill variable GVAR(box) with options to beam
* fill listbox of beam dialog with all options of GVAR(box)
*
* Example:
* [] call EFUNC(beam,onLoadDialog);
*/

#include "macros.hpp"

#define DIALOG_BEAM_IDD 444001
#define DIALOG_BEAM_LB_IDC 10002
#define DIALOG_ADDBEAM_IDC 1413

#define DIALOG_BEAM_LB_COLOR_DEFAULT [ 0, 1, 0, 1 ]
#define DIALOG_BEAM_LB_COLOR_LVL_ONE [ 1, 0.5, 0.5, 1 ]
#define DIALOG_BEAM_LB_COLOR_LVL_TWO [ 1, 1, 0, 1 ]

#define BEAM_ACTION_ADD_BEAM 'Beampunkt-Verwaltung'
#define BEAM_MAX_LOCATIONS 5

disableSerialization;

private _display = findDisplay DIALOG_BEAM_IDD;
private _lb = _display displayCtrl DIALOG_BEAM_LB_IDC;

// Zentrum des Kampfgeschehens suchen (Mittelpunkt zwischen allen Fahnen, die als Verteidigungsfahnen zur Verfügung stehen)
private _center = nil;
private _i = 0;
{
    {
        _i = _i + 1;
        if (isNil "_center") then {_center = _x}
        else {_center = _center vectorAdd _x};
    } forEach ((EGVAR(SECTORCONTROL,AllSectors) select _x) select 1);  // select 1 = flaggen positionen
} forEach (EGVAR(SECTORCONTROL,nato_sectors) + EGVAR(SECTORCONTROL,csat_sectors));
_center = _center vectorMultiply (1 / _i);

// Beampunkteliste füllen
GVAR(box) = [];
switch (playerSide) do
{
    case west:
    {
        // Beam-Pads in Basis und Außenposten zur Liste der Beampunkte hinzufügen
        GVAR(box) pushBack [position west_Basis_Teleport1, "Heimatbasis", 0];
        GVAR(box) pushBack [position west_Basis_Teleport2, "Außenposten", 0];

        // Die Fahnenpositionen aus den eigenen Sektoren als Beampunkte hinzufügen
        {
            private _sector = _x;
            {
                private _distance = [(_center distance _x) / 1000, 1, 1] call CBA_fnc_formatNumber;
                GVAR(box) pushBack [_x, format ["Sektor %1 / Fahne %2 (%3 km)", _sector, _forEachIndex + 1, _distance], _forEachIndex + 1];
            } forEach ((EGVAR(SECTORCONTROL,AllSectors) select _x) select 1);  // select 1 = flaggen positionen // select 2 = beam orte
        } forEach EGVAR(SECTORCONTROL,nato_allsectors);
    };

    case east:
    {
        // Beam-Pads in Basis und Außenposten zur Liste der Beampunkte hinzufügen
        GVAR(box) pushBack [position east_Basis_Teleport1, "Heimatbasis", 0];
        GVAR(box) pushBack [position east_Basis_Teleport2, "Außenposten", 0];

        // Die Fahnenpositionen aus den eigenen Sektoren als Beampunkte hinzufügen
        {
            private _sector = _x;
            {
                private _distance = [(_center distance _x) / 1000, 1, 1] call CBA_fnc_formatNumber;
                GVAR(box) pushBack [_x, format ["Sektor %1 / Fahne %2 (%3 km)", _sector, _forEachIndex + 1, _distance], _forEachIndex + 1];
            } forEach ((EGVAR(SECTORCONTROL,AllSectors) select _x) select 1);  // select 1 = flaggen positionen // select 2 = beam orte
        } forEach EGVAR(SECTORCONTROL,csat_allsectors);
    };
};

{
    private _pos = _x select 0;
    private _name = _x select 1;
    private _lvl = _x select 2;

    private _index = lbAdd [DIALOG_BEAM_LB_IDC, _name]; // readable name
    _lb lbSetColor [_index, DIALOG_BEAM_LB_COLOR_DEFAULT];

    if (_lvl == 1) then
    {
        _lb lbSetColor [_index, DIALOG_BEAM_LB_COLOR_LVL_ONE];
    };

    if (_lvl == 2) then
    {
        _lb lbSetColor [_index, DIALOG_BEAM_LB_COLOR_LVL_TWO];
    };
} forEach GVAR(box);
