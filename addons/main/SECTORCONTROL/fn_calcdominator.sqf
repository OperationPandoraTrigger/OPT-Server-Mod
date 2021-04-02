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
* [] call (func)calcDominator;
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
        case "AAFvsCSAT":
        {
            _side = switch (true) do 
            {
                case (_csat_owner > _aaf_owner) : {east};
                case (_aaf_owner > _csat_owner) : {independent};
                case (_aaf_owner == _csat_owner) : {sideUnknown};   
            };
        };

        case "NATOvsCSAT":
        {
            _side = switch (true) do 
            {
                case (_csat_owner > _nato_owner) : {east};
                case (_nato_owner > _csat_owner) : {west};
                case (_aaf_owner == _csat_owner) : {sideUnknown};   
            };            
        };

        case "NATOvsAAF":
        {
            _side = switch (true) do 
            {
                case (_aaf_owner > _nato_owner) : {independent};
                case (_nato_owner > _aaf_owner) : {west};
                case (_aaf_owner == _nato_owner) : {sideUnknown};   
            };                   
        };

           default 
        {
            ERROR_LOG("calcDominator: Fehlerhafte Datenuebergabe - Keine Fraktionauswahl erkannt");
            private _side = sideUnknown;
        };
};

_side  
