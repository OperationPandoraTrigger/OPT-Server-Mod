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
* [] call EFUNC(beam,beamDialog);
*/

#include "macros.hpp"

//Dialog Initalisieren
createDialog "DialogBeam";

//dialog
#define DIALOG_BEAM_IDD 10000
#define DIALOG_BEAM_LB_IDC 10002
#define DIALOG_BEAM_BU_IDC 10004
#define DIALOG_ADDBEAM_IDC 1413

#define DIALOG_BEAM_LB_COLOR_DEFAULT [ 0, 1, 0, 1 ]
#define DIALOG_BEAM_LB_COLOR_LVL_ONE [ 1, 0.5, 0.5, 1 ]
#define DIALOG_BEAM_LB_COLOR_LVL_TWO [ 1, 1, 0, 1 ]

#define BEAM_ACTION_ADD_BEAM 'Beampunkt-Verwaltung'
#define BEAM_MAX_LOCATIONS 5

private _display = findDisplay DIALOG_BEAM_IDD;
private _lb = _display displayCtrl DIALOG_BEAM_LB_IDC;
private _button = _display displayCtrl DIALOG_BEAM_BU_IDC;

GVAR(box) = [];

//Form hier die anbinden an die Funktion. 
//GVAR(box) = [playerSide] call FUNC(Beampunkte);

private _daten_beampunkte = [];
GVAR(beam_bezugpunkt) = [];

//Seite Feststellen
switch playerSide do
{
    //Beamorte Ermitteln und bezugpunkt setzen
    case west:
    {
        // muss noch angepasst werden
        _daten_beampunkte = EGVAR(SECTORCONTROL,AllSectors);

        //NATO Flaggen
        {
            {
                GVAR(beam_bezugpunkt) pushBack _x;
            } forEach ((EGVAR(SECTORCONTROL,AllSectors) select _x) select 1);

        } forEach EGVAR(SECTORCONTROL,nato_sectors);
    };

    case east:
    {
        // muss noch angepasst werden
        _Daten_Beampunkte = EGVAR(SECTORCONTROL,AllSectors);

        //CSAT Flaggen
        {
            {
                GVAR(beam_bezugpunkt) pushBack _x;
            } forEach ((EGVAR(SECTORCONTROL,AllSectors) select _x) select 1);

        } forEach EGVAR(SECTORCONTROL,csat_sectors);
    };

    default
    {
    };
};

//Datensatz erstellen
private _daten_beampunkte_bezug = [];
private _distance = 0;
private _Index = 1;
{
    private _sector = _Index;
    {
        _daten_beampunkte_bezug = _x;
        {    
            // Entfernung zur Fahne 
            _distance = _x distance _daten_beampunkte_bezug;
                 
            systemChat format ["DB:%1 D:%2 X:%3 S:%4 B:%5",_daten_beampunkte_bezug,(_distance/1000),_x,_sector,(_distance > GVAR(mindesfentfernung))];     
            // Daten für Box überprüfen
            if (_distance > GVAR(mindesfentfernung)) then
            {
                _distancebox = [_distance / 1000, 1, 1] call CBA_fnc_formatNumber;
                GVAR(box) pushBack [_x, format ["Beampunkt %1 (%2 km)", _sector, _distancebox]];
                _Index=_Index + 1;
            };

        } forEach GVAR(beam_bezugpunkt);  // Bezugpunkte für den vergleich

    } forEach (_x select 1);    // select 1 = flaggen positionen // select 2 = beam orte
} forEach _daten_beampunkte;

//Ende

// writing out box elements in level corresponding colors
{
    private _pos = _x select 0;
    private _name = _x select 1;
    //private _lvl = _x select 2;
    private _lvl = 0;

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

//Karte verschieben bei änderung des Beampunktes
_lb ctrlAddEventHandler [ "LBSelChanged",
{
    private _display = findDisplay DIALOG_BEAM_IDD;
    private _beampunkt = _display displayCtrl DIALOG_BEAM_LB_IDC;
    [lbCurSel _beampunkt] call FUNC(beamMapmove);

    systemChat format ["B1%1",_beampunkt];
}];

// beamen ausführen
_button ctrlAddEventHandler [ "ButtonClick",
{
    private _display = findDisplay DIALOG_BEAM_IDD;
    private _beampunkt = _display displayCtrl DIALOG_BEAM_LB_IDC;
    systemChat format ["Bgo%1","go"];
    [lbCurSel _beampunkt] call FUNC(beam2);
    closeDialog 0;

}];
