/**
* Description:
* Add CBA-Settings
*
* Author:
* Lord-MDB
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
* No - should be called only once from XEH_PreInit.sqf at mission start
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
    QGVAR(Helizeiteigen), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Dauer für die Eigenversorgung", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT San-System", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1, 30, 20, 0], // [min, max, default, decimal]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(Helizeitsani), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Dauer für die Revivezeit des Sanis", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT San-System", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1, 30, 20, 0], // [min, max, default, decimal]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(stabilisierungzeit), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Dauer der Stabilisierungszeit", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT San-System", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1, 30, 20, 0], // [min, max, default, decimal]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(ausblutzeit), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Dauer bis Spieler verblutet", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT San-System", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [180, 800, 600, 0], // [min, max, default, decimal]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(Blutuntergrenze), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Blutuntergrenze", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT San-System", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [3.1, 4.0, 3.4, 0], // [min, max, default, decimal]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(sanidist), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Reichweite für nächsten Sani", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT San-System", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [100, 600, 500, 0], // [min, max, default, decimal]
    0, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;


