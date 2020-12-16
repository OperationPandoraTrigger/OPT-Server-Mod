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
    QGVAR(Heliwerteigen), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Höhe (%) der Gesundung für die Eigenversorgung", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT San-System", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [50, 100, 80, 0], // [min, max, default, decimal]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

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