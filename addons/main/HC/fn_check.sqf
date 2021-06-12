#include "macros.hpp"

params ["_obj"];

private _id = owner _obj;
private _name = "N/A";
{
    if (owner _x == _id) then {
        _name = name _x;
    };
} forEach allPlayers;

["HC", "OWNER", [_id, _name]] call OPT_LOGGING_fnc_writelog;
