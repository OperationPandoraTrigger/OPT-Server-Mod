#include "macros.hpp"

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


// Register Beam dialog map to show unit markers too. Only try doing this once the mission actually started, so everything is hopefully in place.
// Because we can only do this for an existing display/control, we gotta wait until it actually exists
["missionStarted", {
    [{
        ((findDisplay 444001) displayCtrl 10007) call CFUNC(registerMapControl);
    }, {!(isNull ((findDisplay 12) displayCtrl 51))}] call CFUNC(waitUntil);

}] call CFUNC(addEventhandler);





/*
The purpose of this stateMachine is to draw mapicons for each unit, group and vehicle whenever a map control is open.
It draws a single icon per frame to prevent it from hogging resources, while still guaranteeing maximum drawrate.
Once all icons have been drawn, it cycles back through them in perpetuity. To do this, it has two steps:
Step 1 initializes _units and _vehicles with what needs to be drawn (init), step 2 draws a single icon (addIcons).
*/
GVAR(iconStatemachine) = call CFUNC(createStatemachine);

[GVAR(iconStatemachine), "init", {
    private _units = allUnits select {[_x] call FUNC(isUnitVisible)};

    // TODO: For now, we ignore empty vehicles
    // private _vehicles = vehicles select {[_x] call FUNC(isVehicleVisible)};
    private _vehicles = [];

    // Figure out what icons we had last time. Maybe it's different this time around and we need to remove some icons!
    GVAR(lastProcessedIcons) = (CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0};

    {
        DUMP("ICON REMOVED: " + _x);
        [_x, "hoverin"] call CFUNC(removeMapGraphicsEventHandler);
        [_x, "hoverout"] call CFUNC(removeMapGraphicsEventHandler);
        [_x] call CFUNC(removeMapGraphicsGroup);
    } count (GVAR(lastProcessedIcons) - GVAR(processedIcons));

    // Now we got a clean slate again, let's start the cycle.
    GVAR(processedIcons) = [];

	if (_units isEqualTo [] && _vehicles isEqualTo []) then {
        "init"
    } else {
        ["addIcons", [_units, _vehicles]]
    };
}] call CFUNC(addStatemachineState);

