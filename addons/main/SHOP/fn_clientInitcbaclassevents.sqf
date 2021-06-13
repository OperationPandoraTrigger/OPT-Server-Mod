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

/* CLASS EH */
/* EXAMPLE FROM https://github.com/CBATeam/CBA_A3/wiki/Adding-Event-Handlers-to-Classes-of-Objects
["CAManBase", "fired", {systemChat str _this}] call CBA_fnc_addClassEventHandler;
This will show a chat message every time a soldier fires a weapon. It is advised to use CAManBase instead of Man when dealing with soldiers, because Man is the parent class of all animals, including the randomly spawning rabbits, snakes and fish. Using CAManBase slightly reduces the overhead that would happen when any of these spawn (which actually happens pretty frequently).

["AllVehicles", "getIn", {hint str _this}] call CBA_fnc_addClassEventHandler;
This event happens every time a soldier enters a vehicle.
*/

// fügt auf allen clients einen Add Action Eintrag für umgekippte Fahrzeuge hinzu
// ersetzt player add action in onPlayerRespawn (viel performanter, da kein pulling)
["LandVehicle", "init",
{
    params ["_vec"];
    _vec addAction
    [
        format["<t color='#00D3BF'>%1</t>", MLOC(FLIP_VEH)],
        {[] call FUNC(unFlip);},
        [],
        0,
        false,
        true,
        "",
        format["[_target, player] call %1", QFUNC(flipCheck)]
    ];
    /*
    _vec addAction
    [
        "<t color='#00D3BF'>OWNER</t>",
        { cursorTarget remoteExecCall ["OPT_HC_fnc_check", 2]; }
    ];
    */
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["Air", "init",
{
    params ["_vec"];
    _vec addAction
    [
        format["<t color='#00D3BF'>%1</t>", MLOC(FLIP_VEH)],
        {[] call FUNC(unFlip);},
        [],
        0,
        false,
        true,
        "",
        format["[_target, player] call %1", QFUNC(flipCheck)]
    ];
    /*
    _vec addAction
    [
        "<t color='#00D3BF'>OWNER</t>",
        { cursorTarget remoteExecCall ["OPT_HC_fnc_check", 2]; }
    ];
    */
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

// Engine EH für Piloten -> Log transportierte Soldaten
["Air", "GetIn",
{
    /*
    vehicle: Object - Vehicle the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    unit: Object - Unit that entered the vehicle
    (Since Arma 3 v1.36)
    turret: Array - turret path
    */
    params ["_vec", "_pos", "_unit"];

    // speichere Pilot als Variable des Objekts Heli
    if (_pos isEqualTo "driver") then
    {
        _vec setVariable [QGVAR(transport_pilot), _unit];
    };

    // speichere aktuellen Ort an der Einheit
    _unit setVariable [QGVAR(transport_start_loc), getPosASL _vec];
}] call CBA_fnc_addClassEventHandler;

["Air", "GetOut",
{
    /*
    vehicle: Object - Vehicle the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    unit: Object - Unit that left the vehicle
    turret: Array - turret path (since Arma 3 v1.36)
    */
    params ["_vec", "_pos", "_unit", "_turret"];
    if (_unit isEqualTo player) then
    {
        // logge transport von Spielern
        _this call FUNC(writeTransportDistance);
    };
    if (local _vec) then
    {
        _vec remoteExecCall ["OPT_HC_fnc_transfer", 2];
    };
}] call CBA_fnc_addClassEventHandler;

// Engine EH für Fahrer -> Log transportierte Soldaten
["LandVehicle", "GetIn",
{
    /*
    vehicle: Object - Vehicle the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    unit: Object - Unit that entered the vehicle
    (Since Arma 3 v1.36)
    turret: Array - turret path
    */
    params ["_vec", "_pos", "_unit"];

    // speichere Fahrer als Variable des Objekts
    if (_pos isEqualTo "driver") then
    {
        _vec setVariable [QGVAR(transport_driver), _unit];
    };

    // speichere aktuellen Ort an der Einheit
    _unit setVariable [QGVAR(transport_start_loc), getPosASL _vec];
}] call CBA_fnc_addClassEventHandler;

["LandVehicle", "GetOut",
{
    /*
    vehicle: Object - Vehicle the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    unit: Object - Unit that left the vehicle
    turret: Array - turret path (since Arma 3 v1.36)
    */
    params ["_vec", "_pos", "_unit", "_turret"];
    if (_unit isEqualTo player) then
    {
        // logge transport von Spielern
        #define MinDistance 50

        private _driver = _vec getVariable [QGVAR(transport_driver), objNull];

        // end script if either player or pilot is unconscious
        if ((lifeState _unit isEqualTo "INCAPACITATED") or (lifeState _driver isEqualTo "INCAPACITATED")) exitWith {};

        private _dis = (getPos _vec) distance2D (_unit getVariable QGVAR(transport_start_loc));

        if (_pos in ["cargo", "gunner"] and (_dis > MinDistance)) then
        {
            // Log Distanz
            ["Transport", "Drive", [getPlayerUID _unit, name _unit, side _unit, getPlayerUID _driver, name _driver, side _driver, _dis]] remoteExecCall ["OPT_LOGGING_fnc_writelog", 2, false];
        };
    };
    if (local _vec) then
    {
        _vec remoteExecCall ["OPT_HC_fnc_transfer", 2];
    };
}] call CBA_fnc_addClassEventHandler;

["Ship", "GetOut",
{
    params ["_vec", "_pos", "_unit", "_turret"];
    if (local _vec) then
    {
        _vec remoteExecCall ["OPT_HC_fnc_transfer", 2];
    };
}] call CBA_fnc_addClassEventHandler;
