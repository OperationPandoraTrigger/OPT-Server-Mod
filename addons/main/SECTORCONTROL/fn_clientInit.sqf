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

// Sektor-Einfärbung (auf der PreMission Karte)
private _MapControl = findDisplay 53 displayCtrl 51;
_MapControl ctrlAddEventHandler ["Draw",
{
    params ["_control"];
    private _color = [];
    {
        if (_forEachIndex in OPT_SECTORCONTROL_csat_allsectors) then
        {
            _color = [0.5, 0, 0, 0.1]; // OPFOR
        }
        else
        {
            _color = [0, 0.3, 0.6, 0.2]; // BLUFOR
        };
        _control drawTriangle [_x # 3, _color, "#(rgb,1,1,1)color(1,1,1,1)"];
    } forEach OPT_SECTORCONTROL_AllSectors;
}];

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

    // Quickfix - Die Veriablen werden sonst zu spät geladen
    [] call EFUNC(RULES,setup_classnames);

    // Flaggen Wahl AddAction  erstellen
    [] call FUNC(addflagmenu);

    // Sektor-Einfärbung (auf der normalen Karte)
    if (EGVAR(GELDZEIT,GAMESTAGE) != GAMESTAGE_WAR) then
    {
        private _MapControl = findDisplay 12 displayCtrl 51;
        OPT_SECTORCONTROL_MapHandler = _MapControl ctrlAddEventHandler ["Draw",
        {
            params ["_control"];
            private _color = [];
            {
                if (_forEachIndex in OPT_SECTORCONTROL_csat_allsectors) then
                {
                    _color = [0.5, 0, 0, 0.1]; // OPFOR
                }
                else
                {
                    _color = [0, 0.3, 0.6, 0.2]; // BLUFOR
                };
                _control drawTriangle [_x # 3, _color, "#(rgb,1,1,1)color(1,1,1,1)"];
            } forEach OPT_SECTORCONTROL_AllSectors;
        }];    
    };
}] call CFUNC(addEventhandler);
