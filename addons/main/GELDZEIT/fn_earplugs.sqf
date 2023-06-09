/**
* Author: form
* add ace menu entries for earplugs
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call func(earplugs);
*
*/
#include "macros.hpp"

LastVolume = 1;
MaxVolume = 1;

// Lautstärke 25%
private _action_earplugs_25 =
[
    MLOC(ACE_EQIP),
    MLOC(EARPLUGS_25),
    "z\ace\addons\nametags\ui\soundwave3.paa",
    {
        LastVolume = 0.25;
        1 fadeSound 0.25;
    },
    {
        true
    }
] call ace_interact_menu_fnc_createAction;

[
    player,
    1,
    ["ACE_SelfActions", "ACE_Equipment"],
    _action_earplugs_25
] call ace_interact_menu_fnc_addActionToObject;


// Lautstärke 50%
private _action_earplugs_50 =
[
    MLOC(ACE_EQIP),
    MLOC(EARPLUGS_50),
    "z\ace\addons\nametags\ui\soundwave1.paa",
    {
        LastVolume = 0.5;
        MaxVolume = 0.5;
        1 fadeSound 0.5;
    },
    {
        true
    }
] call ace_interact_menu_fnc_createAction;

[
    player,
    1,
    ["ACE_SelfActions", "ACE_Equipment"],
    _action_earplugs_50
] call ace_interact_menu_fnc_addActionToObject;


// Lautstärke 100%
private _action_earplugs_100 =
[
    MLOC(ACE_EQIP),
    MLOC(EARPLUGS_100),
    "z\ace\addons\nametags\ui\soundwave7.paa",
    {
        LastVolume = 1;
        MaxVolume = 1;
        1 fadeSound 1;
    },
    {
        true
    }
] call ace_interact_menu_fnc_createAction;

[
    player,
    1,
    ["ACE_SelfActions", "ACE_Equipment"],
    _action_earplugs_100
] call ace_interact_menu_fnc_addActionToObject;
