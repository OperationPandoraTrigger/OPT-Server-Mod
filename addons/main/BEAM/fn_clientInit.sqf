/**
* Description:
* Client-Initialisierung Beam System
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

GVAR(BeamDialogOpen) = false;
GVAR(BeamZoneMarkers) = [];

if (EGVAR(SECTORCONTROL,trainingon)) then
{
    // Teleport funktion
    player addAction [("<t color=""#f0bfbfbf"">" + ("Teleport") + "</t>"), {[] call FUNC(teleport)}, [], 0, false, true, '', "alive _target"];

    ["Respawn",
    {
        // Teleport funktion
        player addAction [("<t color=""#f0bfbfbf"">" + ("Teleport") + "</t>"), {[] call FUNC(teleport)}, [], 0, false, true, '', "alive _target"];
    }] call CFUNC(addEventhandler);
};

["missionStarted",
{
    // Hotkey fürs Basis-Beamen
    [
        "OPT",
        QGVAR(cba_addKeybind_beam_dialog),
        ["Beam-Funktion", "Beamen im Teleportbereich zur anderen Basis."],
        {call FUNC(beamdialog)},
        {},
        [
            DIK_F2,
            [false, false, false] // [shift, ctrl, alt]
        ]
    ] call CBA_fnc_addKeybind;

    // Init Beam-Schilder
    {
        _x addAction
        [
            format["<t color='#00FF00' size='1.25'>%1</t>", MLOC(BEAM)],
            {call FUNC(beamdialog)},
            nil,
            6,
            false,
            true,
            "",
            "(nearestObject [_target, 'Land_HelipadCivil_F'] distance _this < 10)",
            20
        ];
    } forEach [west_Basis_Teleport1, west_Basis_Teleport2, east_Basis_Teleport1, east_Basis_Teleport2, east_Basis_Teleport3];

    // Beim Karte-Schließen den Teleport-EH entfernen, damit man später aus versehen nicht teleportieren kann
    (finddisplay 12) displayAddEventhandler["KeyDown",
    {
        params ["_display", "_key"];
        // ESC oder M gedrückt?
        if (_key == 1 || _key == 50) then
        {
            [QGVAR(onMapSingleClick), "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

            // Beam-Sektormarker löschen
            if !(isNil "OPT_BEAM_MapHandler") then
            {
                private _MapControl = findDisplay 12 displayCtrl 51;
                _MapControl ctrlRemoveEventHandler ["Draw", OPT_BEAM_MapHandler];
            };

            openMap false;

            // alte Beam-Zonen löschen
            {
                deleteMarkerLocal _x;
            } forEach GVAR(BeamZoneMarkers);
            GVAR(BeamZoneMarkers) = [];
            GVAR(BeamDialogOpen) = false;
        };
    }];
}] call CFUNC(addEventhandler);
