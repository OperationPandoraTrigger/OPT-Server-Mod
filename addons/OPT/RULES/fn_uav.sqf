/**
* Author: James
* initialize UAV script. Adds addAction menu entries to all laptops and handles logic
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call func(uav);
*
*/
#include "macros.hpp"

private _pcs = [AAF_Drohnenstation,CSAT_Drohnenstation];

// add to each UAV PC addaction menu
{
    _x addAction [
        "<t color='#F3B601'>" + localize "STR_UAV_LOGIN" + "</t>",
        {
            private _terminal = _this select 0;
            [
                10,
                _terminal,
                {
                    params ["_terminal"];
                    
                    Hint localize "STR_UAV_CONNECTION_MSG";
                    player setVariable [QGVAR(loggedInStation), _terminal];
                    
                    if (PLAYERSIDE == west) then 
					{
                        player removeWeapon "ItemGPS";
                        player addWeapon "B_UavTerminal";
                    };
                    if (PLAYERSIDE == east) then 
					{
                        player removeWeapon "ItemGPS";
                        player addWeapon "O_UavTerminal";
                    };
					if (PLAYERSIDE == independent) then 
					{
                        player removeWeapon "ItemGPS";
                        player addWeapon "I_UavTerminal";
                    };
                    [] call FUNC(UAV_check_player);
                },
                {},
                localize "STR_UAV_CONNECT"
            ] call ace_common_fnc_progressBar;
        },
        [],
        1.5,
        false,
        true,
        "",
        format["isNull (player getVariable ['%1',objNull]) && {isNull objectParent player}", QGVAR(loggedInStation)]
    ];

    _x addAction [
        "<t color='#F3B601'>" + localize "STR_UAV_LOGOUT" + "</t>",
        {
            private _terminal = _this select 0;
            [
                3,
                [],
                {
                    
                    Hint localize "STR_UAV_CONNECTION_QUIT";
                    player connectTerminalToUAV objNull;
                    player setVariable [QGVAR(loggedInStation), objNull];
                    
                    if (PLAYERSIDE == west) then 
					{
                        player removeWeapon "B_UavTerminal";
                        player addWeapon "ItemGPS";
                    };
                    if (PLAYERSIDE == east) then 
					{
                        player removeWeapon "O_UavTerminal";
                        player addWeapon "ItemGPS";
                    };
					if (PLAYERSIDE == independent) then 
					{
                        player removeWeapon "I_UavTerminal";
                        player addWeapon "ItemGPS";
                    };
                },
                {},
                localize "STR_UAV_DISCONNECT"
            ] call ace_common_fnc_progressBar;
        },
        [],
        1.5,
        false,
        true,
        "",
        format["!isNull (player getVariable ['%1',objNull])", QGVAR(loggedInStation)]
    ];

} forEach _pcs;

DFUNC(UAV_check_player) = 
{
    GVAR(checkuav) = [{

        if !(player getVariable [QGVAR(loggedInStation), objNull] isEqualTo objNull) then
        {

            private _station = player getVariable QGVAR(loggedInStation);

            if (player distance2D _station > 4) then 
            {

                player setVariable [QGVAR(loggedInStation), objNull];
                player connectTerminalToUAV objNull;
                hint localize "STR_UAV_CONNECTION_LOST";
                    
                if (PLAYERSIDE == west) then 
                {
                    player removeWeapon "B_UavTerminal";
                    player addWeapon "ItemGPS";

                };

                if (PLAYERSIDE == east) then 
                {
                    player removeWeapon "O_UavTerminal";
                    player addWeapon "ItemGPS";

                };
                    
                if (PLAYERSIDE == independent) then 
                {
                    player removeWeapon "I_UavTerminal";
                    player addWeapon "ItemGPS";

                };
                GVAR(checkuav) call CFUNC(removePerframeHandler);	

            };
        };

    }, 1] call CFUNC(addPerFrameHandler);

 };   

