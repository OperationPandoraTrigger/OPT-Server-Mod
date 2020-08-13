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

#define PLACE_WAITING -1
#define PLACE_CANCEL 0
#define PLACE_APPROVE 1

/* EH für das Versetzen der Flaggen im Trainingsmodus */
if (GVAR(trainingon)) then 
{

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
        } foreach GVAR(csat_flags) + GVAR(nato_flags) + GVAR(aaf_flags);

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

    player addAction [("<t color=""#f0bfbfbf"">" + ("Teleport") + "</t>"), {[] call FUNC(teleport)}, [], 0, false, true, '', "alive _target"];

    ["Respawn", {

        player addAction [("<t color=""#f0bfbfbf"">" + ("Teleport") + "</t>"), {[] call FUNC(teleport)}, [], 0, false, true, '', "alive _target"];

    }] call CFUNC(addEventhandler);

};

DFUNC(Minensperrmeldung) = 
{
    private _explosive = nearestObject [player, "ACE_Explosives_Place"];

    // allow satchel and charge
    if ((typeOf _explosive) find "SatchelCharge" != -1 or (typeOf _explosive) find "DemoCharge" != -1) exitWith {};    

    // only if near flag
    if ({_explosive distance _x <= GVAR(flagFreeMineZoneRadius)} count (GVAR(nato_flags) + GVAR(csat_flags) + GVAR(aaf_flags)) == 0) exitWith {};

    deleteVehicle _explosive;  

    // Warnhinweis
    private _txt = localize "STR_MINE_VIOLATION";
    private _header = parseText localize "STR_MINE_VIOLATION_HEADER";
    hint Format ["%1 \n\n %2",_header,_txt];

};

// EH für Minensperre
if (GVAR(flagFreeMineZoneOn)) then 
{

    GVAR(eh_ace_interactMenuClosed) = ["ace_interactMenuClosed", 
    {
        _this spawn 
        {
            _this params ["_menuType"];

            if (
                _menuType == 1 and // Eigenmenü
                ace_explosives_pfeh_running // explosive placing in progress
            ) then 
            {
                // wait until explosive was placed by player
                [FUNC(Minensperrmeldung), {(ace_explosives_placeAction == PLACE_APPROVE)}, "Awesome Delay"] call CLib_fnc_waitUntil;

            };
        };

    }] call CBA_fnc_addEventHandler;
};

