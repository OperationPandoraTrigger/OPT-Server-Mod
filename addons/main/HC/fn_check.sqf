#include "macros.hpp"

params ["_obj"];

["DEBUG", "OWNER", [(owner _obj), local _unit]] call OPT_LOGGING_fnc_writelog;
