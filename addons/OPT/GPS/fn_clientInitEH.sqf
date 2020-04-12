/**
* Description:
* Sets up events event handlers for GPS
* 
* Author:
* Senshi
*
* Arguments:
*
* Return Value:
*
* Server Only:
* No
* 
* Global:
* No
* 
* API:
* No
* 
* Example:
* call FUNC(clientInitEH);
*/

#include "macros.hpp";

// Revive Handlers
[EVENT_MEDIC_UNCONSCIOUS, {
    params ["_unit"];
    DUMP("PLAYER IS UNCONSCIOUS");
    DUMP(_unit);
    DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
    [[netId _unit], QFUNC(updateUnitIcon), -2] call CFUNC(remoteExec); // Trigger everywhere except server
    DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});

}] call CFUNC(addEventHandler);

[EVENT_MEDIC_REVIVED, {
    params ["_unit"];
    DUMP("PLAYER IS REVIVED");
    DUMP(_unit);
    DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
    [[netId _unit], QFUNC(updateUnitIcon), -2] call CFUNC(remoteExec); // Trigger everywhere except server
    DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});

}] call CFUNC(addEventHandler);

[EVENT_MEDIC_STABILIZED, {
    params ["_unit"];
    DUMP("PLAYER IS STABILIZED");
    DUMP(_unit);
    DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
    [[netId _unit], QFUNC(updateUnitIcon), -2] call CFUNC(remoteExec); // Trigger everywhere except server
    DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});

}] call CFUNC(addEventHandler);



