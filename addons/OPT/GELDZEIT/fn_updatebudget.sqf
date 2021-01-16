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
params [
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
private _cat = "Budget";
private _message = "";
private _budget_neu = 0;
private _unitName = (getText(configFile >> 'CfgVehicles' >> _unitType >> 'displayName'));

// get category of item
private _veh = objectFromNetId _unitId;
private _category = "";
private _light = (opt_shop_nato_vehicles + opt_shop_csat_vehicles + opt_shop_AAF_vehicles + opt_shop_nato_vehicles_supply + opt_shop_csat_vehicles_supply + opt_shop_AAF_vehicles_supply) apply {toLower (_x select 0)};
private _heavy = (opt_shop_nato_armored + opt_shop_csat_armored + opt_shop_AAF_armored) apply {toLower (_x select 0)};
private _air = (opt_shop_nato_choppers + opt_shop_csat_choppers + opt_shop_AAF_choppers) apply {toLower (_x select 0)};
private _boat = (opt_shop_nato_sea + opt_shop_csat_sea + opt_shop_AAF_sea) apply {toLower (_x select 0)};

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
                    "Unbekannt"
                }                
            };
        };
    }; 

switch (_sign) do 
{
    case "-": 
    {
            if (_side == west) then 
            {
                _budget_neu = GVAR(nato_budget) - _unitCost;
            }; 
            if (_side == east) then 
            { 
                _budget_neu = GVAR(csat_budget) - _unitCost;
            };
            if (_side == independent) then 
            { 
                _budget_neu = GVAR(aaf_budget) - _unitCost;
            };
            ["Budget", "Buy", [GVAR(nato_budget), GVAR(csat_budget), GVAR(aaf_budget), _buyerUID, _buyerName, _side, _unitId, _unitName, _category, _unitCost]] call OPT_LOGGING_fnc_writelog;

    };
    case "+":  
    {
            if (_side == west) then 
            {
                _budget_neu = GVAR(nato_budget) + _unitCost;
            };
            if (_side == east) then 
            {                   
                _budget_neu = GVAR(csat_budget) + _unitCost;
            };
            if (_side == independent) then 
            {                   
                _budget_neu = GVAR(aaf_budget) + _unitCost;
            };
            ["Budget", "Sell", [GVAR(nato_budget), GVAR(csat_budget), GVAR(aaf_budget), _buyerUID, _buyerName, _side, _unitId, _unitName, _category, _unitCost]] call OPT_LOGGING_fnc_writelog;
    };
};

// server log sowie Aktualisierung via publicVarialbe

if (_side == west) then 
{
    _message = format["NATO alt: %1 - neu: %2 - Differenz: %3%4.", GVAR(nato_budget), _budget_neu, _sign, _unitCost];

    GVAR(nato_budget) = _budget_neu;
    publicVariable QGVAR(nato_budget);

}; 
if (_side == east) then 
{
    _message = format["CSAT alt: %1 - neu: %2 - Differenz: %3%4.", GVAR(csat_budget), _budget_neu, _sign, _unitCost];
    GVAR(csat_budget) = _budget_neu;
    publicVariable QGVAR(csat_budget);

};
if (_side == independent) then 
{
    _message = format["AAF alt: %1 - neu: %2 - Differenz: %3%4.", GVAR(aaf_budget), _budget_neu, _sign, _unitCost];
    GVAR(aaf_budget) = _budget_neu;
    publicVariable QGVAR(aaf_budget);

};

switch (_case) do 
{
    case "respawn": 
    {
        _message = format["%1 Respawn von %2", _message, _buyerName];
    };
    case "weapons": 
    {
        _message = format["%1 Fahrzeug %2 wurde auf/abgerüstet von %3.", _message, _unitName, _buyerName];
    };
    default 
    {
        _message = format["%1 %2 (ver)kaufte %3", _message, _buyerName, _unitName];
    };
};

//Log
private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
diag_log format["[%1] (%2) Log: %3 --- %4","OPT",_cat,_timestamp,_message];
