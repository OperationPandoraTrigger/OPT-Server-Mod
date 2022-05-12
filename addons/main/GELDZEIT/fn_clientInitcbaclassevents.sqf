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
        {_this call FUNC(haftladungen)},
        [],
        -1,
        false,
        true,
        "",
        "(nearestObject [_target, 'PipeBombBase'] distance _target < 7 && alive _target && speed _target < 3 && vehicle player == player)",
        8
    ];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

// fügt auf allen clients einen Add Action Eintrag für den Berggang hinzu
["LandVehicle", "init",
{
    params ["_veh"];
    _veh addAction
    [
        format["<t color='#00D3BF'>%1</t>", MLOC(BERGGANG)],
        {[_this select 0] call FUNC(berggang)},
        [],
        0,
        false,
        true,
        "",
        format["[_target] call %1", QFUNC(berggangCheck)],
        5
    ];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;
