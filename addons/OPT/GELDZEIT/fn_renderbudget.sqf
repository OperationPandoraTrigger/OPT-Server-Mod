/**
* Author: James
* reformat budget text and write it in the control field
*
* Arguments:
* 0: <IDC> idc of control field
*
* Return Value:
* None
*
* Example:
* [IDC] call fnc_renderBudget.sqf;
*
*/
#include "macros.hpp"

params ["_budget_field"];

private _side = playerSide;
private _side_Budget = 0;

if (_side == west) then 
{
    _side_Budget = GVAR(nato_budget);
};

if (_side == east) then 
{
    _side_Budget = GVAR(csat_budget);
};

if (_side == independent) then 
{
    _side_Budget = GVAR(aaf_budget);
};

private _txt = if (_side_Budget >= 1e6) then 
{
    format ["Budget: %1 Mio. €", str(_side_Budget / 1e6)];  
} 
else 
{
    format ["Budget: %1 €", str(_side_Budget)];
};

// Warnung, wenn Budget niedrig wird
if (_side_Budget < 4e5) then 
{
    _budget_field ctrlSetTextColor [0.97, 0.63, 0.02, 1];
};

// Falls Budget negativ: Zeige Dispo
if (_side_Budget < 0) then 
{
    _txt = format["Dispo: %1 €", str(_side_Budget)];
    _budget_field ctrlSetTextColor [1,0,0,1];
};

// Falls Budget sehr negativ: Zeige Dispo in Mio.
if (_side_Budget <= -1e6) then 
{
    _txt = format ["Dispo: %1 Mio. €", str(_side_Budget / 1e6)];
};

_budget_field ctrlSetText _txt;
