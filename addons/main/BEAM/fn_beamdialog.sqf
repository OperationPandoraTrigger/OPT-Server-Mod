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
* yes
*
* Global:
* no
*
* Example:
* call EFUNC(beam,beamDialog);
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

// Abbrechen wenn kein eigenes Beam-Pad in der Nähe ist
if (isNull _Basis) exitWith {};

// Array mit gültigen Beampunkten füllen
GVAR(box) = [playerSide, true] call FUNC(getbeampoints);

// Nicht berechtigt zum Beamen oder zu Fuß unterwegs? -> Automatische Auswahl von Index 0 (Heimatbasis oder Außenposten)
if (!(typeOf vehicle player in EGVAR(SHOP,beamClasses)) || vehicle player isKindOf "CAManBase") exitWith {0 call FUNC(beam2)};

// Fahrzeug abbremsen, bevor der Dialog aufgeht
vehicle player setVelocity [0, 0, 0];
createDialog "DialogBeam";

#define DIALOG_BEAM_IDD 10000
#define DIALOG_BEAM_LB_IDC 10002
#define DIALOG_BEAM_BU_IDC 10004

#define DIALOG_BEAM_LB_COLOR_DEFAULT [ 0, 1, 0, 1 ]
#define DIALOG_BEAM_LB_COLOR_LVL_ONE [ 1, 0.5, 0.5, 1 ]
#define DIALOG_BEAM_LB_COLOR_LVL_TWO [ 1, 1, 0, 1 ]

private _display = findDisplay DIALOG_BEAM_IDD;
private _lb = _display displayCtrl DIALOG_BEAM_LB_IDC;
private _button = _display displayCtrl DIALOG_BEAM_BU_IDC;

// Listbox füllen
{
    private _pos = _x select 0;
    private _name = _x select 1;
    private _lvl = _x select 3;

    private _index = lbAdd [DIALOG_BEAM_LB_IDC, _name];

    switch _lvl do
    {
        case 1: {_lb lbSetColor [_index, DIALOG_BEAM_LB_COLOR_LVL_ONE]};
        case 2: {_lb lbSetColor [_index, DIALOG_BEAM_LB_COLOR_LVL_TWO]};
        default {_lb lbSetColor [_index, DIALOG_BEAM_LB_COLOR_DEFAULT]};
    };
} forEach GVAR(box);

// Karte bei Wahl eines Beampunktes verschieben
_lb ctrlAddEventHandler [ "LBSelChanged",
{
    private _display = findDisplay DIALOG_BEAM_IDD;
    private _index = _display displayCtrl DIALOG_BEAM_LB_IDC;
    [lbCurSel _index] call FUNC(beamMapmove);
}];

// Beamen ausführen
_button ctrlAddEventHandler [ "ButtonClick",
{
    private _display = findDisplay DIALOG_BEAM_IDD;
    private _index = _display displayCtrl DIALOG_BEAM_LB_IDC;
    [lbCurSel _index] call FUNC(beam2);
    closeDialog 0;
}];
