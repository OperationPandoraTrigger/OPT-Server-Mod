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
    QGVAR(SelfCareHealth), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Gesundheit nach der Eigenversorgung", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT San-System", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.2, 2], // [min, max, default, decimal]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(SelfCareDuration), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Dauer der Eigenversorgung", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT San-System", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1, 30, 20, 0], // [min, max, default, decimal]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(playerdist), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Reichweite in der nächster Spieler angezeigt wird", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT San-System", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [100, 600, 500, 0], // [min, max, default, decimal]
    0, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(onlysani), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    [
        "Nur nächsten Sani anzeigen",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Gibt an ob alle Spieler oder nur Sanis angezeigt werden."   // Mouse-Over description of the above
    ],
    "OPT San-System", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(Fatigue), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    [
        "Fatigue",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Fatigue-System aktivieren?" + endl // Mouse-Over description of the above
    ],
    "OPT Ausdauer", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(Stamina), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    [
        "Stamina",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Stamina-System aktivieren?" + endl // Mouse-Over description of the above
    ],
    "OPT Ausdauer", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(CustomAimCoef), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Waffenwackel-Faktor",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Ein Faktor der die Stärke des Waffenwackelns nach dem Laufen steuert" + endl  // Mouse-Over description of the above
    ],
    "OPT Ausdauer", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 3, 0.75, 2], // [min, max, default, decimal]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(Respwanzeitdynamisch), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    [
        "Dynamische Respawn Zeit",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Dynamische Respawn Zeit aktivieren?" + endl // Mouse-Over description of the above
    ],
    "OPT Respwan", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(Respwanzeit), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Respwanzeit Spieler",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Zeit bis der Spieler Respwan" + endl  // Mouse-Over description of the above
    ],
    "OPT Respwan", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1200, 900, 0], // [min, max, default, decimal]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;