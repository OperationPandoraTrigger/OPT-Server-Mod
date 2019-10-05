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
    DUMP("MISSION STARTED");
    // Create markers for all players already in here.
    allPlayers apply {
        DUMP(_x);
        DUMP([_x] call FUNC(isUnitVisible));
        if (CLib_Player != _x && [_x] call FUNC(isUnitVisible) ) then {
            private _iconId = toLower format [QGVAR(IconId_Player_%1_%2), _x, group _x isEqualTo group CLib_Player];
            DUMP("UNIT ICON ADDED: " + _iconId);
            [_x, _iconId] call FUNC(addUnitToGPS);
            DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
        };
    };

    DUMP("ADD MAP HANDLER");
    addMissionEventHandler ["Map", {
        params ["_mapIsOpened", "_mapIsForced"];
        DUMP("MAP OPENED");
        DUMP(_mapIsOpened);

        if (_mapIsOpened) then {
            // UAV
            if (!isNull (findDisplay 160 displayCtrl 51)) exitWith {
                DUMP("UAV dialog found");
                DUMP((findDisplay 160) displayCtrl 51);
                (findDisplay 160 displayCtrl 51) call CFUNC(registerMapControl);
            };
        } else {
            (findDisplay 160 displayCtrl 51) call CFUNC(unregisterMapControl);
        };
    }];

    // TODO: Is there a better way to deal with artillery computers?
    [{
        if (shownArtilleryComputer) then {
            if (!isNull (findDisplay -1 displayCtrl 500) && (isNil {uinamespace getVariable QGVAR(artilleryComputerOpen)})) then {
                uiNamespace setVariable [QGVAR(artilleryComputerOpen), true];
                DUMP("Artillery dialog2 found");
                DUMP((findDisplay -1) displayCtrl 500);
                (findDisplay -1 displayCtrl 500) call CFUNC(registerMapControl);
            };
        } else {
            if (!isNil {uinamespace getVariable QGVAR(artilleryComputerOpen)}) then {
                DUMP("Artillery dialog2 REMOVED");   
                (findDisplay -1 displayCtrl 500) call CFUNC(unregisterMapControl);
                uinamespace setVariable [QGVAR(artilleryComputerOpen), nil];
            };
        };
    }, 1] call CFUNC(addPerFrameHandler);

}] call CFUNC(addEventhandler);
