/**
* Description:
* Intro
*
* Author:
* form
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

// Daten 
GVAR(playernames_west) = [];
GVAR(playernames_east) = [];

private _logowest= "\opt\opt_client\addons\core\bilder\" + toLower EGVAR(SECTORCONTROL,nato_faction) + "_logo.paa";
private _logoeast= "\opt\opt_client\addons\core\bilder\" + toLower EGVAR(SECTORCONTROL,csat_faction) + "_logo.paa";
private _logoopt = "\opt\opt_client\addons\core\bilder\opt4_logo.paa";

// *** SPIELER-NAMEN ERMITTELN ***
{
    _name = name _x;
    switch (side _x) do
    {
        case west : 
        {
            GVAR(playernames_west) = GVAR(playernames_west) + [ _name];
        };

        case east : 
        {
            GVAR(playernames_east) = GVAR(playernames_east) + [ _name];
        };
    };
    
}forEach playableUnits; 

// Felder bestücken in Infos
private _control = _currentCutDisplay displayCtrl 54000;
_control ctrlSetText _logoopt;

private _control = _currentCutDisplay displayCtrl 54001;
_control ctrlSetText GVAR(Url);

private _control = _currentCutDisplay displayCtrl 54002;
_control ctrlSetText GVAR(Kampagnenamen);

private _control = _currentCutDisplay displayCtrl 54003;
_control ctrlSetText GVAR(Schlachtnummer);

private _control = _currentCutDisplay displayCtrl 55000;
_control ctrlSetText "Verteidigungssektoren";

private _control = _currentCutDisplay displayCtrl 55001;
_control ctrlSetText _logowest;

private _control = _currentCutDisplay displayCtrl 55003;
_control ctrlSetText _logoeast;

private _control = _currentCutDisplay displayCtrl 55004;
_control ctrlSetText Format ["Sektor :%1",EGVAR(SECTORCONTROL,nato_sectors_str)];

private _control = _currentCutDisplay displayCtrl 55006;
_control ctrlSetText Format ["Sektor :%1",EGVAR(SECTORCONTROL,csat_sectors_str)];

private _control = _currentCutDisplay displayCtrl 55007;
_control ctrlSetText EGVAR(SECTORCONTROL,nato_faction);

private _control = _currentCutDisplay displayCtrl 55008;
_control ctrlSetText EGVAR(SECTORCONTROL,csat_faction);

// Box mit Namen füllen
GVAR(zahlspieler) = 0;
private _zahl =0;
GVAR(txt1) = "";
GVAR(txt2) = "";

GVAR(playernames_west) = ["Hans","peter","Uwe","klaus"];
GVAR(playernames_east) = ["Ute","jurgen","Anke","michael"];

//check Max Anzeige 39 Spieler
if (Count GVAR(playernames_west) > 39) then
{
    _zahl = 39;
}
else
{
    _zahl = Count (GVAR(playernames_west));
};

for "_i" from 1 to _zahl do
{
    [{
        _zahl = _this;
        private _currentCutDisplay = uiNamespace getVariable "opt_intro_anzeige";

        private _control = _currentCutDisplay displayCtrl 55101;
        GVAR(txt1) = format ["%1%2%3", GVAR(txt1), "\n", GVAR(playernames_west) select (_zahl-1)];
        _control ctrlSetText GVAR(txt1);
        systemChat format ["T1:%1 Z:%2",GVAR(txt1),_zahl];

        private _control = _currentCutDisplay displayCtrl 55201;
        GVAR(txt2) = format ["%1%2%3", GVAR(txt2), "\n", GVAR(playernames_east) select (_zahl-1)];
        _control ctrlSetText GVAR(txt2);
        systemChat format ["T2:%1 Z:%2",GVAR(txt2),_zahl];

    }, 2 ,_i] call CLib_fnc_wait;
};

//Zeit bis zum Autoschliessen des Intros
[{
    (["opt_intro"] call BIS_fnc_rscLayer) cutRsc ["RscTitleDisplayEmpty", "PLAIN", 1];

}, 40 ,"40"] call CLib_fnc_wait;






