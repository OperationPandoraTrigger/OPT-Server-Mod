/**
* Description:
* initialize all flag poles
* 
* Author:
* Lord-MDB, form
*
* Arguments:
*
* Return Value:
*
* Server Only:
* No
* 
* Global:
* No
* 
* API:
* No
* 
* Example:
* [] call fnc_setupflagpositions.sqf;

Diese Datei enthält alle Flaggenpositionen. Sie werden durch Auswahl des Angriffssektors der entsprechenden Fraktion zugewiesen.
Jede Flagge besitzt eine X- und Y- Koordinate, ein Boolean zur Aktivierung sowie einen Namen.
*/

#include "macros.hpp"

CreateFlags = {
	if (isServer) then 
	{
		_this params ["_posX", "_posY", "_aktiv", "_name", "_side", "_texture"];
		if (_aktiv) then
		{
			// Objekt erzeugen
			private _flag = createVehicle ["FlagPole_F", [_posX, _posY],  [], 0, "CAN_COLLIDE"];
			_flag setVariable ["opt_flag", true, true];
			_flag setVariable ["start_owner", _side, true];

			if (GVAR(flagStartNeutral)) then // Nur Fahnenmast ohne Flagge zum Start gewünscht?
			{
				_flag setVariable ["owner", sideUnknown, true];
			}
			else
			{
				_flag setFlagTexture _texture;
				_flag setVariable ["owner", _side, true];
			};
		};
	};
};

// NATO Flaggen
GVAR(nato_flags_pos) = [];
{
	_x params ["_posX", "_posY", "_aktiv", "_name"];
	GVAR(nato_flags_pos) pushBack [_posX, _posY, west, _name, _aktiv];
	[_posX, _posY, _aktiv, _name, west, GVAR(westflag)] call CreateFlags;
}
forEach (GVAR(AllFlags) select GVAR(nato_sektor));
publicVariable QGVAR(nato_flags_pos);

//CSAT Flaggen
GVAR(csat_flags_pos) = [];
{
	_x params ["_posX", "_posY", "_aktiv", "_name"];
	GVAR(csat_flags_pos) pushBack [_posX, _posY, east, _name, _aktiv];
	[_posX, _posY, _aktiv, _name, east, GVAR(eastflag)] call CreateFlags;
}
forEach (GVAR(AllFlags) select GVAR(csat_sektor));
publicVariable QGVAR(csat_flags_pos);

// AAF Flaggen
GVAR(aaf_flags_pos) = [];
{
	_x params ["_posX", "_posY", "_aktiv", "_name"];
 	GVAR(aaf_flags_pos) pushBack [_posX, _posY, independent, _name, _aktiv];
	[_posX, _posY, _aktiv, _name, independent, GVAR(independentflag)] call CreateFlags;
}
forEach (GVAR(AllFlags) select GVAR(aaf_sektor));
publicVariable QGVAR(aaf_flags_pos);
