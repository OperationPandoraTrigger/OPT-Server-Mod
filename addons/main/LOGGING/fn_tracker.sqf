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
private _pilot = objNull;
private _distance = 0;

// Bestimmung der Fortbewegungsart
if (vehicle player == player) then
{
    _pilot = player;
    if (surfaceIsWater position player) then {_travelMode = TRAVELMODE_SWIM}
    else {_travelMode = TRAVELMODE_WALK};
}
else
{
    _pilot = currentPilot vehicle player;
    if (vehicle player isKindOf "Air") then {_travelMode = TRAVELMODE_FLY}
    else
    {
        if (vehicle player isKindOf "Ship") then {_travelMode = TRAVELMODE_BOAT}
        else {_travelMode = TRAVELMODE_DRIVE};
    };
};

// Stoppe Auswertung als Beifahrer ohne Pilot
if (isNull _pilot) exitWith {};

// Es liegen Daten vor
if (!isNil QGVAR(LAST_POSITION)) then
{
    _distance = GVAR(LAST_DISTANCE) + (_position distance GVAR(LAST_POSITION));

    // Veränderung des Fortbewegungsmittels oder des Pilots -> Wegstrecke loggen und nullen
    if (GVAR(LAST_TRAVELMODE) != _travelMode || GVAR(LAST_PILOT) != _pilot) then
    {
        private _travelString = "";
        switch (GVAR(LAST_TRAVELMODE)) do
        {
            case TRAVELMODE_WALK:
            {
                _travelString = "Walk";
            };

            case TRAVELMODE_SWIM:
            {
                _travelString = "Swim";
            };

            case TRAVELMODE_BOAT:
            {
                _travelString = "Boat";
            };

            case TRAVELMODE_DRIVE:
            {
                _travelString = "Drive";
            };

            case TRAVELMODE_FLY:
            {
                _travelString = "Fly";
            };
        };
        ["Transport", _travelString, [getPlayerUID player, name player, side player, getPlayerUID GVAR(LAST_PILOT), name GVAR(LAST_PILOT), side GVAR(LAST_PILOT), _distance]] remoteExec [QEFUNC(LOGGING,writelog), 2];
        _distance = 0;
    };
};

GVAR(LAST_POSITION) = _position;
GVAR(LAST_TRAVELMODE) = _travelMode;
GVAR(LAST_PILOT) = _pilot;
GVAR(LAST_DISTANCE) = _distance;
