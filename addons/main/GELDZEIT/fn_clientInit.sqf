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
    west_Basis_Teleport1 addAction [format["<t color='#00ff0f' size='1.25'>%1</t>", MLOC(BEAM)], {[] call FUNC(beam);},"", 6, false, true, "", ""];
    west_Basis_Teleport2 addAction [format["<t color='#00ff0f' size='1.25'>%1</t>", MLOC(BEAM)], {[] call FUNC(beam);},"", 6, false, true, "", ""];
    east_Basis_Teleport1 addAction [format["<t color='#00ff0f' size='1.25'>%1</t>", MLOC(BEAM)], {[] call FUNC(beam);},"", 6, false, true, "", ""];
    east_Basis_Teleport2 addAction [format["<t color='#00ff0f' size='1.25'>%1</t>", MLOC(BEAM)], {[] call FUNC(beam);},"", 6, false, true, "", ""];
}] call CFUNC(addEventhandler);
