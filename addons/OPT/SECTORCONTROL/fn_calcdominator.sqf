/**
* Author: James
* calculate current dominator according to the flags hold by this side
*
* Arguments:
* None
*
* Return Value:
* 0: <SIDE> side of dominator, sideUnknown if none
*
* Example:
* [] call fnc_calcDominator.sqf;
*
*/
#include "macros.hpp"

private _nato_owner = 0;
private _csat_owner = 0;
private _aaf_owner = 0;
{
    if (_x getVariable ["owner", sideUnknown] isEqualTo west) then { _nato_owner = _nato_owner + 1; };
    if (_x getVariable ["owner", sideUnknown] isEqualTo east) then { _csat_owner = _csat_owner + 1; };
	if (_x getVariable ["owner", sideUnknown] isEqualTo independent) then { _aaf_owner = _aaf_owner + 1; };
} forEach GVAR(nato_flags) + GVAR(csat_flags) + GVAR(aaf_flags);

switch OPT_GELDZEIT_Fraktionauswahl do 
{
    	case "AAFvsCSAT" : 
		{
            if (_csat_owner > _aaf_owner) then 
            {
                private _side = east;    
            };
            if (_aaf_owner > _csat_owner) then 
            {
                private _side = independent;    
            };
            if (_aaf_owner == _csat_owner) then 
            {
                private _side = sideUnknown;    
            };        
		};

		case "NATOvsCSAT" : 
		{
            if (_csat_owner > _nato_owner) then 
            {
                private _side = east;    
            };
            if (_nato_owner > _csat_owner) then 
            {
                private _side = west;    
            };
            if (_nato_owner == _csat_owner) then 
            {
                private _side = sideUnknown;    
            }; 
		};

		case "NATOvsAAF" : 
		{
            if (_aaf_owner > _nato_owner) then 
            {
                private _side = independent;    
            };
            if (_nato_owner > _aaf_owner) then 
            {
                private _side = west;    
            };
            if (_nato_owner == _aaf_owner) then 
            {
                private _side = sideUnknown;    
            };         
		};

   		default 
		{
			ERROR_LOG("calcDominator: Fehlehalte Datenübergabe keine Fraktionauswahl erkannt");
            private _side = sideUnknown;
		};
};

_side  
