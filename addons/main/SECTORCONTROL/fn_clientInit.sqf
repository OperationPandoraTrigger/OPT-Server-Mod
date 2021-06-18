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

/*
    //Positon für Spectatormodus 
    DFUNC(SetupSpectatorPositions) = 
    {
        ["AddLocation", ["1", "CSAT BASIS", "CSAT Basis", "\A3\Data_F\Flags\flag_CSAT_CO.paa", [[12369.8,12012.1,94.202],[0,0],[0,0,0],[94.202,true]],[10,true]]] call BIS_fnc_EGSpectator;
        ["AddLocation", ["2", "AAF BASIS", "AAF Basis","\A3\Data_F\Flags\flag_AAF_CO.paa", [[716.676,12256.3,344.832],[0,0],[0,0,0],[333.487,true]],[10,true]]] call BIS_fnc_EGSpectator;

        private _Flag1positionCSAT = [((GVAR(csat_flags_pos) select 0) select 0),((GVAR(csat_flags_pos) select 0) select 1),100]; 
        private _Flag2positionCSAT = [((GVAR(csat_flags_pos) select 1) select 0),((GVAR(csat_flags_pos) select 1) select 1),100]; 

        private _Flag1positionAAF = [((GVAR(aaf_flags_pos) select 0) select 0),((GVAR(aaf_flags_pos) select 0) select 1),100]; 
        private _Flag2positionAAF = [((GVAR(aaf_flags_pos) select 1) select 0),((GVAR(aaf_flags_pos) select 1) select 1),100]; 

        ["AddLocation", ["3", "CSAT Flagge 1", "CSAT Flagge 1","\A3\Data_F\Flags\flag_armex_CO.paa", [_Flag1positionCSAT,[0,0],[0,0,0],[100,true]],[10,true]]] call BIS_fnc_EGSpectator;
        ["AddLocation", ["4", "CSAT Flagge 2", "CSAT Flagge 2","\A3\Data_F\Flags\flag_armex_CO.paa", [_Flag2positionCSAT,[0,0],[0,0,0],[100,true]],[10,true]]] call BIS_fnc_EGSpectator;
        ["AddLocation", ["5", "AAF Flagge 1", "AAF Flagge 1","\A3\Data_F\Flags\flag_armex_CO.paa", [_Flag1positionAAF,[0,0],[0,0,0],[100,true]],[10,true]]] call BIS_fnc_EGSpectator;
        ["AddLocation", ["6", "AAF Flagge 2", "AAF Flagge 2","\A3\Data_F\Flags\flag_armex_CO.paa", [_Flag2positionAAF,[0,0],[0,0,0],[100,true]],[10,true]]] call BIS_fnc_EGSpectator;
    }; 
    [FUNC(SetupSpectatorPositions), 2, ""] call CLib_fnc_wait;   
*/
}] call CFUNC(addEventhandler);
