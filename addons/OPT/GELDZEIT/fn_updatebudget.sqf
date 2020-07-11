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
    ["_buyerName", "", [""], 1], 
    ["_side", sideUnknown, [sideUnknown], 1],
    ["_unitType", "", [""], 1],
    ["_unitCost", 0, [0], 1],
    ["_sign", "", [""], 1],
    ["_case", "", ["s"], 1]
];

/* CODE BODY */
private _cat = "Budget";
private _message = "";
private _budget_neu = 0;

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
    };
};

// server log sowie Aktualisierung via publicVarialbe
private _unitName = (getText(configFile >> 'CfgVehicles' >> _unitType >> 'displayName'));

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

private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
diag_log format["(%1) Log: %2 --- %3",_cat,_timestamp,_message];