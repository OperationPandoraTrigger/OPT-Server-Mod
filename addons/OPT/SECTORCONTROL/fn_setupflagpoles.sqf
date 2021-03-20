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
* [] call fnc_setupflagpoles.sqf;

Diese Datei erzeugt für alle gewählten Sektoren die Fahnenmasten sowie Markierungen der MinenZonen.
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

			// Create MineZoneMarker for all possible flags (will be deleted after Waffenruhe)
			if (GVAR(flagFreeMineZoneMarkerOn)) then 
			{
				private _markerName = format["PreMineZoneMarker_%1_%2", _posX, _posY];
	    		private _marker = createMarker [_markerName, [_posX, _posY]];
				GVAR(PreMineZoneMarkers) pushBack _marker;
	    		_marker setMarkerShape "ELLIPSE";
	    		_marker setMarkerBrush "Solid";
	    		_marker setMarkerColor "ColorRed";
	    		_marker setMarkerAlpha 0.5;
				_marker setMarkerSize [GVAR(flagFreeMineZoneRadius), GVAR(flagFreeMineZoneRadius)];
			};
			publicVariable QGVAR(PreMineZoneMarkers);
		};
	};
};

// Delete MineZoneMarkers from all possible flags
{
    deleteMarker _x;
} foreach GVAR(PreMineZoneMarkers);
GVAR(PreMineZoneMarkers) = [];

// NATO Flaggen
GVAR(nato_flags_pos) = [];
{
	{
		_x params ["_posX", "_posY", "_aktiv", "_name"];
		GVAR(nato_flags_pos) pushBack [_posX, _posY, west, _name, _aktiv];
		[_posX, _posY, _aktiv, _name, west, GVAR(westflag)] call CreateFlags;
	}
	forEach (GVAR(AllFlags) select _x);
}
forEach GVAR(nato_sectors);
publicVariable QGVAR(nato_flags_pos);

//CSAT Flaggen
GVAR(csat_flags_pos) = [];
{
	{
		_x params ["_posX", "_posY", "_aktiv", "_name"];
		GVAR(csat_flags_pos) pushBack [_posX, _posY, east, _name, _aktiv];
		[_posX, _posY, _aktiv, _name, east, GVAR(eastflag)] call CreateFlags;
	}
	forEach (GVAR(AllFlags) select _x);
}
forEach GVAR(csat_sectors);
publicVariable QGVAR(csat_flags_pos);

// AAF Flaggen
GVAR(aaf_flags_pos) = [];
{
	{
		_x params ["_posX", "_posY", "_aktiv", "_name"];
	 	GVAR(aaf_flags_pos) pushBack [_posX, _posY, independent, _name, _aktiv];
		[_posX, _posY, _aktiv, _name, independent, GVAR(independentflag)] call CreateFlags;
	}
	forEach (GVAR(AllFlags) select _x);
}
forEach GVAR(aaf_sectors);
publicVariable QGVAR(aaf_flags_pos);
