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

["Killed", {
    DUMP("KILLED");
    DUMP(_this);
    params ["_unit", "_killer", "_instigator", "_useEffects"];
    _unit = _unit select 0;
    DUMP(_unit);
    DUMP(group _unit);
    DUMP(group CLib_Player);
    DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
    [[netId _unit], QFUNC(removeUnitFromGPS), -2] call CFUNC(remoteExec); // Trigger everywhere except server
    DUMP("ICON REMOVED BECAUSE KILLED: " + str _unit);
    DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});

}] call CFUNC(addEventhandler);


["playerChanged", {
    params ["_data", "_params"];
    _data params ["_currentPlayer", "_oldPlayer"];

    [{
        private _currentPlayer = _this;
        DUMP(_currentPlayer);
        DUMP(alive _currentPlayer);
        DUMP(alive CLib_Player);
        DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
        [[netid _currentPlayer], QFUNC(addUnitToGPS), -2] call CFUNC(remoteExec); // Trigger everywhere except server
        DUMP("ICON ADDED BECAUSE PLAYERCHANGED: " + str _currentPlayer);
        DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
    }, _currentPlayer] call CLib_fnc_execNextFrame;
}] call CFUNC(addEventhandler);

["Respawn", {
     DUMP("RESPAWN");
     DUMP(_this);
     params ["_data", "_params"];
     _data params ["_unit"];
     DUMP(_unit);
     DUMP(alive _unit);
     DUMP(alive CLib_Player);
     {
         DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
         [[netid _unit], QFUNC(addUnitToGPS), -2] call CFUNC(remoteExec); // Trigger everywhere except server
        DUMP("ICON ADDED BECAUSE RESPAWN: " + _iconId);
        DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
     } call CFUNC(execNextFrame);
}] call CFUNC(addEventhandler);


["playerJoined", {
    DUMP("PLAYER JOINED");
    DUMP(_this);
    params ["_unit", ""];
    DUMP(_unit);
    DUMP(group _unit);
    DUMP(group CLib_Player);
    DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
    [[netid _unit], QFUNC(addUnitToGPS), -2] call CFUNC(remoteExec); // Trigger everywhere except server
    DUMP("ICON ADDED BECAUSE PLAYER JOINED: " + str _unit);
    DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
}] call CFUNC(addEventhandler);


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

// "FAR_isStabilized" addPublicVariableEventHandler {
//     private _unit = _this select 2;
//     DUMP("FAR_IsStabilized has updated!");
//     DUMP(_this);
//     [str _unit] call FUNC(updateUnitIcon); // Trigger everywhere except server
// };

// "FAR_isUnconscious" addPublicVariableEventHandler {
//     private _unit = _this select 2;
//     DUMP("FAR_isUnconscious has updated!");
//     DUMP(_this);
//     [str _unit] call FUNC(updateUnitIcon); // Trigger everywhere except server
// };

