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
    QGVAR(BeamRadiusMan), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Radius für Soldaten", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Dieser Radius um Fahnen und Basen darf nicht als Ziel fürs Beamen ausgewählt werden." + endl  // Mouse-Over description of the above
    ],
    ["OPT Beam",  "1 - Beam-Verbot um Fahnen und Basen (in km)"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 2, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;


[
    QGVAR(BeamRadiusFactor), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Radius Skalierungsfaktor", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Hiermit können jegliche Radienwerte skaliert werden." + endl  // Mouse-Over description of the above
    ],
    ["OPT Beam",  "2 - Beam-Radius Skalierung"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 5, 1, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;


[
    QGVAR(SearchRadiusBeam), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Spawn-Radius um den Beampunkt (in m)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "In diesem Radius um den Beampunkt herum wird eine freie Fläche gesucht." + endl  // Mouse-Over description of the above
    ],
    ["OPT Beam",  "3 - Spawnpunkt Such-Radius"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [5, 500, 50, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(SearchRadiusTeleport), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Spawn-Radius beim Teleport (in m)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "In diesem Radius um das gewählte Teleportziel herum wird eine freie Fläche gesucht." + endl  // Mouse-Over description of the above
    ],
    ["OPT Beam",  "3 - Spawnpunkt Such-Radius"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [5, 500, 25, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
