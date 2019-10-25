#include "macros.hpp";

DUMP("UpdateVehicleEH");
DUMP(_this);
params ["_unit"];

if (isNil {_unit getVariable QGVAR(GetInManEH)}) then {
	DUMP("No GetInManEH specified right now!");
	_ehIndex = _unit addEventHandler["GetInMan", {
		DUMP("GET IN");
		DUMP (_this);
		params ["_unit", "_role", "_vehicle", "_turret"];
		DUMP("UNIT " +  str _unit + " entered vehicle " + str _vehicle);
	}];
	_unit setVariable [QGVAR(GetInManEH), _ehIndex];
};

if (isNil {_unit getVariable QGVAR(GetOutManEH)}) then {
	DUMP("No GetOutManEH specified right now!");
	_ehIndex = _unit addEventHandler ["GetOutMan", {
		params ["_unit", "_role", "_vehicle", "_turret"];
		DUMP("UNIT " +  str _unit + " left vehicle " + str _vehicle);
	}];
	_unit setVariable [QGVAR(GetOutManEH), _ehIndex];
};

if (isNil {_unit getVariable QGVAR(SeatSwitchedManEH)}) then {
	DUMP("No SeatSwitchedManEH specified right now!");
	_ehIndex = _unit addEventHandler ["SeatSwitchedMan", {
		params ["_unit1", "_unit2", "_vehicle"];
		DUMP("UNIT " +  str _unit1 + " switched seats with " + str _unit2);
	}];
	_unit setVariable [QGVAR(SeatSwitchedManEH), _ehIndex];
};
