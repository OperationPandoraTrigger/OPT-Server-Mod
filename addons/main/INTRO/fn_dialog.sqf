/**
* Description:
* Intro
*
* Author:
* Lord, form
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
* [] call FUNC(dialog);
*/
#include "macros.hpp"

//Dialog erstellen
(["opt_intro"] call BIS_fnc_rscLayer) cutRsc ["opt_intro_anzeige", "PLAIN", 1];

//Dialog definieren
private _currentCutDisplay = uiNamespace getVariable "opt_intro_anzeige";

private _logowest= "\opt\opt_client\addons\core\bilder\" + toLower EGVAR(SECTORCONTROL,nato_faction) + "_logo.paa";
private _logoeast= "\opt\opt_client\addons\core\bilder\" + toLower EGVAR(SECTORCONTROL,csat_faction) + "_logo.paa";
private _logoopt = "\opt\opt_client\addons\core\bilder\opt4_logo.paa";

// *** SPIELER-NAMEN ERMITTELN ***
GVAR(playernames_west) = [];
GVAR(playernames_east) = [];
{
    switch (side _x) do
    {
        case west: 
        {
            GVAR(playernames_west) pushBack name _x;
        };

        case east: 
        {
            GVAR(playernames_east) pushBack name _x;
        };
    };
} forEach playableUnits; 

// Fake-Namen
//GVAR(playernames_west) = ["Hans","peter","Uwe","klaus","Ute","jurgen","Anke","michael"];
//GVAR(playernames_east) = ["Ute","jurgen","Anke","michael"];

// Felder bestücken mit Infos
private _control = _currentCutDisplay displayCtrl 54000;
_control ctrlSetText _logoopt;

private _control = _currentCutDisplay displayCtrl 54001;
_control ctrlSetText GVAR(URL);

private _control = _currentCutDisplay displayCtrl 54002;
_control ctrlSetText GVAR(Kampagnename);

private _control = _currentCutDisplay displayCtrl 54003;
_control ctrlSetText GVAR(Schlachtnummer);

private _control = _currentCutDisplay displayCtrl 55000;
_control ctrlSetText "Verteidigungssektoren";

private _control = _currentCutDisplay displayCtrl 55001;
_control ctrlSetText _logowest;

private _control = _currentCutDisplay displayCtrl 55003;
_control ctrlSetText _logoeast;

private _control = _currentCutDisplay displayCtrl 55004;
_control ctrlSetText Format ["Sektor: %1", EGVAR(SECTORCONTROL,nato_sectors_str)];

private _control = _currentCutDisplay displayCtrl 55006;
_control ctrlSetText Format ["Sektor: %1", EGVAR(SECTORCONTROL,csat_sectors_str)];

private _control = _currentCutDisplay displayCtrl 55007;
_control ctrlSetText EGVAR(SECTORCONTROL,nato_faction);

private _control = _currentCutDisplay displayCtrl 55008;
_control ctrlSetText EGVAR(SECTORCONTROL,csat_faction);


GVAR(Textbox_west) = "";
GVAR(Textbox_east) = "";
GVAR(LoopCount) = 0;
[{
        params ["_args", "_handle"];
        private _currentCutDisplay = uiNamespace getVariable "opt_intro_anzeige";

        if (count GVAR(playernames_west) > GVAR(LoopCount)) then
        {
            private _control = _currentCutDisplay displayCtrl 55101;
            GVAR(Textbox_west) = [GVAR(Textbox_west), GVAR(playernames_west) select GVAR(LoopCount)] joinString endl;
            _control ctrlSetText GVAR(Textbox_west);
        };

        if (count GVAR(playernames_east) > GVAR(LoopCount)) then
        {
            private _control = _currentCutDisplay displayCtrl 55201;
            GVAR(Textbox_east) = [GVAR(Textbox_east), GVAR(playernames_east) select GVAR(LoopCount)] joinString endl;
            _control ctrlSetText GVAR(Textbox_east);
        };

        // 5 Sekunden nachdem die Liste komplett ist den Dialog und PerFrameHandler löschen
        if (GVAR(LoopCount) > ((count GVAR(playernames_west) max count GVAR(playernames_east))) + 5) then
        {
            _currentCutDisplay closeDisplay 1;
            _handle call CFUNC(removePerframeHandler);
        };     

        GVAR(LoopCount) = GVAR(LoopCount) + 1;
}, 1, _this] call CFUNC(addPerFrameHandler);
