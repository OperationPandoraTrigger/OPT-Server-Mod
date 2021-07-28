/**
* Description:
* Initialisierung Flaggensystem Client
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

["missionStarted", {
    /*
    * https://cbateam.github.io/CBA_A3/docs/files/keybinding/fnc_addKeybind-sqf.html
    */
    [
        "OPT",
        QGVAR(cba_capture_flag),
        ["Flagge ziehen", "Flagge ziehen, wenn anvisiert."],
        {
            private _cursorObject = cursorObject;
            if (
                [_cursorObject, player] call FUNC(captureFlagCondition)
            ) then {
                [_cursorObject, player] call FUNC(captureFlag);
            };
        },
        {},
        [
            DIK_F,
            [false, false, false] // [shift, ctrl, alt]
        ]
    ] call CBA_fnc_addKeybind;

    // Flaggen Wahl AddAction  erstellen
    [] call FUNC(addflagmenu);

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
}] call CFUNC(addEventhandler);
