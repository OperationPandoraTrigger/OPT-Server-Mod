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
    private _iconId = toLower format [QGVAR(IconId_Player_%1_%2), _unit, group _unit isEqualTo group CLib_Player];
    [[_iconId], QCFUNC(removeMapGraphicsGroup), -2] call CFUNC(remoteExec); // Trigger everywhere except server
    DUMP("ICON REMOVED BECAUSE KILLED: " + _iconId);
    DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});

}] call CFUNC(addEventhandler);

["Respawn", {
    DUMP("RESPAWN");
    DUMP(_this);
	params ["_unit", "_corpse"];
    _unit = _unit select 0;
    DUMP(_unit);
    DUMP(group _unit);
    DUMP(group CLib_Player);
    DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
    private _iconId = toLower format [QGVAR(IconId_Player_%1_%2), _unit, group _unit isEqualTo group CLib_Player];
    [[_unit, _iconId], QFUNC(addUnitToGPS), -2] call CFUNC(remoteExec); // Trigger everywhere except server
    DUMP("ICON ADDED BECAUSE RESPAWN: " + _iconId);
    DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});

}, [player]] call CFUNC(addEventhandler);


["playerJoined", {
    DUMP("PLAYER JOINED");
    DUMP(_this);
	params ["_unit", "_corpse"];
    DUMP(_unit);
    DUMP(group _unit);
    DUMP(group CLib_Player);
    DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
    private _iconId = toLower format [QGVAR(IconId_Player_%1_%2), _unit, group _unit isEqualTo group CLib_Player];
    [[_unit, _iconId], QFUNC(addUnitToGPS), -2] call CFUNC(remoteExec); // Trigger everywhere except server
    DUMP("ICON ADDED BECAUSE PLAYER JOINED: " + _iconId);
    DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
}] call CFUNC(addEventhandler);
