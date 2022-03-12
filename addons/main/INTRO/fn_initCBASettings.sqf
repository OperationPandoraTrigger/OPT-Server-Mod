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
*/
#include "macros.hpp"

[
    QGVAR(PlayIntro), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    [
        "Intro abspielen?",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Aktiviert das Intro nach dem Durchdrücken der Karte." + endl  // Mouse-Over description of the above
    ],
    "OPT Intro", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(IntroFile), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    [
        "Videofile", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Videodatei, die fürs Intro verwendet wird." + endl // Mouse-Over description of the above
    ],
    "OPT Intro", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "\opt\opt_client\addons\core\videos\intro.ogv", // Default value <STRING>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
