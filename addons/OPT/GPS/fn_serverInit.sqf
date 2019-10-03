#include "macros.hpp"

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	DUMP("CLIENT DISCONNECTED");
	DUMP(QFUNC(removeUnitFromGPS));
    [[_unit], QFUNC(removeUnitFromGPS), -2] call CFUNC(remoteExec); // Trigger everywhere except server
	false; // If this returns true, the unit stays alive as AI...
}];
