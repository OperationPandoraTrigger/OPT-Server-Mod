/**
* Beschreibung:
* CBA-Settings hinzufügen
*
* Autor:
* Senshi
*
* Argumente:
* Keine
*
* Rückgabewert:
* Keine
*
* Server Only:
* Nein
* 
* Global:
* Nein
* 
* API:
* Nein
*
* Beispiel:
* [] call FUNC(initCBASettings);
*/
#include "macros.hpp"

private _errors = [
	[
		QGVAR(namesVisible), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
		"LIST", // setting type
		[
			"Einheitennamen immer anzeigen",
			"Wann sollen die Spielernamen neben Einheitenmarkern angezeigt werden? Bei Mouseover oder immer?"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
		["OPT", "GPS"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
		[[true, false], ["Immer", "Nur bei Mouseover"], 0], // [Possible values, value titles, default value]
		0,
		{} // TODO: We should invalidate ALL unit markers so they get redrawn with the new settings.
	] call CBA_fnc_addSetting

] select {_x isEqualTo false};

if (count _errors > 0) then {
	ERROR_LOG(format ["CBA Setting INIT failed for %1", _errors]);
};
