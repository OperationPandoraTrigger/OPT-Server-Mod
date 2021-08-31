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
    {
        _x addAction
        [
            format["<t color='#00FF00' size='1.25'>%1</t>", MLOC(BEAM)],
            {[] call FUNC(beam);},
            nil,
            6,
            false,
            true,
            "",
            "(nearestObject [_target, 'Land_HelipadCivil_F'] distance _this < 10)",
            20
        ];
    } forEach [west_Basis_Teleport1, west_Basis_Teleport2, east_Basis_Teleport1, east_Basis_Teleport2];

    // Init Beam-Schilder (TEST des neuen Beamsystems)
    {
        _x addAction
        [
            format["<t color='#FF0000' size='1.25'>Neues Beam-System</t>"],
            {[] call FUNC(beamdialog);},
            nil,
            6,
            false,
            true,
            "",
            "(nearestObject [_target, 'Land_HelipadCivil_F'] distance _this < 10)",
            20
        ];
    } forEach [west_Basis_Teleport1, west_Basis_Teleport2, east_Basis_Teleport1, east_Basis_Teleport2];

    // Beim Karte-Schließen den Teleport-EH entfernen, damit man später aus versehen nicht teleportieren kann
    (finddisplay 12) displayAddEventhandler["KeyDown",
    {
        params ["_display", "_key"];
        // ESC oder M gedrückt?
        if (_key == 1 || _key == 50) then
        {
            [QGVAR(onMapSingleClick), "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
            openMap false;
        };
    }];

    // Nach Anlauf der Waffenruhe Marker für alle Beampunkte auf die Karte zeichnen
    [{
        {
            private _pos = _x select 0;
            private _markertext = _x select 2;

            // Nur Marker mit Text (nicht die Heimatbasis und der Außenposten!)
            if (_markertext != "") then
            {
                private _marker = createMarkerLocal [format ["beampointmarker_%1", _forEachIndex], _pos];
                _marker setMarkerColorLocal "ColorBlack";
                _marker setMarkerTypeLocal "mil_dot";
                _marker setMarkerTextLocal _markertext;
            };
        } forEach ([playerSide, false] call FUNC(getbeampoints));
    }, {(OPT_GELDZEIT_GAMESTAGE == GAMESTAGE_WAR)}, ""] call CLib_fnc_waitUntil;
}] call CFUNC(addEventhandler);
