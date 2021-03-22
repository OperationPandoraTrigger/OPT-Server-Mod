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
* [] call func(setFlagOwner);
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
    case (west):
    { 
        _flag setFlagTexture GVAR(westflag);
        _flag setVariable ["owner", _side, true];

    };

    case (east):
    {
        _flag setFlagTexture GVAR(eastflag);
        _flag setVariable ["owner", _side, true];

    };

    case (independent):
    { 
        _flag setFlagTexture GVAR(independentflag);
        _flag setVariable ["owner", _side, true];

    };

    default {};
};

GVAR(dominator) = [] call FUNC(calcDominator);
publicVariable QGVAR(dominator);

true
