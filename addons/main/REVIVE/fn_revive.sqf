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

//Revive Funktion 
player switchmove "AinvPknlMstpSnonWrflDnon_medic";

[
    GVAR(Helizeitsani),
    [],
    {
        player switchmove "";
        player action ["WeaponInHand", player];

        //Var zurück setzen 
        GVAR(verletzter) setVariable ["OPT_isUnconscious", 0, true];
        GVAR(verletzter) setDamage 0.0;
    },
    {
        player switchmove "";
        player action ["WeaponInHand", player];
    },
    MLOC(MEDIC_REVIVE)
] call ace_common_fnc_progressBar;

true
