/*
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
    QGVAR(ENABLED), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    [
        "Zeige Marker",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Spielermarker auf der Karte und im GPS anzeigen?" + endl +
        "(Eine Änderung wird erst nach Neuslottung über die Lobby übernommen)" + endl // Mouse-Over description of the above
    ],
    "OPT Karte/GPS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // Default value <BOOLEAN>
    0, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(SHOW_NAMES), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    [
        "Zeige Spielernamen",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Spielernamen auf der Karte und im GPS anzeigen?" + endl +
        "(Eine Änderung wird sofort übernommen)" + endl // Mouse-Over description of the above
    ],
    "OPT Karte/GPS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // Default value <BOOLEAN>
    0, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(REFRESH_RATE), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "GPS FPS",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Wie oft pro Sekunde soll die Karte aktualisiert werden?" + endl +
        "(Eine Änderung wird erst nach Neuslottung über die Lobby übernommen)" + endl // Mouse-Over description of the above
    ],
    "OPT Karte/GPS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0.1, 10, 3, 1], // [_min, _max, _default, _trailingDecimals]
    0, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
