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
    QGVAR(StaminaInfmuni), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Faktor für Stamina der Klasse Munitionträger", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Faktor verschiebt die Ausdauer, werte über 1,0 verringern die Ausdauer" + endl  // Mouse-Over description of the above
    ],
    "OPT Ausdauer", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0.10, 2.00 0.5, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(StaminaInfaaat), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Faktor für Stamina der Klasse AA/AT", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Faktor verschiebt die Ausdauer, werte über 1,0 verringern die Ausdauer" + endl  // Mouse-Over description of the above
    ],
    "OPT Ausdauer", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0.10, 2.00 0.75, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(StaminaInfrest), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Faktor für Stamina für alle anderen", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Faktor verschiebt die Ausdauer, werte über 1,0 verringern die Ausdauer" + endl  // Mouse-Over description of the above
    ],
    "OPT Ausdauer", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0.10, 2.00 1.00, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
