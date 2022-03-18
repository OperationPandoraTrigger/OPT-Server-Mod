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
private _success = createDialog "Dialogintro";

//Dialog definieren
#define IDD_DLG_ORDER 55000
private _display = findDisplay IDD_DLG_ORDER;

// Daten 
GVAR(playernames_west)	= [];
GVAR(playernames_east)	= [];

private _logowest= "\opt\opt_client\addons\core\bilder\arf_logo.paa";
private _logoeast= "\opt\opt_client\addons\core\bilder\sword_logo.paa";
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
ctrlSetText [54000, _logoopt];
ctrlSetText [54001, GVAR(Url)];
ctrlSetText [54002, GVAR(Kampagnenamen)];
ctrlSetText [54003, GVAR(Schlachtnummer)];
ctrlSetText [55000, "Gesamtergebnis"];
ctrlSetText [55001, _logowest];
ctrlSetText [55003, _logoeast];
ctrlSetText [55004, GVAR(introWGes)];
ctrlSetText [55006, GVAR(introEGes)];
ctrlSetText [55007, EGVAR(SECTORCONTROL,nato_faction)];
ctrlSetText [55008, EGVAR(SECTORCONTROL,csat_faction)];

// Box mit Namen füllen
GVAR(zahlspieler) = 0;
private _zahl =0;

//check Max Anzeige 39 Spieler
if (Count (GVAR(playernames_west)+GVAR(playernames_east)) > 39) then
{
    _zahl = 39;
}
else
{
    _zahl = Count (GVAR(playernames_west)+GVAR(playernames_east));
};

for "_i" from 1 to _zahl do
{
    GVAR(zahlspieler) = _i;
    [{

        ctrlSetText [(55100+GVAR(zahlspieler)), format ["%1",GVAR(playernames_west) select (GVAR(zahlspieler)-1)]];
        ctrlSetText [(55200+GVAR(zahlspieler)), format ["%1",GVAR(playernames_east) select (GVAR(zahlspieler)-1)]];	

    }, 2 ,"2"] call CLib_fnc_wait;
};

//Zeit bis zum Autoschliessen des Intros
[{
    closeDialog 55000;

}, 40 ,"40"] call CLib_fnc_wait;






