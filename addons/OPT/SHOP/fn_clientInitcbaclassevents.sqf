/**
* Author: James
* initialize server side CBA Class Handler
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
   
    _vec addAction [
        format["<t color='#00D3BF'>%1</t>", MLOC(FLIP_VEH)], 
        {[] call FUNC(unFlip);},
        [], 
        0, 
        false, 
        true, 
        "", 
        format["[_target, player] call %1", QFUNC(flipCheck)]
    ];

}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["Air", "init", 
{
    params ["_vec"]; 
        
    _vec addAction [
        format["<t color='#00D3BF'>%1</t>", MLOC(FLIP_VEH)],
        {[] call FUNC(unFlip);}, 
        [], 
        0, 
        false, 
        true, 
        "", 
        format["[_target, player] call %1", QFUNC(flipCheck)]
    ];

}, nil, nil, true] call CBA_fnc_addClassEventHandler;

// add killed EH to all kind of vehicles, either on map or later spawned via crteateVehicle arrayIntersect
// -> log kill and delete if near base
["LandVehicle", "killed", 
{
    _this remoteExecCall [QFUNC(handleDeadVehicle), 2, false];

}] call CBA_fnc_addClassEventHandler;

["Air", "killed", 
{
    _this remoteExecCall [QFUNC(handleDeadVehicle), 2, false];

}] call CBA_fnc_addClassEventHandler;

["Ship", "killed", 
{
    _this remoteExecCall [QFUNC(handleDeadVehicle), 2, false];

}] call CBA_fnc_addClassEventHandler;

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

    params ["_vec", "_pos", "_unit","_turret"];

    if (_unit isEqualTo player) then 
    {
        // logge transport von Spielern
        _this call FUNC(writeTransportDistance);
    };

}] call CBA_fnc_addClassEventHandler;