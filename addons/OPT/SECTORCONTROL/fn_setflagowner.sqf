/**
* Author: James
* script runs when flag was captured by a player. Set new ownership for all clients.
*
* Arguments:
* 0: <SIDE> playerSide or unknown for setup
* 1: <OBJECT> flag
*
* Return Value:
* None
*
* Example:
* [] call fnc_setFlagOwner.sqf;
*
*/
#include "macros.hpp"

params ["_side","_flag"];

//Flaggen Texturen
//WESTFLAG "\opt\opt_client\addons\core\bilder\arf_fahne.paa"
//EASTFLAG "\opt\opt_client\addons\core\bilder\sword_fahne.paa"
//INDEPENDENTFLAG "\opt\opt_client\addons\core\bilder\arf_fahne.paa"

switch (_side) do 
{	
	//wenn spieler der zieht NATO ist
    case (west) : 
	{ 
        _flag setFlagTexture GVAR(westflag);
        _flag setVariable ["owner", _side, true];

    };
    case (east) : 
	{
        _flag setFlagTexture GVAR(eastflag);
        _flag setVariable ["owner", _side, true];

    };
	case (independent) : 
	{ 
        _flag setFlagTexture GVAR(independentflag);
        _flag setVariable ["owner", _side, true];

    };
    default {};
};

_side_calculated = [] call FUNC(calcDominator);
GVAR(dominator) = _side_calculated;
publicVariable QGVAR(dominator);

switch (_side_calculated) do 
{
    case (east) : 
	{
        _log_msg = format["Dominator ist CSAT"];
        private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
        diag_log format["(%1) Log: %2 --- %3","Fahne",_timestamp,_log_msg];

    };
    case (west) : 
	{
        _log_msg = format["Dominator ist NATO"];
        private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
        diag_log format["(%1) Log: %2 --- %3","Fahne",_timestamp,_log_msg];

    };
	case (independent) : 
	{
        _log_msg = format["Dominator ist AAF"];
        private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
        diag_log format["(%1) Log: %2 --- %3","Fahne",_timestamp,_log_msg];

    };
    default {GVAR(dominator) = sideUnknown};
};

true