/**
* Author: Lord
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

// Haftladungen
["LandVehicle", "init", 
{
    params ["_veh"];
    _veh addAction [
        format["<t color=""#f0f24e"">%1</t>", MLOC(HAFTLADUNG)], 
        {[_this select 0] call FUNC(haftladungen)},
        [], 
        -1, 
        false, 
        true, 
        "",
        "(nearestObject [player, 'PipeBombBase'] distance player < 7 && alive _target && speed _target < 3 && vehicle player == player)",
        8
    ];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;
