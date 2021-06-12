#include "macros.hpp"

params ["_obj"];

if (not (_obj setOwner (owner HC1))) then {
	_obj setGroupOwner (owner HC1);
};
["DEBUG", "NEWOWNER", [_obj]] call OPT_LOGGING_fnc_writelog;
