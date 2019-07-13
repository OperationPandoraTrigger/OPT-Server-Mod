#include "macros.hpp"
#include "\opt_core\dialogs\OPTDef.hpp"

_success = createDialog "OPTBeam";


_display = findDisplay IDD_BEAM;
_ctrlList = _display displayCtrl IDC_BEAM_LIST;
_ctrlMap = _display displayCtrl IDC_BEAM_MAP;


{
	_name = _x getVariable "Name";
	_ctrlList lbAdd _name;
} foreach (call OFUNC(getPoints));