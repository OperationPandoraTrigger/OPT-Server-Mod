#include "macros.hpp"
#include "\opt_core\dialogs\OPTDef.hpp"


private _success = createDialog QUOTE(DIALOG_BEAM); // "opt_beamDialog";

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
	private _id = _x getVariable "id";
	private _idx = _ctrlList lbAdd _name;
	_ctrlList lbSetData [_idx, _id]; // Set the generated ID as invisible data for more robust reference later
	private _marker = createMarkerLocal [ _id, getPos _unit];
	_marker setMarkerTextLocal _name;
	_marker setMarkerTypeLocal "selector_selectable";
	_marker setMarkerColor "ColorBlue";
	_mapMarkers pushBack _marker;
} foreach (call OFUNC(getPoints));

_display setVariable ["markers", _mapMarkers];
_display setVariable ["markerSelected", _markerSelected];



// EH params are passed as array in _this ([<units>,<pos>,<alt>,<shift>]) and in special variables _units, _pos, _alt, _shift
["beamSelect", "onMapSingleClick", {
	private _display = _this select 4;
	private _markers = _display getVariable "markers";
	private _markerSelected = _display getVariable "markerSelected";
	private _list = _this select 5;
	private _map = _this select 6;
	_map ctrlRemoveAllEventHandlers "Draw";
	// Check if clicked close enough:
	private _screenCoordClick = _map ctrlMapWorldToScreen _pos;
	private _closestMarker = nil;
	private _closestDistance = 999;
	// Instead of using world distance ( = meters), we use screenspace. This way, the proximity calculation does not depend on the mapScale / zoom level.
	{
		_screenCoordMarker = _map ctrlMapWorldToScreen getMarkerPos _x;
		private _distance = _screenCoordMarker distance _screenCoordClick;
		// Distance is generously the area a default marker occupies in screenspace, use as hard cutoff
		if (_distance < 0.03 && _distance < _closestDistance) then {
			_closestMarker = _x;
			_closestDistance = _distance;
		};
	} forEach _markers;

	if (isNil "_closestMarker") exitWith {
		_markerSelected setMarkerAlphaLocal 0;
		_list lbSetCurSel -1;
	};

	// hint format ["Clicked on %1 at %2", _closestMarker, _closestDistance];
	[_closestMarker, "map"] call OFUNC(selectBeam);
}, 
	[_display, _ctrlList, _ctrlMap]
] call BIS_fnc_addStackedEventHandler;


_ctrlList ctrlAddEventHandler [ "LBSelChanged", {
	params ["_list", "_idx"];
	private _data = _list lbData _idx;
	private _display = ctrlParent _list;
	private _markers = _display getVariable "markers";
	{
		if (_data isEqualTo _x) exitWith {
			[_x, "list"] call OFUNC(selectBeam);
		};
	} foreach _markers;
}];


// Remove unnecessary handlers and stuff when dialog closes
_display displayAddEventHandler ["Unload", {
	params ["_display", "_exitCode"];
	// Remove our beamSelect EH
	["beamSelect", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
	{
		deleteMarkerLocal _x;
	} foreach (_display getVariable "markers");
	deleteMarkerLocal "beamSelected";
}];

