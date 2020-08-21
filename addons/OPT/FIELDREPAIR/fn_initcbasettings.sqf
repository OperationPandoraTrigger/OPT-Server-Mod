/**
* Author: James
* initialize CBA settings
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call func(initCBASettings);
*
*/
#include "macros.hpp"

[
    QGVAR(DEFAULT_FIELDREPAIR_EACH_PART_TIME), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Zeit für die Reparatur normaler Teile", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Feldreparatur", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [10, 60, 15, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(DEFAULT_FIELDREPAIR_EACH_HARDPART_TIME), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Zeit für die Reparatur schwerer Teile", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Feldreparatur", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [10, 120, 30, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
   QGVAR(DEFAULT_FIELDREPAIR_MAX_REP_TIME), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Max. Zeit für die Reparatur", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Feldreparatur", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [60, 600, 240, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(DEFAULT_FULLREPAIR_LENGTH), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Zeit für komplette Reparatur", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Feldreparatur", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [30, 300, 60, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(DEFAULT_REPAIR_TRUCK_USES), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Anzahl Reparaturen pro Rep-LKW", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Feldreparatur", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1, 30, 10, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(DEFAULT_FREE_REPAIRS), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Anzahl Feldreparaturen pro Einheit", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [
        "OPT Feldreparatur", // Pretty name of the category where the setting can be found. Can be stringtable entry.
        "Wie oft können Feldreparaturen durchgeführt werden, bevor ein Ingenieur benötigt wird oder am Rep-LKW repariert wird?"
    ],
    [1, 10, 1, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(DEFAULT_FREE_REFUELS), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Anzahl Reservekanister pro Einheit", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [
        "OPT Feldreparatur", // Pretty name of the category where the setting can be found. Can be stringtable entry.
        "Wie oft kann ein Fahrzeug mit Spritmangel um 10% aufgetankt werden?"
    ],
    [1, 5, 1, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(DEFAULT_FREE_REFUELS_DURATION), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Zeit fürs Auftanken", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [
        "OPT Feldreparatur", // Pretty name of the category where the setting can be found. Can be stringtable entry.
        "Wie lange dauert das Auftanken?"
    ],
    [10, 120, 30, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;


