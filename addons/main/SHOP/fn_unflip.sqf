/**
* Author: Lord-MDB
* Unflip von Fahrzeugen
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call Func(unflip);
*
*/
#include "macros.hpp"

private _veh = cursorTarget;

_veh setVectorUp [0,0,1];
_veh setPosATL [(getPosATL _veh) select 0, (getPosATL _veh) select 1, 0.3];

// logging
private _name = (getText(configFile >> 'CfgVehicles' >> typeOf _veh >> 'displayName'));
private _faction = (getText(configFile >> 'CfgVehicles' >> typeOf _veh >> 'faction'));
private _category = "";

_category = if (typeOf _veh in EGVAR(SHOP,light)) then
{
    "Leicht"
}
else
{
    if (typeOf _veh in EGVAR(SHOP,heavy)) then
    {
        "Schwer"
    }
    else
    {
        if (typeOf _veh in EGVAR(SHOP,air)) then
        {
            "Flug"
        }
        else
        {
            if (typeOf _veh in EGVAR(SHOP,boat)) then
            {
                "Boot"
            }
            else
            {
                if (typeOf _veh in EGVAR(SHOP,supplies)) then
                {
                    "Ausruestung"
                }
                else
                {
                    if (typeOf _veh in EGVAR(SHOP,static)) then
                    {
                        "Stationaer"
                    }
                    else
                    {
                        "Unbekannt"
                    };
                };
            };
        };
    };
};

["Vehicle", "Unflipped", [_name, _category, _faction, getPlayerUID player, name player, side player]] call OPT_LOGGING_fnc_writelog;
