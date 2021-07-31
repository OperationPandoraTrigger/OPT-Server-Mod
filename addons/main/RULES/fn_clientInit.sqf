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

    // TFAR-Frequenzüberschneidungen zwischen den Fraktionen vermeiden
    // ARF:     30 - 59 MHz
    // SWORD:   60 - 87 MHz
    switch playerSide do
    {
        case west:
        {
            switch EGVAR(SECTORCONTROL,nato_faction) do
            {
                case "ARF":
                {
                    GVAR(MIN_FREQ) = 30;
                    GVAR(MAX_FREQ) = 59;
                };

                case "SWORD":
                {
                    GVAR(MIN_FREQ) = 60;
                    GVAR(MAX_FREQ) = 87;
                };
            };
        };

        case east:
        {
            switch EGVAR(SECTORCONTROL,csat_faction) do
            {
                case "ARF":
                {
                    GVAR(MIN_FREQ) = 30;
                    GVAR(MAX_FREQ) = 59;
                };

                case "SWORD":
                {
                    GVAR(MIN_FREQ) = 60;
                    GVAR(MAX_FREQ) = 87;
                };
            };
        };
    };

    ["TFAR_event_OnFrequencyChanged",
    {
        params ["_TFAR_currentUnit", "_radio", "_channel", "_oldFrequency", "_newFrequency"];
        private _newFreq = parseNumber _newFrequency;
        if (_newFreq < GVAR(MIN_FREQ) || _newFreq > GVAR(MAX_FREQ)) then
        {
            // Meldung
            private _oldFreq = parseNumber _oldFrequency;
            hint format[MLOC(BAD_FREQUENCY), _newFreq, _oldFreq];
            playSound "additemok";
            ["Cheat", "BadFrequency", [getPlayerUID player, name player, side player, _newFreq, _radio]] remoteExecCall [QEFUNC(LOGGING,writelog), 2, false];

            // Frequenz zurückstellen
            private _isLRRadio = _radio isEqualType [];
            private _settings = _radio call ([TFAR_fnc_getSwSettings, TFAR_fnc_getLrSettings] select _isLRRadio);
            if (isNil "_settings") exitWith {};
            #define TFAR_FREQ_OFFSET 2
            (_settings select TFAR_FREQ_OFFSET) set [_channel, _oldFrequency];
            [_radio, _settings] call ([TFAR_fnc_setSwSettings, TFAR_fnc_setLrSettings] select _isLRRadio);
        };
    }] call CBA_fnc_addEventHandler;

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

            if (typeOf _veh in EGVAR(SHOP,choppers) && !(typeOf _unit in GVAR(pilots)) && _pos2 in GVAR(blockedVehiclePositions_air) && !(typeOf _veh in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then
            {
                _unit action ["GetOut", _veh];
                private _txt = MLOC(SLOT_LOCK_PILOT);
                private _header = MLOC(SLOT_LOCK);
                hint format ["%1\n\n%2", _header, _txt];
            };

            if (typeOf _veh in EGVAR(SHOP,planes) && !(typeOf _unit in (GVAR(pilots) + GVAR(jetpilots))) && _pos2 in GVAR(blockedVehiclePositions_air) && !(typeOf _veh in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then
            {
                _unit action ["GetOut", _veh];
                private _txt = MLOC(SLOT_LOCK_PILOT);
                private _header = MLOC(SLOT_LOCK);
                hint format ["%1\n\n%2", _header, _txt];
            };

            if (typeOf _veh in EGVAR(SHOP,jets) && !(typeOf _unit in GVAR(jetpilots)) && _pos2 in GVAR(blockedVehiclePositions_air) && !(typeOf _veh in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then
            {
                _unit action ["GetOut", _veh];
                private _txt = MLOC(SLOT_LOCK_PILOT);
                private _header = MLOC(SLOT_LOCK);
                hint format ["%1\n\n%2", _header, _txt];
            };

            if ((typeOf _veh in EGVAR(SHOP,crew_vehicles) || _veh isKindOf "Tank") && !(typeOf _unit in GVAR(crew)) && _pos2 in GVAR(blockedVehiclePositions_veh)) then
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

            if (typeOf _veh in EGVAR(SHOP,choppers) && !(typeOf _unit in GVAR(pilots)) && _pos2 in GVAR(blockedVehiclePositions_air) && !(typeOf _veh in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then
            {
                _unit action ["GetOut", _veh];
                private _txt = MLOC(SLOT_LOCK_PILOT);
                private _header = MLOC(SLOT_LOCK);
                hint format ["%1\n\n%2", _header, _txt];
            };

            if (typeOf _veh in EGVAR(SHOP,planes) && !(typeOf _unit in (GVAR(pilots) + GVAR(jetpilots))) && _pos2 in GVAR(blockedVehiclePositions_air) && !(typeOf _veh in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then
            {
                _unit action ["GetOut", _veh];
                private _txt = MLOC(SLOT_LOCK_PILOT);
                private _header = MLOC(SLOT_LOCK);
                hint format ["%1\n\n%2", _header, _txt];
            };

            if (typeOf _veh in EGVAR(SHOP,jets) && !(typeOf _unit in GVAR(jetpilots)) && _pos2 in GVAR(blockedVehiclePositions_air) && !(typeOf _veh in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then
            {
                _unit action ["GetOut", _veh];
                private _txt = MLOC(SLOT_LOCK_PILOT);
                private _header = MLOC(SLOT_LOCK);
                hint format ["%1\n\n%2", _header, _txt];
            };

            if ((typeOf _veh in EGVAR(SHOP,crew_vehicles) || _veh isKindOf "Tank") && !(typeOf _unit in GVAR(crew)) && _pos2 in GVAR(blockedVehiclePositions_veh)) then
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
            if (((_posX < 0) || (_posX > _mapSize) || (_posY < 0) || (_posY > _mapSize)) && !(typeOf vehicle player in EGVAR(SHOP,planes) + EGVAR(SHOP,jets))) then
            {
                ["Cheat", "OutOfMap", [getPlayerUID player, name player, side player, _pos, typeOf vehicle player]] remoteExecCall ["OPT_LOGGING_fnc_writelog", 2, false];
                player setDamage 1;
                {hint format ["%1", MLOC(PLAYER_OUT_OF_MAP)];} remoteExec ["call", -2];
            };
        }, INTERVAL_DISTANCE_CHECK] call CFUNC(addPerFrameHandler);

        // Regelmäßig checken ob sich der Spieler in einem verbotenen Bereich in der nähe einer Feindlichen Basis aufhält
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
    };  // if (!(OPT_SECTORCONTROL_trainingon))
}] call CFUNC(addEventhandler);
