/**
* Author: form
* Function to track travel distance of player.
* Has to be called in intervals. Shorter interval means distance is more accurate.
* When player changes vehicle or dies, the distance gets logged.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* call EFUNC(LOGGING,tracker);
*
*/
#include "macros.hpp"

#define TRAVELMODE_NONE 0
#define TRAVELMODE_WALK 1
#define TRAVELMODE_SWIM 2
#define TRAVELMODE_BOAT 3
#define TRAVELMODE_DRIVE 4
#define TRAVELMODE_FLY 5

private _position = position player;
private _travelMode = TRAVELMODE_NONE;
private _isPilot = false;
private _distance = 0;

// Bestimmung der Fortbewegungsart
if (vehicle player == player) then
{
    _isPilot = true;
    if (surfaceIsWater position player) then {_travelMode = TRAVELMODE_SWIM}
    else {_travelMode = TRAVELMODE_WALK};
}
else
{
    if (currentPilot vehicle player == player) then {_isPilot = true};

    if (vehicle player isKindOf "Air") then {_travelMode = TRAVELMODE_FLY}
    else
    {
        if (vehicle player isKindOf "Ship") then {_travelMode = TRAVELMODE_BOAT}
        else {_travelMode = TRAVELMODE_DRIVE};
    };
};

// Es liegen Daten vor
if (!isNil QGVAR(LAST_POSITION)) then
{
    _distance = GVAR(LAST_DISTANCE) + (_position distance GVAR(LAST_POSITION));

    // Veränderung des Fortbewegungsmittels oder des Pilots -> Wegstrecke loggen und nullen
    if (GVAR(LAST_TRAVELMODE) != _travelMode || GVAR(LAST_ISPILOT) != _isPilot) then
    {
        switch (GVAR(LAST_TRAVELMODE)) do
        {
            case TRAVELMODE_WALK:
            {
                ["Transport", "Walk", [getPlayerUID player, name player, side player, GVAR(LAST_ISPILOT), _distance]] remoteExec [QEFUNC(LOGGING,writelog), 2];
            };

            case TRAVELMODE_SWIM:
            {
                ["Transport", "Swim", [getPlayerUID player, name player, side player, GVAR(LAST_ISPILOT), _distance]] remoteExec [QEFUNC(LOGGING,writelog), 2];
            };

            case TRAVELMODE_BOAT:
            {
                ["Transport", "Boat", [getPlayerUID player, name player, side player, GVAR(LAST_ISPILOT), _distance]] remoteExec [QEFUNC(LOGGING,writelog), 2];
            };

            case TRAVELMODE_DRIVE:
            {
                ["Transport", "Drive", [getPlayerUID player, name player, side player, GVAR(LAST_ISPILOT), _distance]] remoteExec [QEFUNC(LOGGING,writelog), 2];
            };

            case TRAVELMODE_FLY:
            {
                ["Transport", "Fly", [getPlayerUID player, name player, side player, GVAR(LAST_ISPILOT), _distance]] remoteExec [QEFUNC(LOGGING,writelog), 2];
            };
        };
        _distance = 0;
    };
};

GVAR(LAST_POSITION) = _position;
GVAR(LAST_TRAVELMODE) = _travelMode;
GVAR(LAST_ISPILOT) = _isPilot;
GVAR(LAST_DISTANCE) = _distance;
