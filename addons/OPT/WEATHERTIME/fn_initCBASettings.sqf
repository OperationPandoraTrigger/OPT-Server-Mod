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
    "OPT Wetter/Zeit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
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
    "OPT Wetter/Zeit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 59, 0, 0], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(weather_preset), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    [
        "Wetter-Preset",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Einige vordefinierte Wetter-Szenarien."   // Mouse-Over description of the above
    ],
    "OPT Wetter/Zeit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [
        [
    	    0,
	    1,
	    2
        ],	// Value-Indexes
        [
    	    "Norddeutsches Grillwetter",
    	    "FKK Strand",
    	    "Gewitter"
        ],	// Value-Strings
        0	// Default-Index
    ],	// LIST properties
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
	params ["_value"];
	switch (_value) do
	{
	    case (0) :
	    {
		OPT_WEATHERTIME_weather_overcast = 1;
		OPT_WEATHERTIME_weather_rain = 1;
		OPT_WEATHERTIME_weather_fog = 0;
	    };

	    case (1) :
	    {
		OPT_WEATHERTIME_weather_overcast = 0;
		OPT_WEATHERTIME_weather_rain = 0;
		OPT_WEATHERTIME_weather_fog = 0.1;
	    };

	    case (2) :
	    {
		OPT_WEATHERTIME_weather_overcast = 0.8;
		OPT_WEATHERTIME_weather_rain = 0.7;
		OPT_WEATHERTIME_weather_fog = 0.5;
	    };

	    default {};
	};
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(weather_overcast), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Bewölkung",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Stärke der Bewölkung"   // Mouse-Over description of the above
    ],
    "OPT Wetter/Zeit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.3, 1], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(weather_rain), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Regen",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Stärke des Regens"   // Mouse-Over description of the above
    ],
    "OPT Wetter/Zeit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.2, 1], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(weather_fog), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Nebel",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Stärke des Nebels"   // Mouse-Over description of the above
    ],
    "OPT Wetter/Zeit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.2, 1], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

