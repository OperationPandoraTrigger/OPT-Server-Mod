/**
* Description:
* Add CBA-Settings
*
* Author:
* form
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* No
*
* Public:
* No
*
* Global:
* No
*
* API:
* No
*
* Example:
* [] call FUNC(initCBASettings);
*/
#include "macros.hpp"

[
    QGVAR(mindesfentfernung), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Mindesenffernung zu Fahne in Km.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Beam", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1, 10, 3, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
