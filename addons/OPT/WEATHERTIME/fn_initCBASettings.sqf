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
        "Die Uhrzeit (Stunden) zu der die Mission startet." + endl   // Mouse-Over description of the above
    ],
    ["OPT Wetter/Zeit", "1 - Uhrzeit des Schlachtbeginns"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 23, 12, 0], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(timeslider_minutes), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Tageszeit (Minuten)",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Die Uhrzeit (Minuten) zu der die Mission startet." + endl   // Mouse-Over description of the above
    ],
    ["OPT Wetter/Zeit", "1 - Uhrzeit des Schlachtbeginns"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 59, 0, 0], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;


[
    QGVAR(weather_overcast), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Bewölkung",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Stärke der Bewölkung" + endl +
        "Dieser Wert ist statisch und kann leider keinen Clientsynchronen Übergang aufweisen." + endl
        // Mouse-Over description of the above
    ],
    ["OPT Wetter/Zeit", "2 - Bewölkung"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.3, 1], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;


[
    QGVAR(weather_rain_start), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Regen",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Stärke des Regens zum Schlachtbeginn." + endl +
        "Für Regen ist ein Bewölkungswert von mindestens 0.5 nötig." + endl
        // Mouse-Over description of the above
    ],
    ["OPT Wetter/Zeit", "3 - Regen und Nebel zum Schlachtbeginn"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.2, 1], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(weather_fogValue_start), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Nebeldichte auf Basishöhe",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Stärke des Nebels auf der angegebenen Basishöhe." + endl   // Mouse-Over description of the above
    ],
    ["OPT Wetter/Zeit", "3 - Regen und Nebel zum Schlachtbeginn"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.2, 1], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(weather_fogBase_start), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Nebel-Basishöhe",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Höhe der Nebel-Basis (in m über NN)." + endl   // Mouse-Over description of the above
    ],
    ["OPT Wetter/Zeit", "3 - Regen und Nebel zum Schlachtbeginn"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [-5000, 5000, 0, 0], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(weather_fogDecay_start), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Nebel Anstieg/Rückgang pro Höhe",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Positiver Wert: Nebelintensität nimmt mit steigender Höhe ab (z.B. für Bodennebel)." + endl + 
        "Negativer Wert: Nebelintensität nimmt mit steigender Höhe zu (z.B. für Höhennebel)." + endl
        // Mouse-Over description of the above
    ],
    ["OPT Wetter/Zeit", "3 - Regen und Nebel zum Schlachtbeginn"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [-1, 1, 0, 2], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;


[
    QGVAR(weather_rain_end), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Regen",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Stärke des Regens zum Schlachtende." + endl +
        "Für Regen ist ein Bewölkungswert von mindestens 0.5 nötig." + endl
        // Mouse-Over description of the above
    ],
    ["OPT Wetter/Zeit", "4 - Regen und Nebel zum Schlachtende"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.9, 1], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(weather_fogValue_end), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Nebeldichte auf Basishöhe",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Stärke des Nebels auf der angegebenen Basishöhe." + endl   // Mouse-Over description of the above
    ],
    ["OPT Wetter/Zeit", "4 - Regen und Nebel zum Schlachtende"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.2, 1], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(weather_fogBase_end), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Nebel-Basishöhe",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Höhe der Nebel-Basis (in m über NN)." + endl   // Mouse-Over description of the above
    ],
    ["OPT Wetter/Zeit", "4 - Regen und Nebel zum Schlachtende"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [-5000, 5000, 0, 0], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(weather_fogDecay_end), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Nebel Anstieg/Rückgang pro Höhe",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Positiver Wert: Nebelintensität nimmt mit steigender Höhe zu (z.B. für Bodennebel)." + endl + 
        "Negativer Wert: Nebelintensität nimmt mit steigender Höhe ab (z.B. für Höhennebel)." + endl
        // Mouse-Over description of the above
    ],
    ["OPT Wetter/Zeit", "4 - Regen und Nebel zum Schlachtende"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [-1, 1, 0, 2], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
