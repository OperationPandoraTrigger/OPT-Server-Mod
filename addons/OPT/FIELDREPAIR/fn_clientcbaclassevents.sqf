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

["LandVehicle", "init", 
{
    params ["_vec"];
    
    _vec addAction [
        "<t color='#ff0000'>" + localize "STR_FIELD_REPAIR" + "</t>", 
        {[_this select 0] call FUNC(repairVehicle)},
        [], 
        -1, 
        false,
        true, 
        '',
        QUOTE([_target] call FUNC(needRepair)),
        10
    ];

    _vec addAction [
        "<t color='#ff0000'>" + localize "STR_FIELD_REFUEL" + "</t>", 
        {[_this select 0] call FUNC(refuelVehicle)},
        [], 
        -1, 
        false,
        true, 
        '',
        QUOTE([_target] call FUNC(vehicleNoFuel)),
        10
    ];

    _vec addAction [
        "<t color='#008507'>" + localize "STR_SERIOUS_REPAIR" + "</t>", 
        {[_this select 0] call FUNC(heavyRepair)},
        [], 
        -1, 
        false, 
        true, 
        '',
        format["_truck = vehicle _this; ([_target] call %1 || damage _target > 0.01)  and _truck getVariable ['%2', -1] > 0 and {alive _target} and {speed _truck < 3} and (_truck distance _target) < 25", QFUNC(vehicleDamagedLight), QGVAR(repair_cargo)]
    ];

    if (typeOf _vec  == "OPT_O_T_Truck_03_repair_ghex_F" || typeOf _vec == "OPT_O_Truck_03_repair_F" || typeOf _vec  == "OPT_B_Truck_01_Repair_F" || typeOf _vec  == "OPT_B_Truck_01_Repair_ghex_F" || typeOf _vec  == "OPT_I_Truck_02_box_F") then 
    {
        _vec setVariable [QGVAR(repair_cargo), GVAR(DEFAULT_REPAIR_TRUCK_USES), true];

        _vec addAction [
            "<t color='#ffff00'>" + localize "STR_CHECK_REPAIRS" + "</t>", 
            {[_this select 0] call FUNC(checkRepairs)},
            [], 
            -1, 
            false, 
            true, 
            '',
            '',
            20
        ];
    };

}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["Air", "init", {
    params ["_vec"];

    _vec addAction [
        "<t color='#ff0000'>" + localize "STR_FIELD_REPAIR" + "</t>", 
        {[_this select 0] call FUNC(repairVehicle)},
        [], 
        -1, 
        false,
        true, 
        '',
        QUOTE([_target] call FUNC(needRepair)),
        10
    ];

    _vec addAction [
        "<t color='#dd0000'>" + localize "STR_FIELD_REFUEL" + "</t>", 
        {[_this select 0] call FUNC(refuelVehicle)},
        [], 
        -1, 
        false,
        true, 
        '',
        QUOTE([_target] call FUNC(vehicleNoFuel)),
        10
    ];

    _vec addAction [
        "<t color='#008507'>" + localize "STR_SERIOUS_REPAIR" + "</t>", 
        {[_this select 0] call FUNC(heavyRepair)},
        [], 
        -1, 
        false, 
        true, 
        '',
        format["_truck = vehicle _this; ([_target] call %1 || damage _target > 0.01)  and _truck getVariable ['%2', -1] > 0 and {alive _target} and {speed _truck < 3} and (_truck distance _target) < 20", QFUNC(vehicleDamagedLight), QGVAR(repair_cargo)
        ]
    ];
    }, nil, nil, true] call CBA_fnc_addClassEventHandler;