[GVAR(iconStatemachine), "addIcons", {
    params ["_dummy", "_data"];
    _data params ["_units", "_vehicles"];

    // First, we process a single Unit
    if (!(_units isEqualTo [])) then {
        private _unit = _units deleteAt 0;

        // If it's an invalid unit, move on to the next one
        while {!([_unit] call FUNC(isUnitVisible)) && {!(_units isEqualTo [])}} do {
            _unit = _units deleteAt 0;
        };

        if ([_unit] call FUNC(isUnitVisible)) then {
            if (true) then {
            //if (isNull objectParent _unit) then { // Infantry
            
                // Unit marker is only shown for own group or if you're a group leader
                if ([CLib_Player] call FUNC(isUnitLeader) || group _unit == group CLib_Player ) then {
                    private _iconId = toLower format [QGVAR(IconId_Player_%1_%2), _unit, group _unit isEqualTo group CLib_Player];
                    // We only add icons that we don't have yet already, but we obviously mark them as processed.
                    GVAR(processedIcons) pushBack _iconId;
                    if !(_iconId in GVAR(lastProcessedIcons)) then {
                        DUMP("UNIT ICON ADDED: " + _iconId);
                        [_unit, _iconId] call FUNC(addUnitToGPS);
                    };
                };
                // If the unit is a group leader, he gets the fancy group icon as well!
                /*
                if (leader _unit == _unit) then {
                    private _iconId = toLower format [QGVAR(IconId_Group_%1_%2_%3), group _unit, _unit, group _unit isEqualTo group CLib_Player];
                    GVAR(processedIcons) pushBack _iconId;
                    if !(_iconId in GVAR(lastProcessedIcons)) then {
                        DUMP("GROUP ICON ADDED: " + _iconId);
                        [group _unit, _iconId] call FUNC(addGroupToGPS);
                    };
                };
                */
            } else { // in vehicle
            /*
                private _vehicle = objectParent _unit;
                // Vehicles should also only be visible if manned by people from your squad or by a group leader.
                // So we iterate over all occupants and check if one of them qualifies. If so, we show the vehicle.
                {
                    if ([_x] call FUNC(isUnitLeader) || group _x == group CLib_Player) exitWith {
                        private _nbrGroups = 0;
                        // If a group leader is in the vehicle, the group icon must be attached to the vehicle marker
                        private _inGroup = {
                            if (leader _x == _x) then {
                                // Need to add a unique number, because multiple group leaders could sit in here.
                                _nbrGroups = _nbrGroups + 1;
                                private _iconId = toLower format [QGVAR(IconId_Group_%1_%2_%3_%4), group _x, _vehicle, group _unit isEqualTo group CLib_Player, _nbrGroups];
                                GVAR(processedIcons) pushBack _iconId;
                                if !(_iconId in GVAR(lastProcessedIcons)) then {
                                    DUMP("GROUP ICON ADDED: " + _iconId);
                                    [group _x, _iconId, [0, -20 * _nbrGroups]] call FUNC(addGroupToGPS);
                                };
                            };
                            ({group _x isEqualTo group CLib_Player} count crew _vehicle) > 0;
                        } count crew _vehicle;
                        _inGroup = _inGroup > 0;
                        private _iconId = toLower format [QGVAR(IconId_Vehicle_%1_%2), _vehicle, _inGroup];
                        GVAR(processedIcons) pushBack _iconId;
                        if !(_iconId in GVAR(lastProcessedIcons)) then {
                            DUMP("VEHICLE ADDED: " + _iconId);
                            [_vehicle, _iconId, _inGroup] call FUNC(addVehicleToGPS);
                        };
                    }
                } forEach crew _vehicle;
            */
            };
        };

    };

// Currently, we do not show empty vehicles at all.
    // Then we deal with empty vehicles
    // if (!(_vehicles isEqualTo [])) then {
    //     private _vehicle = _vehicles deleteAt 0;

    //     while {!([_vehicle] call FUNC(isVehicleVisible)) && {!(_vehicle isEqualTo [])}} do {
    //         _vehicle = _vehicles deleteAt 0;
    //     };

    //     if ([_vehicle] call FUNC(isVehicleVisible)) then {
    //         private _iconId = toLower format [QGVAR(IconId_EmptyVehicle_%1), _vehicle];
    //         GVAR(processedIcons) pushBack _iconId;
    //         if !(_iconId in GVAR(lastProcessedIcons)) then {
    //             DUMP("EMPTY VEHICLE ADDED: " + _iconId);
    //             [_vehicle, _iconId, false, true] call FUNC(addVehicleToGPS);
    //         };
    //     };
    // };

    if (_units isEqualTo [] && _vehicles isEqualTo []) then {
        {
            DUMP("ICON REMOVED: " + _x);
            [_x, "hoverin"] call CFUNC(removeMapGraphicsEventHandler);
            [_x, "hoverout"] call CFUNC(removeMapGraphicsEventHandler);
            [_x] call CFUNC(removeMapGraphicsGroup);
        } count (GVAR(lastProcessedIcons) - GVAR(processedIcons));
        //[["deleteIcons", _iconsToDelete], _defaultState] select (_iconsToDelete isEqualTo []);
    };

// Keep adding icons until all units and vehicles have been dealt with. Once finished, we cycle from the beginning.
if (_units isEqualTo [] && _vehicles isEqualTo []) then {
    "init"
} else {
    ["addIcons", [_units, _vehicles]]
}
}] call CFUNC(addStatemachineState);

["DrawMapGraphics", {
    if (GVAR(lastFrameTriggered) != diag_frameNo) then {
        GVAR(iconStatemachine) call CFUNC(stepStatemachine);
        GVAR(lastFrameTriggered) = diag_frameNo;
    };
}] call CFUNC(addEventhandler);

// [{
//     if (GVAR(lastFrameTriggered) != diag_frameNo) then {
//         GVAR(iconStatemachine) call CFUNC(stepStatemachine);
//         GVAR(lastFrameTriggered) = diag_frameNo;
//     };
// }, 0.25] call CFUNC(addPerFrameHandler);
