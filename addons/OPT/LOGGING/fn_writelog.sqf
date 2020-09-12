/**
* Author: form
* function to write an log-entry to the report-file
*
* Arguments:
* Array with Class- and Event-Name followed by another array with variable count of parameters to log
*
* Return Value:
* None
*
* Example:
* ["Mission", "Start", [0, 0, 0, "MissionName"]] call OPT_LOGGING_fnc_writelog;
*
*/

#include "macros.hpp"

params ["_class", "_event", "_array"];

private _prefix = "[OPT_LOG]";
private _separator = toString [9]; // tabulator
private _msg = _array joinString _separator;

diag_log format["%1%2%3%4%5%6%7%8%9", _prefix, _separator, serverTime, _separator, _class, _separator, _event, _separator, _msg];
