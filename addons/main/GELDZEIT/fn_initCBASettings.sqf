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
    QGVAR(Fraktionauswahl), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Fraktionauswahl AAFvsCSAT/NATOvsCSAT/NATOvsAAF", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Mission", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "AAFvsCSAT", // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        GVAR(Fraktionauswahl) = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(PLAYTIME), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Spielzeit in Sek.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Mission", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [180, 10800, 9000, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(TRUCETIME), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Waffenruhe in Sek.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Mission", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [30, 900, 300, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(FREEZETIME), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Freeze-Time in Sek.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Mission", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 300, 0, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(TEAMBALANCE), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Überhangregel", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Mission", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 15, 5, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(aaf_budget), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Budget AAF", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Mission", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "3000000", // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        GVAR(aaf_budget) = parseNumber _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(csat_budget), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Budget CSAT", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Mission", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "3000000", // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        GVAR(csat_budget) = parseNumber _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(nato_budget), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Budget Nato", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Mission", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "3000000", // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        GVAR(nato_budget) = parseNumber _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(dispo), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Dispokredit", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Mission", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "100000", // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        GVAR(dispo) = parseNumber _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
