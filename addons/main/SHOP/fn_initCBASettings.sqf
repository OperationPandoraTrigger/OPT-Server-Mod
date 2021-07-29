/**
* Author: maxSzone
* initialize CBA settings
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call FUNC(initCBASettings);
*
*/
#include "macros.hpp"

[
    QGVAR(hardcapmode), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    ["Hardcap-Modus"],  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Hardcap", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [[0, 1], ["Aus", "An"], 1],
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
