#include "macros.hpp"
#include "\opt_core\dialogs\OPTDef.hpp"

params ["_id", "_cause"];

private _display = findDisplay IDD_BEAM;
private _ctrlList = _display displayCtrl IDC_BEAM_LIST;
private _ctrlMap = _display displayCtrl IDC_BEAM_MAP;

ERROR_LOG("SELECTBEAM " + _x);
if !([_display, _ctrlList, _ctrlMap, _id, _cause] isEqualTypeParams [displayNull,controlNull,controlNull,"",""]) exitWith { ERROR_LOG("ARRAY IS WRONG")};


_ctrlMap ctrlRemoveAllEventHandlers "Draw";
private _markerSelected = _display getVariable "markerSelected";
_markerSelected setMarkerAlphaLocal 1;
_markerSelected setMarkerPosLocal (getMarkerPos _id);

// Must prevent this when clicked in list to prevent infinite EH loop
if !(_cause isEqualTo "list") then {
	for "_i" from 0 to (lbSize _ctrlList) do {
		if ((_ctrlList lbData _i) isEqualTo _id) exitWith {
			_ctrlList lbSetCurSel _i;
		};
	};
};

private _EH = _ctrlMap ctrlAddEventHandler ["Draw", {
	private _display = ctrlParent (_this select 0);
	private _markerSelected = _display getVariable "markerSelected";
	private _currentDir = markerDir _markerSelected;
	_markerSelected setMarkerDirLocal (_currentDir + 1) % 360;
}];

_EH