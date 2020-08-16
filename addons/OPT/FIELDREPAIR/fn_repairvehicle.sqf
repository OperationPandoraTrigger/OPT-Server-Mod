/**
* Author: James
* field repair of a vehicle
*
* Arguments:
* 0: <OBJECT> vehicle to repair
*
* Return Value:
* None
*
* Example:
* [vehicle] call fnc_repairVehicle.sqf;
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
    hint Format ["%1 \n\n %2",_header,_txt];
};

// if conditions are not met
if (not alive player or (player distance _veh) > 10 or (vehicle player != player) or speed _veh > 3) exitWith 
{
    private _txt = MLOC(REPAIR_CONDITIONS);
    private _header = MLOC(FIELD_REPAIR_HEADER);
    hint Format ["%1 \n\n %2",_header,_txt];
};

// if player has no tool kit or vehicle was repaired more often than free repair
if (!(typeOf player in GVAR(pioniers)) and (_veh getVariable [QGVAR(longRepairTimes), 0] > 0)) exitWith 
{
    private _txt = MLOC(NEED_TOOLKIT);
    private _header = MLOC(FIELD_REPAIR_HEADER);
    hint Format ["%1 \n\n %2",_header,_txt];
};

GVAR(mutexAction) = true;

player selectWeapon primaryWeapon player;    // psycho, animation only able to play while primary weapon is in use
sleep 1;
private _lastPlayerState = animationState player;

player playMove "Acts_carFixingWheel";
sleep 0.5;
private _maxlength = (_veh getVariable [QGVAR(longrepair), [_veh] call FUNC(getPartsRepairTime)]) min GVAR(DEFAULT_FIELDREPAIR_MAX_REP_TIME);
private _vehname = getText ( configFile >> "CfgVehicles" >> typeOf(_veh) >> "displayName");

// was vehicle already repaired?
private _startTime = time;
if (_veh getVariable [QGVAR(repTimeLeft), 0] > 0) then 
{
    _maxlength = (_veh getVariable QGVAR(repTimeLeft)) max 10; // reduce max length
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
        private _txt = MLOC(REPAIR_FINISHED);
        private _header = MLOC(FIELD_REPAIR_HEADER);
        hint Format ["%1 \n\n %2",_header,_txt];

        [_veh] remoteExecCall [QFUNC(partRepair), _veh, false]; // called where vehicle is local!

        _veh setVariable [QGVAR(longRepairTimes), (_veh getVariable [QGVAR(longRepairTimes), 0]) + 1 , true ];
        _veh setVariable [QGVAR(repTimeLeft), 0, true];
    },
    {   
        (_this select 0) params ["_veh", "_startTime", "_maxlength"];

        private _txt = MLOC(REPAIR_INTERRUPTED);
        private _header = MLOC(FIELD_REPAIR_HEADER);
        hint Format ["%1 \n\n %2",_header,_txt];

        _veh setVariable [QGVAR(repTimeLeft), _maxlength - (time - _startTime), true];
    },
    format[MLOC(REPAIR_MSG_STRNG), _maxlength, _vehname],
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