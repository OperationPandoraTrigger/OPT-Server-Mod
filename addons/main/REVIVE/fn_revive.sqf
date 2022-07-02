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
GVAR(Helizeit) = 0;

GVAR(Helizeit) = GVAR(Helizeitsani);

//längere Heilzeit bei nicht Sanitätern
if (!(typeOf player in GVAR(SaniKlassen))) then 
{
    GVAR(Helizeit) = GVAR(Helizeitsani)+(GVAR(Helizeitsani)*GVAR(Helizeitfaktor)/100);
};

//Revive Funktion 
player playAction "medicStart";

[
    GVAR(Helizeit),
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
