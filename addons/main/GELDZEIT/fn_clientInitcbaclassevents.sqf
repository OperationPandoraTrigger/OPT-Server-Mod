/**
* Author: James
* initialize CBA class EH
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initCBAClassEvents.sqf;
*
*/
#include "macros.hpp"

// Haftladungen (aber nicht auf der Livonia-Karte!)
if !("Enoch" isEqualTo worldName) then
{
    ["LandVehicle", "init", 
    {
        params ["_vec"];

        _vec addAction [
            format["<t color=""#f0f24e"">%1</t>", MLOC(HAFTLADUNG)], 
            {[_this select 0] call FUNC(haftladungen)},
            [], 
            -1, 
            false, 
            true, 
            '',
            "_veh = vehicle _this; ((alive _target) and (speed _veh < 3) and (_veh distance _target) < 8 and vehicle player == player)"
        ];
    }, nil, nil, true] call CBA_fnc_addClassEventHandler;
};
