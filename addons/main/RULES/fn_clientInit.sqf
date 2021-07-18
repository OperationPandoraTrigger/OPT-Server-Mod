/**
* Description:
* Initialisierung Rules System
*
* Author:
* Lord-MDB, form
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* No
*
* Public:
* No
*
* Global:
* No
*
* API:
* No
*
* Example:
* [] call FUNC(clientInit);
*/
#include "macros.hpp"

// Wie oft (in Sekunden) wird die Spielerposition geprüft
#define INTERVAL_DISTANCE_CHECK 15

["missionStarted",
{
    [] call FUNC(setup_classnames);

    // UAV Drohnenstation
    [] call FUNC(uav);

    // Hint Meldung das Zuschauerslot besetzt wurde.
    if ((player isKindOf "VirtualSpectator_F") or (player isKindOf "ace_spectator_virtual")) then
    {
        private _txt = format["%1 hat einen Zuschauerslot ausgewählt.", name player];
        [_txt] remoteExecCall ["hint", 0, false];
    };

    if (!(OPT_SECTORCONTROL_trainingon)) then
    {
        // EH für Waffencheck
        player addEventHandler ["Take", {_this call FUNC(weaponCheck)}];

        // EH für Positionssperre in Fahrzeugen beim Einsteigen
        player addEventHandler ["GetInMan",
        {
            /*
                unit: Object - Unit the event handler is assigned to
                position: String - Can be either "driver", "gunner" or "cargo"
                vehicle: Object - Vehicle the unit entered
                turret: Array - turret path
            */
            params ["_unit", "_pos", "_veh", "_turret"];
            private _pos2 = assignedVehicleRole _unit select 0;

            if (typeOf _veh in GVAR(choppers) && !(typeOf _unit in GVAR(pilots)) && _pos2 in GVAR(blockedVehiclePositions_air) && !(typeOf _veh in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then
            {
                _unit action ["GetOut", _veh];
                private _txt = MLOC(SLOT_LOCK_PILOT);
                private _header = MLOC(SLOT_LOCK);
                hint format ["%1\n\n%2", _header, _txt];
            };

            if (typeOf _veh in GVAR(planes) && !(typeOf _unit in (GVAR(pilots) + GVAR(jetpilots))) && _pos2 in GVAR(blockedVehiclePositions_air) && !(typeOf _veh in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then
            {
                _unit action ["GetOut", _veh];
                private _txt = MLOC(SLOT_LOCK_PILOT);
                private _header = MLOC(SLOT_LOCK);
                hint format ["%1\n\n%2", _header, _txt];
            };

            if (typeOf _veh in GVAR(jets) && !(typeOf _unit in GVAR(jetpilots)) && _pos2 in GVAR(blockedVehiclePositions_air) && !(typeOf _veh in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then
            {
                _unit action ["GetOut", _veh];
                private _txt = MLOC(SLOT_LOCK_PILOT);
                private _header = MLOC(SLOT_LOCK);
                hint format ["%1\n\n%2", _header, _txt];
            };

            if ((typeOf _veh in GVAR(crew_vehicles) || _veh isKindOf "Tank") && !(typeOf _unit in GVAR(crew)) && _pos2 in GVAR(blockedVehiclePositions_veh)) then
            {
                _unit action ["GetOut", _veh];
                private _txt = MLOC(SLOT_LOCK_CREW);
                private _header = MLOC(SLOT_LOCK);
                hint format ["%1\n\n%2", _header, _txt];
            };
        }];

        // EH für Positionssperre in Fahrzeugen bei Platztausch
        player addEventHandler ["SeatSwitchedMan",
        {
            /*
                unit1: Object - Unit switching seat.
                unit2: Object - Unit with which unit1 is switching seat.
                vehicle: Object - Vehicle where switching seats is taking place.
            */
            params ["_unit", "_unit2", "_veh"];
            private _pos2 = assignedVehicleRole _unit select 0;

            if (typeOf _veh in GVAR(choppers) && !(typeOf _unit in GVAR(pilots)) && _pos2 in GVAR(blockedVehiclePositions_air) && !(typeOf _veh in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then
            {
                _unit action ["GetOut", _veh];
                private _txt = MLOC(SLOT_LOCK_PILOT);
                private _header = MLOC(SLOT_LOCK);
                hint format ["%1\n\n%2", _header, _txt];
            };

            if (typeOf _veh in GVAR(planes) && !(typeOf _unit in (GVAR(pilots) + GVAR(jetpilots))) && _pos2 in GVAR(blockedVehiclePositions_air) && !(typeOf _veh in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then
            {
                _unit action ["GetOut", _veh];
                private _txt = MLOC(SLOT_LOCK_PILOT);
                private _header = MLOC(SLOT_LOCK);
                hint format ["%1\n\n%2", _header, _txt];
            };

            if (typeOf _veh in GVAR(jets) && !(typeOf _unit in GVAR(jetpilots)) && _pos2 in GVAR(blockedVehiclePositions_air) && !(typeOf _veh in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then
            {
                _unit action ["GetOut", _veh];
                private _txt = MLOC(SLOT_LOCK_PILOT);
                private _header = MLOC(SLOT_LOCK);
                hint format ["%1\n\n%2", _header, _txt];
            };

            if ((typeOf _veh in GVAR(crew_vehicles) || _veh isKindOf "Tank") && !(typeOf _unit in GVAR(crew)) && _pos2 in GVAR(blockedVehiclePositions_veh)) then
            {
                _unit action ["GetOut", _veh];
                private _txt = MLOC(SLOT_LOCK_CREW);
                private _header = MLOC(SLOT_LOCK);
                hint format ["%1\n\n%2", _header, _txt];
            };
        }];

        // Regelmäßig checken ob sich der Spieler außerhalb der Karte aufhält
        [{
            private _mapSize = worldSize;
            private _pos = getPos player;
            private _posX = _pos select 0;
            private _posY = _pos select 1;
            if (((_posX < 0) || (_posX > _mapSize) || (_posY < 0) || (_posY > _mapSize)) && !(typeOf vehicle player in (GVAR(planes) + GVAR(jets)))) then
            {
                ["Cheat", "OutOfMap", [getPlayerUID player, name player, side player, _pos, typeOf vehicle player]] remoteExecCall ["OPT_LOGGING_fnc_writelog", 2, false];
                player setDamage 1;
                {hint format ["%1", MLOC(PLAYER_OUT_OF_MAP)];} remoteExec ["call", -2];
            };
        }, INTERVAL_DISTANCE_CHECK] call CFUNC(addPerFrameHandler);

        // Regelmäßig checken ob sich der Spieler in einem verbotenen Bereich in der nähe einer Feindlichen Basis aufhält
        switch OPT_GELDZEIT_Fraktionauswahl do
        {
            case "AAFvsCSAT":
            {
                switch playerSide do
                {
                    case east:
                    {
                        [{
                            if ((position player inArea "AAF_T_Zone1") or (position player inArea "AAF_T_Zone2")) then
                            {
                                ["Cheat", "KillZone", [getPlayerUID player, name player, side player, position player, typeOf vehicle player]] remoteExecCall ["OPT_LOGGING_fnc_writelog", 2, false];
                                player setDamage 1;
                                {hint format ["%1", MLOC(BASE_DISTANCE)];} remoteExec ["call", -2];
                            };
                        }, INTERVAL_DISTANCE_CHECK] call CFUNC(addPerFrameHandler);
                    };

                    case independent:
                    {
                        [{
                            if ((position player inArea "CSAT_T_Zone1") or (position player inArea "CSAT_T_Zone2")) then
                            {
                                ["Cheat", "KillZone", [getPlayerUID player, name player, side player, position player, typeOf vehicle player]] remoteExecCall ["OPT_LOGGING_fnc_writelog", 2, false];
                                player setDamage 1;
                                {hint format ["%1", MLOC(BASE_DISTANCE)];} remoteExec ["call", -2];
                            };
                        }, INTERVAL_DISTANCE_CHECK] call CFUNC(addPerFrameHandler);
                    };
                };
            };

            case "NATOvsCSAT":
            {
                switch playerSide do
                {
                    case east:
                    {
                        [{
                            if ((position player inArea "NATO_T_Zone1") or (position player inArea "NATO_T_Zone2")) then
                            {
                                ["Cheat", "KillZone", [getPlayerUID player, name player, side player, position player, typeOf vehicle player]] remoteExecCall ["OPT_LOGGING_fnc_writelog", 2, false];
                                player setDamage 1;
                                {hint format ["%1", MLOC(BASE_DISTANCE)];} remoteExec ["call", -2];
                            };
                        }, INTERVAL_DISTANCE_CHECK] call CFUNC(addPerFrameHandler);
                    };

                    case west:
                    {
                        [{
                            if ((position player inArea "CSAT_T_Zone1") or (position player inArea "CSAT_T_Zone2")) then
                            {
                                ["Cheat", "KillZone", [getPlayerUID player, name player, side player, position player, typeOf vehicle player]] remoteExecCall ["OPT_LOGGING_fnc_writelog", 2, false];
                                player setDamage 1;
                                {hint format ["%1", MLOC(BASE_DISTANCE)];} remoteExec ["call", -2];
                            };
                        }, INTERVAL_DISTANCE_CHECK] call CFUNC(addPerFrameHandler);
                    };
                };
            };

            case "NATOvsAAF":
            {
                switch playerSide do
                {
                    case independent:
                    {
                        [{
                            if ((position player inArea "NATO_T_Zone1") or (position player inArea "NATO_T_Zone2")) then
                            {
                                ["Cheat", "KillZone", [getPlayerUID player, name player, side player, position player, typeOf vehicle player]] remoteExecCall ["OPT_LOGGING_fnc_writelog", 2, false];
                                player setDamage 1;
                                {hint format ["%1", MLOC(BASE_DISTANCE)];} remoteExec ["call", -2];
                            };
                        }, INTERVAL_DISTANCE_CHECK] call CFUNC(addPerFrameHandler);
                    };

                    case west:
                    {
                        [{
                            if ((position player inArea "AAF_T_Zone1") or (position player inArea "AAF_T_Zone2")) then
                            {
                                ["Cheat", "KillZone", [getPlayerUID player, name player, side player, position player, typeOf vehicle player]] remoteExecCall ["OPT_LOGGING_fnc_writelog", 2, false];
                                player setDamage 1;
                                {hint format ["%1", MLOC(BASE_DISTANCE)];} remoteExec ["call", -2];
                            };
                        }, INTERVAL_DISTANCE_CHECK] call CFUNC(addPerFrameHandler);
                    };
                };
            };

            default
            {
                ERROR_LOG("RulesClientInit: Fehlerhafte Datenübergabe - Keine Fraktionauswahl erkannt");
            };
        };
    };  // if (!(OPT_SECTORCONTROL_trainingon))
}] call CFUNC(addEventhandler);
