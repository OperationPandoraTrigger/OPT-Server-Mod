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

private _pcs = [NATO_Drohnenstation, CSAT_Drohnenstation];

// add to each UAV PC addaction menu
{
    _x addAction [
        format["<t color=""#F3B601"">%1</t>", MLOC(UAV_LOGIN)],
        {
            private _terminal = _this select 0;
            [
                10,
                _terminal,
                {
                    params ["_terminal"];
                    hint format["%1\n\n%2", MLOC(UAV_STATION), MLOC(UAV_CONNECTION_MSG)];
                    player setVariable [QGVAR(loggedInStation), _terminal];

                    if (playerSide == west) then
                    {
                        player removeWeapon "ItemGPS";
                        player addWeapon "B_UavTerminal";
                    };

                    if (playerSide == east) then
                    {
                        player removeWeapon "ItemGPS";
                        player addWeapon "O_UavTerminal";
                    };

                    [] call FUNC(UAV_check_player);
                },
                {},
                MLOC(UAV_CONNECT)
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
        format["<t color=""#F3B601"">%1</t>", MLOC(UAV_LOGOUT)],
        {
            [
                3,
                [],
                {
                    hint format["%1\n\n%2", MLOC(UAV_STATION), MLOC(CONNECTION_QUIT)];
                    player connectTerminalToUAV objNull;
                    player setVariable [QGVAR(loggedInStation), objNull];

                    if (playerSide == west) then
                    {
                        if !(typeOf player in GVAR(uav_operators)) then
                        {
                             player removeWeapon "B_UavTerminal";
                            player addWeapon "ItemGPS";
                        };
                    };

                    if (playerSide == east) then
                    {
                        if !(typeOf player in GVAR(uav_operators)) then
                        {
                            player removeWeapon "O_UavTerminal";
                            player addWeapon "ItemGPS";
                        };
                    };
                },
                {},
                MLOC(UAV_DISCONNECT)
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

                hint format["%1\n\n%2", MLOC(UAV_STATION), MLOC(UAV_CONNECTION_LOST)];

                    if (playerSide == west) then
                    {
                        if !(typeOf player in GVAR(uav_operators)) then
                        {
                            player removeWeapon "B_UavTerminal";
                            player addWeapon "ItemGPS";
                        };
                    };

                    if (playerSide == east) then
                    {
                        if !(typeOf player in GVAR(uav_operators)) then
                        {
                            player removeWeapon "O_UavTerminal";
                            player addWeapon "ItemGPS";
                        };
                    };

                GVAR(checkuav) call CFUNC(removePerframeHandler);
            };
        };
    }, 1] call CFUNC(addPerFrameHandler);
 };

GVAR(checkuav) = [
{
    if !(isNull (getConnectedUAV player)) then 
    {
        private _uav = getConnectedUAV player;
        if (typeOf _uav in GVAR(big_uavs)) then 
        {
            if (player getVariable [QGVAR(loggedInStation), objNull] isEqualTo objNull) then 
            {
                player connectTerminalToUAV objNull;
                private _txt = MLOC(UAV_WORNG_CONNECTION);
                private _header = MLOC(UAV_STATION);
                hint format["%1\n\n%2", _header, _txt];
            };
        } 
        else 
        {
            if !(typeOf player in GVAR(uav_operators)) then 
            {
                player connectTerminalToUAV objNull;
                hint format["%1\n\n%2", MLOC(UAV_STATION), MLOC(UAV_ONLY_OPERATOR)];
            };
        };
    };
}, 1] call CFUNC(addPerFrameHandler);
