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
            ["Budget", "Buy", [GVAR(nato_budget), GVAR(csat_budget), _buyerUID, _buyerName, _side, _unitId, _unitName, _category, _unitCost]] call OPT_LOGGING_fnc_writelog;

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
            ["Budget", "Sell", [GVAR(nato_budget), GVAR(csat_budget), _buyerUID, _buyerName, _side, _unitId, _unitName, _category, _unitCost]] call OPT_LOGGING_fnc_writelog;
    };
};

publicVariable QGVAR(nato_budget);
publicVariable QGVAR(csat_budget);
