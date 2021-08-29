/**
* Description:
* Teleport player and their vehicle to selected destination.
* Check for truce time and level of teleport location.
*
* Author:
* James
*
* Edit by:
* Manu, form
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
* Example:
* [0] spawn EFUNC(beam,beam);
*/
#include "macros.hpp"

params
[
    ["_idx", -1, [0], 1]
];

if (_idx == -1) exitWith {};

private _beamingAllowed = true;
private _beamingRestrictedVehicle = false;
private _isBeamDuringMissionForbidden = true;
private _beamLevel = (GVAR(box) select _idx) select 2;
private _beamPosition = (GVAR(box) select _idx) select 0;

if (_beamingAllowed) then
{
    player setPos _beamPosition;
};

closeDialog 0;
