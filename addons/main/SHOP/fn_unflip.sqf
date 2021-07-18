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

_veh = cursorTarget;

_veh setVectorUp [0,0,1];
_veh setPosATL [(getPosATL _veh) select 0, (getPosATL _veh) select 1, 0.3];

// logging
private _name = (getText(configFile >> 'CfgVehicles' >> typeOf _veh >> 'displayName'));
private _faction = (getText(configFile >> 'CfgVehicles' >> typeOf _veh >> 'faction'));
private _category ="";
private _light = (opt_shop_nato_vehicles + opt_shop_csat_vehicles + opt_shop_AAF_vehicles + opt_shop_nato_vehicles_supply + opt_shop_csat_vehicles_supply + opt_shop_AAF_vehicles_supply) apply {toLower (_x select 0)};
private _heavy = (opt_shop_nato_armored + opt_shop_csat_armored + opt_shop_AAF_armored) apply {toLower (_x select 0)};
private _air = (opt_shop_nato_choppers + opt_shop_csat_choppers + opt_shop_AAF_choppers + opt_shop_nato_planes + opt_shop_csat_planes + opt_shop_AAF_planes) apply {toLower (_x select 0)};
private _boat = (opt_shop_nato_sea + opt_shop_csat_sea + opt_shop_AAF_sea) apply {toLower (_x select 0)};
private _supplies = (opt_shop_nato_supplies + opt_shop_csat_supplies + opt_shop_AAF_supplies) apply {toLower (_x select 0)};
private _static = (opt_shop_nato_static + opt_shop_csat_static + opt_shop_AAF_static) apply {toLower (_x select 0)};

_category = if (toLower (typeOf _veh) in _light) then
{
    "Leicht"
}
else
{
    if (toLower (typeOf _veh) in _heavy) then 
    {
        "Schwer"
    }
    else
    {
        if (toLower (typeOf _veh) in _air) then
        {
            "Flug"
        }
        else
        {
            if (toLower (typeOf _veh) in _boat) then
            {
                "Boot"
            }
            else
            {
                if (toLower (typeOf _veh) in _supplies) then
                {
                    "Ausruestung"
                }
                else
                {
                    if (toLower (typeOf _veh) in _static) then
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
