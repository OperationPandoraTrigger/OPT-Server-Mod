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

//Shopart bestimmen
GVAR(vehicleType) = _type;
private _pool = [];
GVAR(pads) = [];
GVAR(moveInVeh) = false;

//Dialog erstellen
private _success = createDialog "Dialogshopkaufen"; 

//Dialog definieren
#define IDD_DLG_ORDER 20000
#define IDC_PLAYER_FLAG 20001

private _display = findDisplay IDD_DLG_ORDER;
private _budget = _display displayCtrl 20009;
private _order = _display displayCtrl 20004;
private _close = _display displayCtrl 20005;
private _remove = _display displayCtrl 20008;
private _konfig = _display displayCtrl 20007;
private _rscPicture = _display displayCtrl IDC_PLAYER_FLAG;
private _padBox = _display displayCtrl 20003;
private _moveInVeh = _display displayCtrl 20006;

_order ctrlEnable false;
_sell ctrlShow false;
_moveInVeh ctrlSetTextColor [0.0, 1.0, 0.0, 1];

switch (GVAR(vehicleType)) do 
{
	case "choppers" : 
	{
        if (_side == west) then 
		{
            _pool = GVAR(nato_choppers);
            GVAR(pads) = GVAR(pad_air_west);
        } 
		else 
		{
            _pool = GVAR(csat_choppers);
            GVAR(pads) = GVAR(pad_air_east);
        };
        GVAR(moveInVeh) = true;
        
    };
	case "vehicles" : 
	{
        if (_side == west) then 
		{
            _pool = GVAR(nato_armored) + GVAR(nato_vehicles) + GVAR(nato_vehicles_supply);
            GVAR(pads) = GVAR(pad_veh_west);
        } 
		else 
		{
            _pool = GVAR(csat_armored) + GVAR(csat_vehicles) + GVAR(csat_vehicles_supply);
            GVAR(pads) = GVAR(pad_veh_east);
        };
        GVAR(moveInVeh) = true;
        
    };
	case "supplies" : 
	{
        if (_side == west) then 
		{
            _pool = GVAR(nato_supplies) + GVAR(nato_static);
            GVAR(pads) = GVAR(pad_sup_west);
        } 
		else 
		{
            _pool = GVAR(csat_supplies) + GVAR(csat_static);
            GVAR(pads) = GVAR(pad_sup_east);
        };
        GVAR(moveInVeh) = false;
        _moveInVeh ctrlShow false;
        
    };
	case "sea" : 
	{
        if (_side == west) then 
		{
            _pool = GVAR(nato_sea);
            GVAR(pads) = GVAR(pad_sea_west);
        } 
		else 
		{
            _pool = GVAR(csat_sea);
            GVAR(pads) = GVAR(pad_sea_east);
        };
        GVAR(moveInVeh) = true;
        
    };
    default 
    {
        if (_side == west) then 
		{
            _pool = [];
            GVAR(pads) = GVAR(pad_all_west);
        } 
		else 
		{
            _pool = [];
            GVAR(pads) = GVAR(pad_all_east);
        };
    };
};

// Objekte größer 0€ bestimmen 
_pool = _pool select {_x select 1 > 0};

// Objekte Sortieren 
GVAR(orderDialogObjects) = [_pool, 1] call CBA_fnc_sortNestedArray; // billigste zuerst

//Boxen füllen
// Budget 
[_budget] call opt_common_fnc_renderbudget;


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

GVAR(orderPAD) = [];

//Kaufbutton Aktivschlaten bei Freiem Pad
GVAR(idPadCheckShop) = [{

    private _freiePads = [];
    private _display = findDisplay 20000;
    private _order = _display displayCtrl 20004;
    private _padBox = _display displayCtrl 20009;
   
    // check der Pads ob belegt
    GVAR(pads) apply {
	    private _ob = nearestObjects [_x, ["AllVehicles", "Thing"], 4];
            
        if (count _ob == 0) then 
        {
            _freiePads append [_x]; 
        };       

    };  

    // Kaufbuttuon Freischalten und erstes Pad zuordnen
    if ((count _freiePads) > 0) then 
        {
            _order ctrlEnable true;
            GVAR(orderPAD) = _freiePads select 0;
            _padBox ctrlSetTextColor [1.0, 0.0, 0.0, 1];
            _padBox ctrlSetText format ["BOX:%1",GVAR(orderPAD)];
        }
    else 
        {
            _order ctrlEnable false;
            GVAR(orderPAD) = "Kein freie Box vorhanden";
            _padBox ctrlSetTextColor [0.0, 1.0, 0.0, 1];
            _padBox ctrlSetText format ["BOX:%1",GVAR(orderPAD)];
        };

}, 1] call CFUNC(addPerFrameHandler);

// Button Listbox Events 
// Kauf ausführen  
_order ctrlAddEventHandler [ "ButtonClick", 
{
    private _display = findDisplay IDD_DLG_ORDER;
    private _listbox_vehicles = _display displayCtrl IDC_CTRL_VEHICLE_LIST;
    private _editbox_info = _display displayCtrl IDC_CTRL_PRICE_LIST;

    private _sel_class = lbCurSel _listbox_vehicles;
	private _unitRecord = GVAR(orderDialogObjects) select _sel_class;
    private _class = _listbox_vehicles lbData _sel_class;
	private _unitCost = _unitRecord select 1;

    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);
    
    [_Datensatz,GVAR(orderPAD),GVAR(moveInVeh),_unitCost] call FUNC(order);
    
    closeDialog 0;
}];

// Konfig ausführen  
_konfig ctrlAddEventHandler [ "ButtonClick", 
{
    private _display = findDisplay IDD_DLG_ORDER;
    private _listbox_vehicles = _display displayCtrl IDC_CTRL_VEHICLE_LIST;
 
    private _sel_class = lbCurSel _listbox_vehicles;
	private _unitRecord = GVAR(orderDialogObjects) select _sel_class;
    private _class = _listbox_vehicles lbData _sel_class;
	private _unitCost = _unitRecord select 1;

    closeDialog 0;

   [EVENT_SHOP_KONFIG_ONLOAD,[_class,"New",_unitCost]] call CFUNC(localEvent);
}];

// Festlegen ob Spieler in Fahrzeug nach kauf
_moveInVeh ctrlAddEventHandler [ "ButtonClick", 
{
    private _display = findDisplay IDD_DLG_ORDER;
    private _moveInVeh = _display displayCtrl 20010;

    if (GVAR(moveInVeh)) then 
    {
        GVAR(moveInVeh) = false;         
        _moveInVeh ctrlSetText "Fahrzeug nicht besetzten";   
        _moveInVeh ctrlSetTextColor [1.0, 0.0, 0.0, 1];       
    }
    else
    {
        GVAR(moveInVeh) = true;         
        _moveInVeh ctrlSetText "Fahrzeug besetzten"; 
        _moveInVeh ctrlSetTextColor [0.0, 1.0, 0.0, 1];             
    };

}];

// Fahrzeuge auf allen Boxen im Bereich löschen 
_remove ctrlAddEventHandler [ "ButtonClick", 
{
    [GVAR(pads)] call FUNC(deletevehicle);

}];
