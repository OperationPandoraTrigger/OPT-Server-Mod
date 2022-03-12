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

// Überprüfung ob Spieler in der Nähe eines Beampunktes ist (wichtig für Hotkey-Aufruf)
private _nearBeamSpot = false;

if ((playerSide == west) and ((player distance Teleport_NATO_Basis1) < MIN_DISTANCE_TO_BEAMSPOT)) then
{
    _nearBeamSpot = true;
};

if ((playerSide == west) and ((player distance Teleport_NATO_Basis2) < MIN_DISTANCE_TO_BEAMSPOT)) then
{
    _nearBeamSpot = true;
};

if ((playerSide == east) and ((player distance Teleport_CSAT_Basis1) < MIN_DISTANCE_TO_BEAMSPOT)) then
{
    _nearBeamSpot = true;
};

if ((playerSide == east) and ((player distance Teleport_CSAT_Basis2) < MIN_DISTANCE_TO_BEAMSPOT)) then
{
    _nearBeamSpot = true;
};

if ((playerSide == east) and ((player distance Teleport_CSAT_Basis3) < MIN_DISTANCE_TO_BEAMSPOT)) then
{
    _nearBeamSpot = true;
};

// Abbrechen wenn kein eigenes Beam-Pad in der Nähe ist
if (!_nearBeamSpot) exitWith {};

// Array mit gültigen Beampunkten füllen
GVAR(box) = [playerSide, true] call FUNC(getbeampoints);

// Bei nur einem gültigen Beampunkt sofort beamen ohne Dialog
if (count GVAR(box) == 1) exitWith
{
    [0, 0] call FUNC(beam);
};

// Fahrzeug abbremsen, bevor der Dialog aufgeht
vehicle player setVelocity [0, 0, 0];
createDialog "DialogBeam";

#define DIALOG_BEAM_IDD 10000
#define DIALOG_BEAM_LB_IDC 10002
#define DIALOG_BEAM_BU_IDC 10004

#define DIALOG_BEAM_LB_COLOR_DEFAULT [ 0, 1, 0, 1 ]
#define DIALOG_BEAM_LB_COLOR_LVL_ONE [ 1, 1, 1, 1 ]
#define DIALOG_BEAM_LB_COLOR_LVL_TWO [0.7, 0.6, 0,1]

private _display = findDisplay DIALOG_BEAM_IDD;
private _lb = _display displayCtrl DIALOG_BEAM_LB_IDC;
private _button = _display displayCtrl DIALOG_BEAM_BU_IDC;

// Listbox füllen
{
    private _pos = _x select 0;
    private _name = _x select 2;
    private _lvl = _x select 4;
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
    private _listbox = _display displayCtrl DIALOG_BEAM_LB_IDC;
    private _index = lbCurSel _listbox;
    private _beamLevel = (GVAR(box) select _index) select 4;

    if (_beamLevel > 0) then
    {
        [_index] call FUNC(beam);
    }
    else
    {
        // Exakte positionierung (SearchRadius=0) bei Heimat- und Außenbasis
        [_index, 0] call FUNC(beam);
    };
    closeDialog 0;
}];
