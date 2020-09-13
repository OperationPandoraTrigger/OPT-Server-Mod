/**
* Description:Einlesen der Daten beim Öffnen des Dialogs durch den Spieler
* 
* 
* Author:
* [GNC]Lord-MDB
*
* Arguments:
* 
*
* Return value:
* 
*
* Server Only:
* No
* 
* Global:
* No
* 
* API:
* No
* 
* Example:
* 
*/

#include "macros.hpp"

//Dateneinlesen
#include "fn_config.sqf";

//Typ einlesen
params 
[
    ["_type", ""]
];

//Spieler Seite bestimmen
private _side = playerside;

//Dialog erstellen
private _success = createDialog "DialogVerkaufs"; 

//Dialog definieren
#define IDD_DLG_ORDER 23000
#define IDC_PLAYER_FLAG 23003
#define IDC_CTRL_VEHICLE_LIST 23101
#define IDC_CTRL_PRICE_LIST 23102

private _display = findDisplay IDD_DLG_ORDER;
private _budget = _display displayCtrl 23100;
private _close = _display displayCtrl 23104;
private _sell = _display displayCtrl 23103;
private _rscPicture = _display displayCtrl IDC_PLAYER_FLAG;
private _listbox_vehicles = _display displayCtrl IDC_CTRL_VEHICLE_LIST;
private _editbox_info = _display displayCtrl IDC_CTRL_PRICE_LIST;

_order ctrlEnable false;
_sell ctrlShow false;
GVAR(pads) = [];
private _pool = [];
GVAR(vehicleType) = _type;

[_budget] call opt_common_fnc_renderbudget;

// Flagge setzen
switch (_side) do 
{
    case west: 
	{
        _rscPicture ctrlSetText "\A3\Data_F\Flags\Flag_NATO_CO.paa";

        GVAR(pads) = [VerkaufsBoxWest];
    };
    case east: 
	{
        _rscPicture ctrlSetText "\A3\Data_F\Flags\Flag_CSAT_CO.paa";

        GVAR(pads) = [VerkaufsBoxEast];
    }; 
    case independent: 
	{
        _rscPicture ctrlSetText "\A3\Data_F\Flags\Flag_AAF_CO.paa";

        GVAR(pads) = [VerkaufsBoxindependent];
    };   
};

if (_type == "sell") then 
{
    //Kaufbutton/Konfigbutton ausblenden
    _order ctrlShow false;
    _konfig ctrlShow false;

    //Verkaufsbutton einblenden
    _sell ctrlShow true;

    //Box und Anzeige InFahrzeug ausblenen
    _padBox ctrlShow false;
    _moveInVeh ctrlShow false;

    //Fahrzeug Speicher, Fahrzeuge auf den Pad
    GVAR(sellVeh) = [];

    //Räumen Button Ausblenden
    _remove ctrlShow false;

	// im Falle des Verkaufsbuttons -> Liste aller gefundenen Fahrzeuge
	// alle Objekte Fahrzeuge die auf allen Pads gefunden wurden

    private _objs = [];

	GVAR(pads) apply 
    {
	    private _ob = nearestObjects [_x, ["AllVehicles", "Thing"], 8];

        if ((count _ob) != 0) then 
        {

            _objs append _ob; 

        };   
    };   
 
	// Gehe alle gefundenen Objekte durch und lösche sie, falls nicht in pool, oder ergänze um Verkaufspreis
	_objs apply 
    {
		
        private _index = ((GVAR(all) apply {toLower (_x select 0)}) find (toLower (typeOf _x)));

        if (_index == -1) then 
        {
            _objs = _objs - [_x]; 
            
        } 
        else 
        {
            _pool pushBack [_x, (GVAR(all) select _index) select 2, (GVAR(all) select _index) select 3]; // füge Fahrzeug und Verkaufspreis hinzu
            GVAR(sellVeh) append [_x];
        };

	};

    // Anzeige Objekte die mehr wert sind als 0€
    _pool = _pool select {_x select 2 > 0};

    //Sortierung der Fahrzeuge nach Preis
    GVAR(vehiclesToSell) = _pool;

	{
		_class = typeOf (_x select 0);
        _displayName = getText (configFile >> "CfgVehicles" >> _class >> "displayName");
		_listbox_vehicles lbAdd format ["%1", _displayName]; // Name
        _listbox_vehicles lbSetData [_forEachIndex, _class];

		// Verkaufspreis berechnen saleReturnValue % vom Vollpreis
        _picture = "";

        _picture = getText (configFile >> "cfgVehicles" >> _class >> "editorPreview");

        _listbox_vehicles lbSetPicture [_forEachIndex, _picture];

    } foreach GVAR(vehiclesToSell);
  
};

// Button Listbox Events 
//InfoBox Erneuern bei änderung
_listbox_vehicles ctrlAddEventHandler [ "LBSelChanged", 
{
	params ["_listbox_vehicles", "_sel_class"];

    private _display = findDisplay IDD_DLG_ORDER;
    private _listbox_vehicles = _display displayCtrl IDC_CTRL_VEHICLE_LIST;
    private _editbox_info = _display displayCtrl IDC_CTRL_PRICE_LIST;
    private _budget = _display displayCtrl 23100;

    private _sel_class = lbCurSel _listbox_vehicles;
    private _class = _listbox_vehicles lbData _sel_class;

    _editbox_info ctrlSetStructuredText parseText ([_class,_sel_class] call FUNC(getVehicleInfo));

    // Budget 
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;

}];


// Verkaufs Ausführen
_sell ctrlAddEventHandler [ "ButtonClick", 
{
    private _display = findDisplay IDD_DLG_ORDER;
    private _listbox_vehicles = _display displayCtrl IDC_CTRL_VEHICLE_LIST;
    private _editbox_info = _display displayCtrl IDC_CTRL_PRICE_LIST;
    private _budget = _display displayCtrl 23100;

    private _sel_class = lbCurSel _listbox_vehicles;
    private _class = _listbox_vehicles lbData _sel_class;

    private _price = 0;
    private _magazineVehArryNew=[];
    private _bewaffnungpreis = 0;
    private _side = civilian;
    private _sellveh = "";
    private _gutschrift = 0;

    if (_class in (GVAR(vehClassWestWW))) then 
    {
        _side = west;
    };    

    if (_class in (GVAR(vehClassEastWW))) then 
    {
        _side = east;
    }; 

    if (_class in (GVAR(vehClassindependentWW))) then 
    {
        _side = independent;
    };   

    _price = [_class] call FUNC(getPrice);
    _sellveh = GVAR(sellVeh) select _sel_class;
    _magazineVehArryNew = [_sellveh] call FUNC(auslesenMagazine);
    _bewaffnungpreis = [_side, _magazineVehArryNew] call FUNC(geldVorhandeneBewaffnung);   
    _gutschrift = _price + _bewaffnungpreis;

    [getPlayerUID player, Name Player, playerSide, typeOf _sellveh, _gutschrift, "+"] remoteExecCall ["OPT_GELDZEIT_fnc_updateBudget", 2, false];

    //Fahrzeug löschen
    deleteVehicle _sellveh;

    // Update Geldanzeige
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;

    // lösche Option aus Verkaufsmenü!
    _listbox_vehicles lbDelete _sel_class;

    // lösche Fahrzeug aus vehicleToSell!
    GVAR(sellVeh) deleteAt _sel_class;

}];

