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
params [
    ["_type", ""]
];

//Spieler Seite bestimmen
private _side = Side player;

//Shopart bestimmen
GVAR(vehicleType) = _type;
private _pool = switch (GVAR(vehicleType)) do 
{
    case "vehicles" : 
	{
        if (_side == west) then 
		{
            GVAR(nato_vehicles) + GVAR(nato_vehicles_supply)
        } 
		else 
		{
            GVAR(csat_vehicles) + GVAR(csat_vehicles_supply)
        };

    };
	case "choppers" : 
	{
        if (_side == west) then 
		{
            GVAR(nato_choppers)
        } 
		else 
		{
            GVAR(csat_choppers)
        };
        
    };
	case "armored" : 
	{
        if (_side == west) then 
		{
            GVAR(nato_armored)
        } 
		else 
		{
            GVAR(csat_armored)
        };
        
    };
	case "supplies" : 
	{
        if (_side == west) then 
		{
            GVAR(nato_supplies) + GVAR(nato_static)
        } 
		else 
		{
            GVAR(csat_supplies) + GVAR(csat_static)
        };
        
    };
	case "sea" : 
	{
        if (_side == west) then 
		{
            GVAR(nato_sea)
        } 
		else 
		{
            GVAR(csat_sea)
        };
        
    };
    default {[]};
};

systemChat format ["Dialog p:%1 S:%2",_pool,_side];

// Objekte größer 0€ bestimmen 
_pool = _pool select {_x select 1 > 0};

// Objekte Sortieren 
GVAR(orderDialogObjects) = [_pool, 1] call CBA_fnc_sortNestedArray; // billigste zuerst

//Dialog erstellen und definieren
private _success = createDialog "Dialogshopkaufen"; 

#define IDD_DLG_ORDER 20000
#define IDC_PLAYER_FLAG 20102
#define IDC_CTRL_VEHICLE_LIST 20002
#define IDC_CTRL_PRICE_LIST 20003

private _display = findDisplay IDD_DLG_ORDER;
private _listbox_vehicles = _display displayCtrl IDC_CTRL_VEHICLE_LIST;
private _budget = _display displayCtrl 20001;
private _order = _display displayCtrl 20004;
private _close = _display displayCtrl 20008;
private _sell = _display displayCtrl 20005;
private _rscPicture = _display displayCtrl IDC_PLAYER_FLAG;

//Boxen füllen
_budget = 5000000;

private _txtToAdd = GVAR(orderDialogObjects) apply {getText (configFile >> "CfgVehicles" >> (_x select 0) >> "displayName")};

private _picToAdd = GVAR(orderDialogObjects) apply 
{
    if (getText(configFile >> "cfgVehicles" >> (_x select 0) >> "picture") find ".paa" != -1) then 
	{
        getText (configFile >> "cfgVehicles" >> (_x select 0) >> "picture");
    } 
	else 
	{
        getText (configFile >> "cfgVehicles" >> (_x select 0) >> "editorPreview");
    };
};

private _dataToAdd = GVAR(orderDialogObjects) apply {_x select 0};

[IDD_DLG_ORDER, IDC_CTRL_VEHICLE_LIST, _txtToAdd, _picToAdd, _dataToAdd] call FUNC(fillLB);

// Flagge setzen
switch (_side) do 
{
    case west: 
	{
        _rscPicture ctrlSetText "\A3\Data_F\Flags\Flag_NATO_CO.paa";
    };
    case east: 
	{
        _rscPicture ctrlSetText "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
    };   
};

// Dialog neuladen für Verkaufsmodus
_sell ctrlAddEventHandler [ "ButtonClick", 
{
    closeDialog 0;
    ["opt_event_shop_kauf_onload","sale"] call CLib_fnc_localEvent;
}];

if (count GVAR(orderDialogObjects) == 0) then 
{
	// im Falle des Verkaufsbuttons -> Liste aller gefundenen Fahrzeuge
	// alle Objekte Fahrzeuge die auf allen Pads gefunden wurden

	{
	    private _objs = nearestObjects [_x, ["AllVehicles", "Thing"], 5];

    } foreach GVAR(pad_all_east);   


	// Gehe alle gefundenen Objekte durch und lösche sie, falls nicht in pool, oder ergänze um Verkaufspreis
	{
		
        _index = ((GVAR(all) apply {toLower (_x select 0)}) find (toLower (typeOf _x)));

        if (_index == -1) then 
        {
            _objs = _objs - [_x]; 
            
        } 
        else 
        {
            _pool pushBack [_x, (GVAR(all) select _index) select 2, (GVAR(all) select _index) select 3]; // füge Fahrzeug und Verkaufspreis hinzu
        };

	} foreach _objs;

    // Anzeige Objekte die mehr wert sind als 0€
    _pool = _pool select {_x select 2 > 0};

    //Sortierung der Fahrzeuge nach Preis
    GVAR(vehiclesToSell) = [_pool, 1, false] call CBA_fnc_sortNestedArray; // teuerste zuerst
	{
		_class = typeOf (_x select 0);
        _displayName = getText (configFile >> "CfgVehicles" >> _class >> "displayName");
		_listbox_vehicles lbAdd format ["%1", _displayName]; // Name
        _listbox_vehicles lbSetData [_forEachIndex, _class];

		// Verkaufspreis berechnen saleReturnValue % vom Vollpreis
        _picture = "";
        if (getText(configFile >> "cfgVehicles" >> _class >> "picture") find ".paa" != -1) then 
        {
            _picture = getText (configFile >> "cfgVehicles" >> _class >> "picture");
        } 
        else 
        {
            _picture = getText (configFile >> "cfgVehicles" >> _class >> "editorPreview");
        };

        _listbox_vehicles lbSetPicture [_forEachIndex, _picture];

    } foreach GVAR(vehiclesToSell);
};





