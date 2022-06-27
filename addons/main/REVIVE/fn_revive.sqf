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
* [] call fn_revive;
*
*/
#include "macros.hpp"

//Revive Funktion 
DFUNC(revive) = 
{
    GVAR(verletzter) = cursorTarget;

    player switchmove "AinvPknlMstpSnonWrflDnon_medic";

    [
        GVAR(Helizeitsani),
        [],
        {
            player switchmove "";
            player action ["WeaponInHand", player];

            //Var zurück setzen 
            GVAR(verletzter) setVariable ["OPT_isUnconscious", 0, true];
        },
        {
            player switchmove "";
            player action ["WeaponInHand", player];
        },
        MLOC(MEDIC_REVIVE)
    ] call ace_common_fnc_progressBar;
};

true
