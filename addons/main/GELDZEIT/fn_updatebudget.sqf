/**
* Author: James
* update budget for given side, log budget change and send new budget to all players
*
* Arguments:
* 0: <STRING> name of buyer or seller
* 1: <SIDE> side of buyer
* 2: <STRING> classname (type) of vehicle or object that was bought or sold
* 3: <NUMBER> cost of transaction
* 4: <STRING> sign of transaction: "+" if cost is added to budget, "-" if cost is subtracted
* 5: <STRING> case - transaction case ["", "respawn", "weapons"]
* 
*
* Return Value:
* None
*
* Example:
* [name player, west, typeOf vehicle, 1000, "-", ""] call fnc_updateBudget.sqf;
*
* public: 
* yes
*/
#include "macros.hpp"

/* PARAMS */
params
[
    ["_buyerUID", "", [""], 1], 
    ["_buyerName", "", [""], 1], 
    ["_side", sideUnknown, [sideUnknown], 1],
    ["_unitId", "", [""], 1],
    ["_unitType", "", [""], 1],
    ["_unitCost", 0, [0], 1],
    ["_sign", "", [""], 1],
    ["_case", "", ["s"], 1]
];

/* CODE BODY */
private _unitName = (getText(configFile >> 'CfgVehicles' >> _unitType >> 'displayName'));

// get category of item
private _veh = objectFromNetId _unitId;
private _category = "";
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

switch (_sign) do 
{
    case "-": 
    {
            if (_side == west) then 
            {
                GVAR(nato_budget) = GVAR(nato_budget) - _unitCost;
            }; 
            if (_side == east) then 
            { 
                GVAR(csat_budget) = GVAR(csat_budget) - _unitCost;
            };
            if (_side == independent) then 
            { 
                GVAR(aaf_budget) = GVAR(aaf_budget) - _unitCost;
            };
            ["Budget", "Buy", [GVAR(nato_budget), GVAR(csat_budget), GVAR(aaf_budget), _buyerUID, _buyerName, _side, _unitId, _unitName, _category, _unitCost]] call OPT_LOGGING_fnc_writelog;

    };
    case "+":  
    {
            if (_side == west) then 
            {
                GVAR(nato_budget) = GVAR(nato_budget) + _unitCost;
            };
            if (_side == east) then 
            {                   
                GVAR(csat_budget) = GVAR(csat_budget) + _unitCost;
            };
            if (_side == independent) then 
            {                   
                GVAR(aaf_budget) = GVAR(aaf_budget) + _unitCost;
            };
            ["Budget", "Sell", [GVAR(nato_budget), GVAR(csat_budget), GVAR(aaf_budget), _buyerUID, _buyerName, _side, _unitId, _unitName, _category, _unitCost]] call OPT_LOGGING_fnc_writelog;
    };
};

publicVariable QGVAR(nato_budget);
publicVariable QGVAR(csat_budget);
publicVariable QGVAR(aaf_budget);
