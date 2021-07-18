/**
* Description:
* Initialisierung Geld Zeit System
*
* Author:
* Lord-MDB
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

//Event Bildschirmanzeige
[
    EVENT_SPIELUHR_ENDBILDSCHIRM,
    {
        [] call FUNC(ende);
    },
    []
] call CFUNC(addEventHandler);

[] call FUNC(playerinit);

["missionStarted",
{
    [getPlayerUID player, profileName, playerSide] remoteExecCall [QFUNC(updatePlayerList), 2, false];

    player action ["WeaponOnBack", player];

    // TEAM BALANCE - end mission for player if side is full
    // nicht in onPlayerRespawn, da nur zu Missionsbeginn pruefen
    if (!(OPT_SECTORCONTROL_trainingon)) then
    {
        if (isMultiplayer && hasInterface) then
        {
            if (GVAR(TEAMBALANCE) > 0) then
            {
                switch GVAR(Fraktionauswahl) do
                {
                    case "AAFvsCSAT":
                    {
                        private _en_pa = if (playerSide == independent) then {playersNumber opfor} else {playersNumber independent};

                        if ((playersNumber playerSide) > (_en_pa + GVAR(TEAMBALANCE))) then
                        {
                            endMission (switch (playerSide) do
                            {
                                case (independent) : {"balanceindependent"};
                                case (opfor) : {"balanceOPFOR"};
                                default {"LOSER"};
                            });
                        };
                    };

                    case "NATOvsCSAT":
                    {
                        private _en_pa = if (playerSide == blufor) then {playersNumber opfor} else {playersNumber blufor};

                        if ((playersNumber playerSide) > (_en_pa + GVAR(TEAMBALANCE))) then
                        {
                            endMission (switch (playerSide) do
                            {
                                case (blufor) : {"balanceBLUFOR"};
                                case (opfor) : {"balanceOPFOR"};
                                default {"LOSER"};
                            });
                        };
                    };

                    case "NATOvsAAF":
                    {
                        private _en_pa = if (playerSide == blufor) then {playersNumber independent} else {playersNumber blufor};

                        if ((playersNumber playerSide) > (_en_pa + GVAR(TEAMBALANCE))) then
                        {
                            endMission (switch (playerSide) do
                            {
                                case (blufor) : {"balanceBLUFOR"};
                                case (independent) : {"balanceindependent"};
                                default {"LOSER"};
                            });
                        };
                    };

                    default
                    {
                        ERROR_LOG("clientinit: Fehlerhafte Datenuebergabe - Keine Fraktionauswahl erkannt");
                    };
                };
            };
        };
    };

    // Freeze-Time
    [] call FUNC(frezztime);

    // Hotkey fürs Basis-Beamen
    [
        "OPT",
        QGVAR(cba_addKeybind_beam_dialog),
        ["Beam-Funktion", "Beamen im Teleportbereich zur anderen Basis."],
        {
            [] call FUNC(beam);
        },
        {},
        [
            DIK_F2,
            [false, false, false] // [shift, ctrl, alt]
        ]
    ] call CBA_fnc_addKeybind;

    // Init Beam-Schilder
    switch GVAR(Fraktionauswahl) do
    {
        case "AAFvsCSAT":
        {
            independent_Basis_Teleport1 addAction [format["<t color='#00ff0f' size='1.25'>%1</t>", MLOC(BEAM)], {[] call FUNC(beam);},"", 6, false, true, "", ""];
            independent_Basis_Teleport2 addAction [format["<t color='#00ff0f' size='1.25'>%1</t>", MLOC(BEAM)], {[] call FUNC(beam);},"", 6, false, true, "", ""];
            east_Basis_Teleport1 addAction [format["<t color='#00ff0f' size='1.25'>%1</t>", MLOC(BEAM)], {[] call FUNC(beam);},"", 6, false, true, "", ""];
            east_Basis_Teleport2 addAction [format["<t color='#00ff0f' size='1.25'>%1</t>", MLOC(BEAM)], {[] call FUNC(beam);},"", 6, false, true, "", ""];
        };

        case "NATOvsCSAT":
        {
            west_Basis_Teleport1 addAction [format["<t color='#00ff0f' size='1.25'>%1</t>", MLOC(BEAM)], {[] call FUNC(beam);},"", 6, false, true, "", ""];
            west_Basis_Teleport2 addAction [format["<t color='#00ff0f' size='1.25'>%1</t>", MLOC(BEAM)], {[] call FUNC(beam);},"", 6, false, true, "", ""];
            east_Basis_Teleport1 addAction [format["<t color='#00ff0f' size='1.25'>%1</t>", MLOC(BEAM)], {[] call FUNC(beam);},"", 6, false, true, "", ""];
            east_Basis_Teleport2 addAction [format["<t color='#00ff0f' size='1.25'>%1</t>", MLOC(BEAM)], {[] call FUNC(beam);},"", 6, false, true, "", ""];
        };

        case "NATOvsAAF":
        {
            west_Basis_Teleport1 addAction [format["<t color='#00ff0f' size='1.25'>%1</t>", MLOC(BEAM)], {[] call FUNC(beam);},"", 6, false, true, "", ""];
            west_Basis_Teleport2 addAction [format["<t color='#00ff0f' size='1.25'>%1</t>", MLOC(BEAM)], {[] call FUNC(beam);},"", 6, false, true, "", ""];
            independent_Basis_Teleport1 addAction [format["<t color='#00ff0f' size='1.25'>%1</t>", MLOC(BEAM)], {[] call FUNC(beam);},"", 6, false, true, "", ""];
            independent_Basis_Teleport2 addAction [format["<t color='#00ff0f' size='1.25'>%1</t>", MLOC(BEAM)], {[] call FUNC(beam);},"", 6, false, true, "", ""];
        };

        default
        {
            ERROR_LOG("GeldzeitClientInit: Fehlerhafte Datenuebergabe - Keine Fraktionauswahl erkannt");
        };
    };
}] call CFUNC(addEventhandler);
