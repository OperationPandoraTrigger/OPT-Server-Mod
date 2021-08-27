/**
* Description:
* Abschluss der Mission mit Bildschrimanzeige auf dem Client
*
* Author:
* Lord-MDB
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* No
*
* Public:
* No
*
* Global:
* No
*
* API:
* No
*
* Example:
* [] call FUNC(ende);
*/
#include "macros.hpp"

GVAR(END) = "END_DRAW";
GVAR(VICTORY) = true;

private _playerFaction = "";
switch playerSide do
{
    case west:
    {
        _playerFaction = EGVAR(SECTORCONTROL,nato_faction);
    };

    case east:
    {
        _playerFaction = EGVAR(SECTORCONTROL,csat_faction);
    };
};

// Ermittle Sieger
private _winnerFaction = "";
if (EGVAR(SECTORCONTROL,csat_points) != EGVAR(SECTORCONTROL,nato_points)) then
{
    if (EGVAR(SECTORCONTROL,csat_points) > EGVAR(SECTORCONTROL,nato_points)) then
    {
        _winnerFaction = EGVAR(SECTORCONTROL,csat_faction);
    }
    else
    {
        _winnerFaction = EGVAR(SECTORCONTROL,nato_faction);
    };
    GVAR(END) = "END_" + _winnerFaction;
};
if (_playerFaction != _winnerFaction) then {GVAR(VICTORY) = false};

//End Bildschirm
private _camPos = vehicle player;
GVAR(camera) = "camera" camCreate [(getPos _camPos Select 0), (getPos _camPos Select 1), 50];
GVAR(camera) cameraEffect ["internal", "back"];
GVAR(camera) camSetTarget _camPos;
GVAR(camera) camCommit 1;

showCinemaBorder false;
GVAR(camera) camSetRelPos [0,10,5];
GVAR(camera) camCommit 10;

[{
    removeAllWeapons player;
    [GVAR(END), GVAR(VICTORY), true] call BIS_fnc_endMission;
    GVAR(camera) cameraEffect ["terminate", "back"];
    camDestroy GVAR(camera);
}, 10, ""] call CFUNC(wait);
