/**
* Author: Senshi
* field refuel of a vehicle
*
* Arguments:
* 0: <OBJECT> vehicle to refuel
*
* Return Value:
* None
*
* Example:
* [vehicle] call func(refuelVehicle);
*
*/
#include "macros.hpp"

params [["_veh", objNull]];

if (_veh isEqualTo objNull) exitWith {false};

// if another action is ongoing
if (GVAR(mutexAction)) exitWith
{
    private _txt = MLOC(ANOTHER_ACTION);
    private _header = MLOC(FIELD_REPAIR_HEADER);
    hint format ["%1\n\n%2", _header, _txt];
};

// if conditions are not met
if (not alive player or (player distance _veh) > 10 or (vehicle player != player) or speed _veh > 3) exitWith
{
    private _txt = MLOC(REPAIR_CONDITIONS);
    private _header = MLOC(FIELD_REPAIR_HEADER);
    hint format ["%1\n\n%2", _header, _txt];
};

// if player has no tool kit or vehicle was repaired more often than free repair
if (!(typeOf player in EGVAR(RULES,engineers)) and (_veh getVariable [QGVAR(freeRefuelCount), 0] > 0)) exitWith
{
    private _txt = MLOC(NEED_TOOLKIT);
    private _header = MLOC(FIELD_REPAIR_HEADER);
    hint format ["%1\n\n%2", _header, _txt];
};

GVAR(mutexAction) = true;

player selectWeapon primaryWeapon player;    // psycho, animation only able to play while primary weapon is in use
sleep 1;
private _lastPlayerState = animationState player;

// player playActionNow "medicStartRightSide";
player playMove "Acts_carFixingWheel";
sleep 0.5;
private _maxlength = GVAR(DEFAULT_FREE_REFUELS_DURATION);
private _vehname = getText ( configFile >> "CfgVehicles" >> typeOf(_veh) >> "displayName");

// was vehicle already refueled?
private _startTime = time;
if (_veh getVariable [QGVAR(refuelTimeLeft), 0] > 0) then
{
    _maxlength = (_veh getVariable QGVAR(refuelTimeLeft)) max 10; // reduce max length, but at least 10 sec
};

/*
    * Arguments:
    * 0: Total Time (in game "time" seconds) <NUMBER>
    * 1: Arguments, passed to condition, fail and finish <ARRAY>
    * 2: On Finish: Code called or STRING raised as event. <CODE, STRING>
    * 3: On Failure: Code called or STRING raised as event. <CODE, STRING>
    * 4: (Optional) Localized Title <STRING>
    * 5: Code to check each frame (Optional) <CODE>
    * 6: Exceptions for checking EFUNC(common,canInteractWith) (Optional)<ARRAY>
*/
[
    _maxlength,
    [_veh, _startTime, _maxlength],
    {
        (_this select 0) params ["_veh"];

        player switchMove "";
        private _txt = MLOC(REFUEL_FINISHED);
        private _header = MLOC(FIELD_REPAIR_HEADER);
        hint format ["%1\n\n%2", _header, _txt];

        [_veh] remoteExecCall [QFUNC(setMinFuel), _veh, false]; // called where vehicle is local!

        _veh setVariable [QGVAR(freeRefuelCount), (_veh getVariable [QGVAR(freeRefuelCount), 0]) + 1 , true ];
    },
    {
        (_this select 0) params ["_veh", "_startTime", "_maxlength"];

        private _txt = MLOC(REFUEL_INTERRUPTED);
        private _header = MLOC(FIELD_REPAIR_HEADER);
        hint format ["%1\n\n%2", _header, _txt];

        _veh setVariable [QGVAR(refuelTimeLeft), _maxlength - (time - _startTime), true];
    },
    format[MLOC(REFUEL_MSG_STRING), _maxlength, _vehname],
    {
        (_this select 0) params ["_veh"];
        alive player and (player distance _veh) < 10 and
        !(player getVariable ["ACE_isUnconscious", false]) and
        isNull objectParent player and
        speed _veh < 3
    }
] call ace_common_fnc_progressBar;

GVAR(mutexAction) = false;

true
