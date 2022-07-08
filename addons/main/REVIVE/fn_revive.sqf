/**
* Author: James
* release unit that player carries
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [_target] call fn_revive;
*
*/
#include "macros.hpp"

params ["_target"];

GVAR(verletzter) = _target;
GVAR(Heilzeit) = 0;

GVAR(Heilzeit) = GVAR(Heilzeitsani);

//längere Heilzeit bei nicht Sanitätern
if (!(typeOf player in GVAR(SaniKlassen))) then 
{
    GVAR(Heilzeit) = GVAR(Heilzeitsani)+(GVAR(Heilzeitsani)*GVAR(Heilzeitfaktor)/100);
};

//Revive Funktion 
player playAction "medicStart";

[
    GVAR(Heilzeit),
    [],
    {
        player playAction "medicStop";
        player action ["WeaponInHand", player];

        //Var zurück setzen 
        GVAR(verletzter) setVariable ["OPT_isUnconscious", 0, true];
        GVAR(verletzter) setDamage 0.0;
    },
    {
        player playAction "medicStop";
        player action ["WeaponInHand", player];
    },
    MLOC(MEDIC_REVIVE)
] call ace_common_fnc_progressBar;

true
