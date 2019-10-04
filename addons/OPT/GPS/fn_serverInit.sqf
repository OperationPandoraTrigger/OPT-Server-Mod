#include "macros.hpp"

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	DUMP("CLIENT DISCONNECTED");
	DUMP(QFUNC(removeUnitFromGPS));
	DUMP(_unit);
	// Must transfer unit as string, because the actual object will no longer exist on the clients...
    [[str _unit], QFUNC(removeUnitFromGPS), -2] call CFUNC(remoteExec); // Trigger everywhere except server
	false; // If this returns true, the unit stays alive as AI...
}];
