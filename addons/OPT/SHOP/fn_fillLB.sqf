/**
* Description:Box befüllen
* 
* 
* Author:
* [GNC]Lord-MDB
*
* Arguments:
* 0 <Number> idd des Controls
* 1 <Number> Idc der Listbox
* 2 <String> Text der listbox
* 3 <String> Bild verweis
* 4 <String> Angehängten Datensatz zum Listbox Eintrag
*
* Return value:
* 0 <Bool> Fehlerfreie Ausführung
*
* Server Only:
* No
* 
* Global:
* No
* 
* API:
* No
* 
* Example:
* 
*/

#include "macros.hpp"

params [
    ["_idd", 0, [1], 1], 
    ["_idc", 0, [1], 1],
    ["_txtToAdd", "", [["s"]]],
    ["_picToAdd", "", [["s"]]],
    ["_dataToAdd", "", [["s"]]]
];

if (_idd == 0 or _idc == 0) exitWith {false};
if (_txtToAdd isEqualTo "") exitWith {false};
if ((count _picToAdd != count _txtToAdd) or (count _dataToAdd != count _txtToAdd)) exitWith {false};

private _display = findDisplay _idd;
private _lb = _display displayCtrl _idc;

{
    _lb lbAdd _x;

    if (count _dataToAdd > 0) then {
        _lb lbSetData [_forEachIndex, (_dataToAdd select _forEachIndex)];
    };
    if (count _picToAdd > 0) then {
        _lb lbSetPicture [_forEachIndex, (_picToAdd select _forEachIndex)];
    };

} forEach _txtToAdd;

true
