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
* [] call fnc_initCBASettings.sqf;
*
*/
#include "macros.hpp"

[
    QGVAR(nato_faction), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    [
        "NATO Fraktion", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Welche Fraktion spielt auf der NATO Seite?" + endl // Mouse-Over description of the above
    ],
    ["OPT Sektorkontrolle", "1 - NATO"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [
        ["ARF", "SWORD"],  // Listbox values
        ["ARF", "SWORD"],  // Listbox strings
        0   // default index
    ],
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
    }, // function that will be executed once on mission start and every time the setting is changed.
    true    // Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_Settings_fnc_init;

[
    QGVAR(nato_allsectors_str), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    [
        "NATO Sektoren", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Alle derzeit von der NATO besetzten Sektoren." + endl + "Leer: Keine" + endl + "Zahl: Sektornummer" + endl + "Mehrere Sektoren können durch ein Komma getrennt angegeben werden." + endl // Mouse-Over description of the above
    ],
    ["OPT Sektorkontrolle", "1 - NATO"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "", // Default value <STRING>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        GVAR(nato_allsectors) = parseSimpleArray format ["[%1]", _value];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true    // Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_Settings_fnc_init;

[
    QGVAR(nato_sectors_str), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    [
        "NATO Verteidigungssektor", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Sektoren in denen Fahnen gewählt werden können." + endl + "Leer: Keine" + endl + "Zahl: Sektornummer" + endl + "Mehrere Sektoren können durch ein Komma getrennt angegeben werden." + endl // Mouse-Over description of the above
    ],
    ["OPT Sektorkontrolle", "1 - NATO"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "", // Default value <STRING>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        GVAR(nato_sectors) = parseSimpleArray format ["[%1]", _value];
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(csat_faction), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    [
        "CSAT Fraktion", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Welche Fraktion spielt auf der NATO Seite?" + endl // Mouse-Over description of the above
    ],
    ["OPT Sektorkontrolle", "2 - CSAT"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [
        ["ARF", "SWORD"],  // Listbox values
        ["ARF", "SWORD"],  // Listbox strings
        1   // default index
    ],
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
    }, // function that will be executed once on mission start and every time the setting is changed.
    true    // Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_Settings_fnc_init;

[
    QGVAR(csat_allsectors_str), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    [
        "CSAT Sektoren", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Alle derzeit von der CSAT besetzten Sektoren." + endl + "Leer: Keine" + endl + "Zahl: Sektornummer" + endl + "Mehrere Sektoren können durch ein Komma getrennt angegeben werden." + endl // Mouse-Over description of the above
    ],
    ["OPT Sektorkontrolle", "2 - CSAT"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "", // Default value <STRING>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        GVAR(csat_allsectors) = parseSimpleArray format ["[%1]", _value];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true    // Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_Settings_fnc_init;

[
    QGVAR(csat_sectors_str), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    [
        "CSAT Verteidigungssektor", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Sektoren in denen Fahnen gewählt werden können." + endl + "Leer: Keine" + endl + "Zahl: Sektornummer" + endl + "Mehrere Sektoren können durch ein Komma getrennt angegeben werden." + endl // Mouse-Over description of the above
    ],
    ["OPT Sektorkontrolle", "2 - CSAT"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "", // Default value <STRING>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        GVAR(csat_sectors) = parseSimpleArray format ["[%1]", _value];
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;


[
    QGVAR(flagCountNATO), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Anzahl der NATO-Flaggen",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Die Anzahl der NATO-Flaggen, die für die Gegenseite zum Angriff stehen." + endl  // Mouse-Over description of the above
    ],
    ["OPT Sektorkontrolle", "3 - Flaggenanzahl"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 30, 1, 0], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(flagCountCSAT), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Anzahl der CSAT-Flaggen",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Die Anzahl der CSAT-Flaggen, die für die Gegenseite zum Angriff stehen." + endl  // Mouse-Over description of the above
    ],
    ["OPT Sektorkontrolle", "3 - Flaggenanzahl"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 30, 1, 0], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;


[
    QGVAR(trainingon), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Trainingsmodus", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["OPT Sektorkontrolle", "4 - Diverses"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {}, // function that will be executed once on mission start and every time the setting is changed.
    true    // Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_Settings_fnc_init;

[
    QGVAR(trainingDontDeleteBorderMarkers), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    [
        "Im Trainingsmodus die Grenzlinien nicht löschen", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Nach Ablauf der Waffenruhe können die Grenzlinien für eine bessere Übersicht beibehalten werden." + endl // Mouse-Over description of the above
    ],
    ["OPT Sektorkontrolle", "4 - Diverses"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(flagStartNeutral), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    [
        "Start mit neutralen Flaggen",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Die zu Missionsstart gewählten Flaggen tragen noch keine Fahne und müssen erst erobert werden." + endl  // Mouse-Over description of the above
    ],
    ["OPT Sektorkontrolle", "4 - Diverses"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(flagMarkerOn), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Markiere Angriffsflaggen mit Mapmarker", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["OPT Sektorkontrolle", "4 - Diverses"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(flagDistanceToPlayer), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Entfernung zur Flagge für Menü-Eintrag.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["OPT Sektorkontrolle", "4 - Diverses"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1, 20, 5, 0], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;


[
    QGVAR(flagFreeMineZoneOn), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Minensperrzone um Flagge", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["OPT Sektorkontrolle", "5 - Minen-Sperrzone"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(flagFreeMineZoneMarkerOn), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Markiere Minensperrzone um Flagge", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["OPT Sektorkontrolle", "5 - Minen-Sperrzone"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(flagFreeMineZoneRadius), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Radius in Metern der Minen-Sperrzone um die Flagge.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["OPT Sektorkontrolle", "5 - Minen-Sperrzone"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [5, 50, 20, 0], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
