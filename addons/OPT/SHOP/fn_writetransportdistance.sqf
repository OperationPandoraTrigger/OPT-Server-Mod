/**
* Author: James
* log transport distance from a unit that has left a transport helicopter
*
* Arguments:
* 0: <OBJECT> transport vehicle
* 1: <STRING> the vehicle position the unit had occupied
* 2: <OBJECT> unit that left vehicle  
*
* Return Value:
* None
*
* Example:
* [heli, "cargo", player] call func(writeTransportDistance);
*
* Server only:
* yes
*
* Global:
* no
*
* Public:
* no
*/
#include "macros.hpp"

params [
   ["_vec", objNull, [objNull], 1],
   ["_pos", "s", ["s"], 1],
   ["_unit", objNull, [objNull], 1]
];

private _distanceFromBase = 1000;

//if (_vec isEqualTo objNull or _unit isEqualTo objNull) exitWith{};

//if (isPlayer) exitWith{};

private _pilot = _vec getVariable [QGVAR(transport_pilot), objNull];

// end script if either player or pilot is unconscious
private _condition = (_unit getVariable "ACE_isUnconscious") or (_pilot getVariable "ACE_isUnconscious");
if (_condition) exitWith {};

private _dis = (getPos _vec) distance2D (_unit getVariable QGVAR(transport_start_loc));

if (_pos in ["cargo", "gunner"] and (_dis > _distanceFromBase)) then 
{
    private _NAME = ""; 
    private _SIDE = civilian; 
    
    if (_pilot isEqualTo objNull) then
    {
        _NAME = "Unbekannt"; 
        _SIDE = SIDE _unit;     
    }
    else
    {
        _NAME = NAME _pilot; 
        _SIDE = SIDE _pilot;  
    };    


    private _message = format[
        "%1 (%2) wurde von %3 (%4) eingeflogen (%5 m)", 
        NAME _unit, 
        SIDE _unit,  
        _NAME, 
        _SIDE,
        _dis
    ];

    // Log
    private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
    diag_log format["[%1] (%2) Log: %3 --- %4","OPT","Transport",_timestamp,_message];
};
