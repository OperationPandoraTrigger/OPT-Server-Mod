/**
* Author: form
* initialize CBA settings
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initCBASettings.sqf;
*
*/
#include "macros.hpp"

[
    QGVAR(timeslider_hours), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Tageszeit (Stunden)",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Die Uhrzeit (Stunden) zu der die Mission startet."   // Mouse-Over description of the above
    ],
    ["OPT Wetter/Zeit", "Uhrzeit des Schlachtbeginns"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 23, 12, 0], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(timeslider_minutes), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Tageszeit (Minuten)",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Die Uhrzeit (Minuten) zu der die Mission startet."   // Mouse-Over description of the above
    ],
    ["OPT Wetter/Zeit", "Uhrzeit des Schlachtbeginns"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 59, 0, 0], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;


[
    QGVAR(weather_overcast_start), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Bewölkung",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Stärke der Bewölkung"   // Mouse-Over description of the above
    ],
    ["OPT Wetter/Zeit", "Wetter zum Schlachtbeginn"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.3, 1], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(weather_rain_start), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Regen",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Stärke des Regens"   // Mouse-Over description of the above
    ],
    ["OPT Wetter/Zeit", "Wetter zum Schlachtbeginn"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.2, 1], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(weather_fog_start), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Nebel",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Stärke des Nebels"   // Mouse-Over description of the above
    ],
    ["OPT Wetter/Zeit", "Wetter zum Schlachtbeginn"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.2, 1], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;


[
    QGVAR(weather_overcast_end), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Bewölkung",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Stärke der Bewölkung"   // Mouse-Over description of the above
    ],
    ["OPT Wetter/Zeit", "Wetter zum Schlachtende"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.9, 1], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(weather_rain_end), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Regen",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Stärke des Regens"   // Mouse-Over description of the above
    ],
    ["OPT Wetter/Zeit", "Wetter zum Schlachtende"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.9, 1], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(weather_fog_end), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Nebel",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Stärke des Nebels"   // Mouse-Over description of the above
    ],
    ["OPT Wetter/Zeit", "Wetter zum Schlachtende"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.0, 1], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

