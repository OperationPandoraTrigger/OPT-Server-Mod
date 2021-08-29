/**
* Description:
* Verschieb die Minimap auf das Ausgewählte Ziel.
*
*
* Author:
* [GNC]Lord-MDB, form
*
* Arguments:
* 0: <NUMBER> current selected index of listbox control
*
* Return Value:
* None
*
* Server only:
* no
*
* Public:
* no - should be called from beam dialog
*
* Global:
* no
*
* Sideeffects:
* verschieb die Minimap im Dialog
*
*
*
* Example:
* [0] spawn EFUNC(beam,beamMovemap);
*/
#include "macros.hpp"

params
[
    ["_idx", -1, [0], 1]
];

if (_idx == -1) exitWith {};

private _fcDialog = findDisplay 444001;
private _mapCtrl = _fcDialog displayCtrl 10007;
private _mapFocus = (GVAR(box) select _idx) select 0;

_mapCtrl ctrlMapAnimAdd [0, 0.1, _mapFocus];
ctrlMapAnimCommit _mapCtrl;
_mapCtrl ctrlCommit 0;
