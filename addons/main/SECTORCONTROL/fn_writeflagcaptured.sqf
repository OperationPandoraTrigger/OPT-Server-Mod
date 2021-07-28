/**
* Author: James
* log changed capture status of given flag
*
* Arguments:
* 0: <OBJECT> flag that was captured
* 1: <OBJECT> unit that captured the flag
*
* Return Value:
* None
*
* Example:
* [flag, player] call writeFlagCaptured.sqf;
*
* Server only:
* yes
*
* Public:
* no
*/
#include "macros.hpp"

params [
    ["_flag", objNull, [objNull], 1],
    ["_unit", objNull, [objNull], 1]
];

/* VALIDATION */
if (_flag isEqualTo objNull or _unit isEqualTo objNull) exitWith{};
if !(_flag in GVAR(nato_flags) or _flag in GVAR(csat_flags)) exitWith{};

// Logge Fahnen-Eroberung
["Flag", "Conquer", [_flag, getPlayerUID _unit, name _unit, side _unit, _flag distance2D _unit]] call EFUNC(LOGGING,writelog);

private _flagSide = sideUnknown;
if (_flag in GVAR(nato_flags)) then
{
    _flagSide = west;
}
else
{
    if (_flag in GVAR(csat_flags)) then
    {
        _flagSide = east;
    };
};

// log flag capture for ocap2
["ocap_handleCustomEvent", ["captured", [
    "flag",
    name _unit,
    str side group _unit,
    str _flagSide,
    getPosATL _flag
]]] call CBA_fnc_serverEvent;
