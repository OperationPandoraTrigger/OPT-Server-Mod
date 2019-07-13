#include "macros.hpp"
#include "\opt_core\dialogs\OPTDef.hpp"

private _success = createDialog "opt_beamDialog";


private _display = findDisplay IDD_BEAM;
private _ctrlList = _display displayCtrl IDC_BEAM_LIST;
private _ctrlMap = _display displayCtrl IDC_BEAM_MAP;


private _markerSelected = createMarkerLocal ["beamSelected", [0,0,0]];
_markerSelected setMarkerAlphaLocal 0;
_markerSelected setMarkerTypeLocal "selector_selectedMission";
_markerSelected setMarkerColorLocal "ColorBlue";
_markerSelected setMarkerSizeLocal [1.2, 1.2];


private _mapMarkers = [];
{
	private _name = _x getVariable "name";
	private _unit = _x getVariable "unit";
	ERROR_LOG(_unit);
	_ctrlList lbAdd _name;
	private _marker = createMarkerLocal [ "beam_" + _name, getPos _unit];
	_marker setMarkerTextLocal _name;
	_marker setMarkerTypeLocal "selector_selectable";
	_marker setMarkerColor "ColorBlue";
	_mapMarkers pushBack _marker;
} foreach (call OFUNC(getPoints));

_display setVariable ["markers", _mapMarkers];
_display setVariable ["markerSelected", _markerSelected];



// EH params are passed as array in _this ([<units>,<pos>,<alt>,<shift>]) and in special variables _units, _pos, _alt, _shift
["beamSelect", "onMapSingleClick", {
	ERROR_LOG(_this);
	
	private _markers = (_this select 4) getVariable "markers";
	private _markerSelected = (_this select 4) getVariable "markerSelected";
	private _list = _this select 5;
	private _map = _this select 6;
	_map ctrlRemoveAllEventHandlers "Draw";
	// Check if clicked close enough:
	private _screenCoordClick = _map ctrlMapWorldToScreen _pos;
	ERROR_LOG(_screenCoordClick);
	private _closestMarker = nil;
	private _closestDistance = 999;
	{
		_screenCoordMarker = _map ctrlMapWorldToScreen getMarkerPos _x;
		ERROR_LOG(_screenCoordMarker);
		private _distance = _screenCoordMarker distance _screenCoordClick;
		ERROR_LOG(_distance);
		// Distance of 0.025 is generously the area a default marker occupies in screenspace, use as hard cutoff
		if (_distance < 0.025 && _distance < _closestDistance) then {
			_closestMarker = _x;
			_closestDistance = _distance;
		};
	} forEach _markers;
	ERROR_LOG(_closestMarker);

	if (isNil "_closestMarker") exitWith {
		_markerSelected setMarkerAlphaLocal 0;
		_list lbSetCurSel -1;
	};

	hint format ["Clicked on %1 at %2", _closestMarker, _closestDistance];
	_markerSelected setMarkerAlphaLocal 1;
	_markerSelected setMarkerPosLocal (getMarkerPos _closestMarker);

	for "_i" from 0 to (lbSize _list) do {
		ERROR_LOG(_list lbText _i);
		ERROR_LOG(markerText "beamSelected");
		if ((_list lbText _i) isEqualTo (markerText "beamSelected")) exitWith {
			_list lbSetCurSel _i;
		};
	};

	_map ctrlAddEventHandler ["Draw", {
		private _currentDir = markerDir "beamSelected";
		"beamSelected" setMarkerDirLocal (_currentDir + 1) % 360;
	}];
}, 
	[_display, _ctrlList, _ctrlMap]
] call BIS_fnc_addStackedEventHandler;



_display displayAddEventHandler ["Unload", {
	ERROR_LOG(_this);
	private _display = _this select 0;
	private _successcode = _this select 1;
	// Remove our beamSelect EH
	["beamSelect", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
	{
		deleteMarkerLocal _x;
	} foreach (_display getVariable "markers");
	deleteMarkerLocal "beamSelected";
}]