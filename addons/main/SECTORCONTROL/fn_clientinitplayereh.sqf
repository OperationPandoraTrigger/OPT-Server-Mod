/**
* Author: James
* EH for players
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call func(initPlayerEH);
*
*/
#include "macros.hpp"

if (GVAR(trainingon)) then
{
    // EH für das Versetzen der Flaggen im Trainingsmodus
    // use stackedEH, cannot override default behavior
    [QGVAR(move_flag), "onMapSingleClick", 
    {
        /*
        units: Array - leader selected units, same as groupSelectedUnits (same as _units param)
        pos: Array - world Position3D of the click in format [x,y,0] (same as _pos param)
        alt: Boolean - true if Alt key was pressed (same as _alt param)
        shift: Boolean - true if Shift key was pressed (same as _shift param)
        */

        // exit if no alt key was pressed
        if (!_alt) exitWith {};

        // if alt key was pressed -> was a flag chosen or should a flag be moved?
        // is there a flag that should be moved?
        _flag = objNull;
        {
            if (_x getVariable [QGVAR(isFlagMovable), false]) exitWith { _flag = _x; };
        } foreach GVAR(csat_flags) + GVAR(nato_flags);

        if (_flag isEqualTo objNull) then
        {
            // check for flag nearby
            _obj = nearestObjects [_pos, ["FlagPole_F"], 100];
            if (count _obj == 0) exitWith {};

            _obj = _obj select 0;
            _obj setVariable [QGVAR(isFlagMovable), true];
            systemChat "Flagge kann verschoben werden. Platzieren mit erneutem ALT + Linksklick";
        }
        else
        {
            _flag setpos _pos;
            _flag setVariable [QGVAR(isFlagMovable), false];

            // flaggenmarker verschieben
            _marker = _flag getVariable QGVAR(flagMarker);
            _marker setMarkerPos _pos;

            // minenzonenmarker verschieben
            _marker = _flag getVariable QGVAR(mineMarker);
            _marker setMarkerPos _pos;
        };

    }] call BIS_fnc_addStackedEventHandler;

    // Teleport funktion
    player addAction [("<t color=""#f0bfbfbf"">" + ("Teleport") + "</t>"), {[] call FUNC(teleport)}, [], 0, false, true, '', "alive _target"];

    ["Respawn",
    {
        // Teleport funktion
        player addAction [("<t color=""#f0bfbfbf"">" + ("Teleport") + "</t>"), {[] call FUNC(teleport)}, [], 0, false, true, '', "alive _target"];
    }] call CFUNC(addEventhandler);
};

// EH für Minensperre
if (GVAR(flagFreeMineZoneOn)) then
{
    player addEventHandler ["FiredMan",
    {
        /*
            0 unit: Object - Unit the event handler is assigned to (the instigator)
            1 weapon: String - Fired weapon
            2 muzzle: String - Muzzle that was used
            3 mode: String - Current mode of the fired weapon
            4 ammo: String - Ammo used
            5 magazine: String - magazine name which was used
            6 projectile: Object - Object of the projectile that was shot out
            7 vehicle: Object - Vehicle, if weapon is vehicle weapon, otherwise objNull
        */
        if (_this select 1 == "Put" && ({(_x distance player) <= GVAR(flagFreeMineZoneRadius)} count (GVAR(nato_flags) + GVAR(csat_flags)) > 0)) then
        {
            // lösche Mine
            deleteVehicle (_this select 6);
            // gib Spieler Mine zurück
            player addMagazine (_this select 5);
            // Warnhinweis
            private _txt = MLOC(MINE_VIOLATION);
            private _header = MLOC(MINE_VIOLATION_HEADER);
            hint format ["%1\n\n%2", _header, _txt];
        };
    }];
};
