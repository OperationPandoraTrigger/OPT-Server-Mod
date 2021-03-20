/**
* Author: James
* check whether player can drag target 
*
* Arguments:
* 0: <OBJECT> target add action is attached to
* 1: <OBJECT> unit that called the add action
*
* Return Value:
* 0: <BOOL> true - patient can be dragged, false - otherwise
*
* Example:
* [cursorObject, player] call fnc_checkDragging.sqf;
*
*/
#include "macros.hpp"

params ["_target", "_caller"];

private _return = false;

private _isPlayerUnconscious = _caller getVariable "OPT_isUnconscious";

if (!alive _caller || {_isPlayerUnconscious == 1} || {GVAR(OPT_isDragging)} || {isNil "_target"} || {!alive _target}  || {(_target distance _caller) > 5}) exitWith 
{
	_return;
};

// Target of the action
private _isTargetUnconscious = false;
private _isDragged = _target getVariable "OPT_isDragged"; 
private _isPlayerUnconscioustarget = _target getVariable "OPT_isUnconscious";

if (_isPlayerUnconscioustarget == 1) then
{
	_isTargetUnconscious = 	true;
};	

if (_isTargetUnconscious && (_isDragged == 0)) then 
{
	_return = true;
};

_return
