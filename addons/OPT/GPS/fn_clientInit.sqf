#include "macros.hpp"
// [] call FUNC(initCBASettings);
// call FUNC(initEH);

// Inspired by AAW's UnitTracker

GVAR(playerCounter) = 0;
GVAR(currentIcons) = [];
GVAR(blockUpdate) = false;
GVAR(currentHoverGroup) = grpNull;
GVAR(currentHoverVehicle) = objNull;
GVAR(groupInfoPFH) = -1;
GVAR(vehicleInfoPFH) = -1;
GVAR(lastFrameTriggered) = diag_frameNo;

GVAR(processedIcons) = [];
GVAR(lastProcessedIcons) = [];




["missionStarted", {
    // Create markers for all players already in here.
    allPlayers apply {
        DUMP(_x);
        DUMP([_x] call FUNC(isUnitVisible));
        if (CLib_Player == _x) exitWith {};
        if ([_x] call FUNC(isUnitVisible)) then {
            private _iconId = toLower format [QGVAR(IconId_Player_%1_%2), _x, group _x isEqualTo group CLib_Player];
            DUMP("UNIT ICON ADDED: " + _iconId);
            [_x, _iconId] call FUNC(addUnitToGPS);
            DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
        };
    };

    // Register Beam dialog map to show unit markers
    [{
        ((findDisplay 444001) displayCtrl 10007) call CFUNC(registerMapControl);
        DUMP("Beam dialog found");
        DUMP((findDisplay 444001) displayCtrl 10007);
    }, {!(isNull ((findDisplay 12) displayCtrl 51))}] call CFUNC(waitUntil);

    // UAV Display
    [{
        ((findDisplay 160) displayCtrl 51) call CFUNC(registerMapControl);
        DUMP("UAV dialog found");
        DUMP((findDisplay 160) displayCtrl 51);
    }, {!(isNull ((findDisplay 160) displayCtrl 51))}] call CFUNC(waitUntil);

}] call CFUNC(addEventhandler);
