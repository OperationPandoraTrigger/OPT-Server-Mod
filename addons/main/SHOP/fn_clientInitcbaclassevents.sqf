/**
* Author: James
* initialize Client side CBA Class Handler
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call Func(initCBAClassEvents);
*
*/
#include "macros.hpp"

// fügt auf allen clients einen Add Action Eintrag für umgekippte Fahrzeuge hinzu
["LandVehicle", "init",
{
    params ["_veh"];
    _veh addAction
    [
        format["<t color='#00D3BF'>%1</t>", MLOC(FLIP_VEH)],
        {[] call FUNC(unFlip);},
        [],
        0,
        false,
        true,
        "",
        format["[_target, player] call %1", QFUNC(flipCheck)],
        15
    ];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["Air", "init",
{
    params ["_veh"];
    _veh addAction
    [
        format["<t color='#00D3BF'>%1</t>", MLOC(FLIP_VEH)],
        {[] call FUNC(unFlip);},
        [],
        0,
        false,
        true,
        "",
        format["[_target, player] call %1", QFUNC(flipCheck)],
        15
    ];

    // Jet auf Startbahn wenden
    if (typeOf _veh in EGVAR(SHOP,planes) + EGVAR(SHOP,jets)) then
    {
        _veh addAction
        [
            format["<t color='#00FF00'>%1</t>", MLOC(ROTATE_VEH)],
            {
                params ["_target", "_caller", "_actionId", "_arguments"];
                _target setPosASL (getPosASL _target vectorAdd [0, 0, 0.2]);
                _target setdir getdir nearestObject [_target, 'Land_HelipadSquare_F'];
            },
            nil,
            5,
            false,
            true,
            "",
            "(nearestObject [_target, 'Land_HelipadSquare_F'] distance _target < 50 && alive _target && speed _target < 3 && vehicle player == player)",
            50,
            false,
            "",
            ""
        ];
    };

    //erhöhter Treibstoffverbrauch bei Drohnen
    if (typeOf _veh in GVAR(uavs)) then
    {
        [_veh] call OPT_GELDZEIT_fnc_spritverbrauch;
    };
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["Air", "GetIn",
{
    /*
    vehicle: Object - Vehicle the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    unit: Object - Unit that entered the vehicle
    (Since Arma 3 v1.36)
    turret: Array - turret path
    */
    params ["_veh", "_pos", "_unit"];

    // speichere Pilot als Variable des Objekts Heli
    if (_pos isEqualTo "driver") then
    {
        //erhöhter Treibstoffverbrauch bei Lufteinheiten
        [_veh] call OPT_GELDZEIT_fnc_spritverbrauch;
    };

    if (_unit isEqualTo player) then {true call EFUNC(LOGGING,tracker)}; // Logge Reisedistanz
}] call CBA_fnc_addClassEventHandler;

["Air", "GetOut",
{
    /*
    vehicle: Object - Vehicle the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    unit: Object - Unit that left the vehicle
    turret: Array - turret path (since Arma 3 v1.36)
    */
    params ["_veh", "_pos", "_unit", "_turret"];
    if (_unit isEqualTo player) then {true call EFUNC(LOGGING,tracker)}; // Logge Reisedistanz
}] call CBA_fnc_addClassEventHandler;

["LandVehicle", "GetIn",
{
    /*
    vehicle: Object - Vehicle the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    unit: Object - Unit that entered the vehicle
    (Since Arma 3 v1.36)
    turret: Array - turret path
    */
    params ["_veh", "_pos", "_unit"];
    if (_unit isEqualTo player) then {true call EFUNC(LOGGING,tracker)}; // Logge Reisedistanz
}] call CBA_fnc_addClassEventHandler;

["LandVehicle", "GetOut",
{
    /*
    vehicle: Object - Vehicle the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    unit: Object - Unit that left the vehicle
    turret: Array - turret path (since Arma 3 v1.36)
    */
    params ["_veh", "_pos", "_unit", "_turret"];
    if (_unit isEqualTo player) then {true call EFUNC(LOGGING,tracker)}; // Logge Reisedistanz
}] call CBA_fnc_addClassEventHandler;

["Ship", "GetIn",
{
    /*
    vehicle: Object - Vehicle the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    unit: Object - Unit that entered the vehicle
    (Since Arma 3 v1.36)
    turret: Array - turret path
    */
    params ["_veh", "_pos", "_unit"];
    if (_unit isEqualTo player) then {true call EFUNC(LOGGING,tracker)}; // Logge Reisedistanz
}] call CBA_fnc_addClassEventHandler;

["Ship", "GetOut",
{
    /*
    vehicle: Object - Vehicle the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    unit: Object - Unit that left the vehicle
    turret: Array - turret path (since Arma 3 v1.36)
    */
    params ["_veh", "_pos", "_unit", "_turret"];
    if (_unit isEqualTo player) then {true call EFUNC(LOGGING,tracker)}; // Logge Reisedistanz
}] call CBA_fnc_addClassEventHandler;
