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
                (_cursorObject in GVAR(nato_flags) or _cursorObject in GVAR(csat_flags) or _cursorObject in GVAR(aaf_flags)) and
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

}] call CFUNC(addEventhandler);