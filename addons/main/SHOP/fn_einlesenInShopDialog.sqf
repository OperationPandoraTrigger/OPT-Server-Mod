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

//Typ einlesen
params 
[
    ["_type", ""]
];

//Hardcap Send Auslösung Zurücksetzen
GVAR(Daten_send) = false;
GVAR(Hardcap_pool) = [];

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
#define SHOPBUTTONANZAHL 24

private _display = findDisplay IDD_DLG_ORDER;
private _budget = _display displayCtrl 20009;
private _order = _display displayCtrl 20004;
private _close = _display displayCtrl 20005;
private _remove = _display displayCtrl 20008;
private _konfig = _display displayCtrl 20007;
private _rscPicture = _display displayCtrl IDC_PLAYER_FLAG;
private _padBox = _display displayCtrl 20003;
private _moveInVeh = _display displayCtrl 20006;
private _kosten = _display displayCtrl 20002;

//Kaufbutton
private _button1 = _display displayCtrl 20010;
private _button2 = _display displayCtrl 20011;
private _button3 = _display displayCtrl 20012;
private _button4 = _display displayCtrl 20013;
private _button5 = _display displayCtrl 20014;
private _button6 = _display displayCtrl 20015;
private _button7 = _display displayCtrl 20016;
private _button8 = _display displayCtrl 20017;
private _button9 = _display displayCtrl 20018;
private _button10 = _display displayCtrl 20019;
private _button11 = _display displayCtrl 20020;
private _button12 = _display displayCtrl 20021;
private _button13 = _display displayCtrl 20022;
private _button14 = _display displayCtrl 20023;
private _button15 = _display displayCtrl 20024;
private _button16 = _display displayCtrl 20025;
private _button17 = _display displayCtrl 20026;
private _button18 = _display displayCtrl 20027;
private _button19 = _display displayCtrl 20028;
private _button20 = _display displayCtrl 20029;
private _button21 = _display displayCtrl 20030;
private _button22 = _display displayCtrl 20031;
private _button23 = _display displayCtrl 20032;
private _button24 = _display displayCtrl 20033;

_order ctrlEnable false;
_konfig ctrlEnable false;
_moveInVeh ctrlSetTextColor [0.0, 1.0, 0.0, 1];
_moveInVeh ctrlSetText "[X] Fahrzeug besetzen";
_kosten ctrlSetText format ["€:%1",0];

GVAR(Buttonwahl) = 0;

//Bereicht für Boxkontrolle
GVAR(Checkbereich) = 7;

//Kaufbutton ausblenden
for "_i" from 0 to SHOPBUTTONANZAHL do 
{
    //Bild
    ctrlShow [(20102 + _i), false ];

    //TextName    
    ctrlShow [(20010 + _i), false ];
    ctrlEnable [(20010 + _i), false];

    //TextGeld    
    ctrlShow [(20126 + _i), false ];
    ctrlSetText [(20126 + _i), ""];
};  

switch (GVAR(vehicleType)) do 
{
    case "choppers" : 
    {
        switch (_side) do 
        {
            case west:
            {    
                _pool = GVAR(nato_choppers);
                GVAR(pads) = GVAR(pad_air_west);
                GVAR(Checkbereich) = 13;
                GVAR(Hardcap_pool) = GVAR(Hardcap_nato_choppers);
            };

            case east:
            {    
                _pool = GVAR(csat_choppers);
                 GVAR(pads) = GVAR(pad_air_east);
                 GVAR(Checkbereich) = 13;
                 GVAR(Hardcap_pool) = GVAR(Hardcap_csat_choppers);
            };

            case independent:
            {    
                _pool = GVAR(AAF_choppers);
                GVAR(pads) = GVAR(pad_air_independent);
                GVAR(Checkbereich) = 13;
                GVAR(Hardcap_pool) = GVAR(Hardcap_aaf_choppers);
            };

            default
            {
            };        
        }; 
        GVAR(moveInVeh) = true;
        _konfig ctrlEnable false;       
    };

    case "planes" : 
    {
        switch (_side) do 
        {
            case west:
            {    
                _pool = GVAR(nato_planes);
                GVAR(pads) = GVAR(pad_plane_west);
                GVAR(Checkbereich) = 13;
                GVAR(Hardcap_pool) = GVAR(Hardcap_nato_planes);
            };

            case east:
            {    
                _pool = GVAR(csat_planes);
                 GVAR(pads) = GVAR(pad_plane_east);
                 GVAR(Checkbereich) = 13;
                 GVAR(Hardcap_pool) = GVAR(Hardcap_csat_planes);
            };

            case independent:
            {    
                _pool = GVAR(AAF_planes);
                GVAR(pads) = GVAR(pad_plane_independent);
                GVAR(Checkbereich) = 13;
                GVAR(Hardcap_pool) = GVAR(Hardcap_aaf_planes);
            };

            default
            {
            };        
        };

        // Zivilflughafen
        if ((player distance civ1_shop_plane) < 10) then
        {
            GVAR(pads) = [PlaneBoxCiv1];
        };

        if ((player distance civ2_shop_plane) < 10) then
        {
            GVAR(pads) = [PlaneBoxCiv2];
        };

        GVAR(moveInVeh) = true;
        _konfig ctrlEnable false;       
    };

    case "vehicles":
    {
        switch (_side) do 
        {
            case west:
            {    
                _pool = GVAR(nato_armored) + GVAR(nato_vehicles) + GVAR(nato_vehicles_supply);
                GVAR(pads) = GVAR(pad_veh_west);
                GVAR(Hardcap_pool) = GVAR(Hardcap_nato_vehicles);
            };

            case east:
            {    
                _pool = GVAR(csat_armored) + GVAR(csat_vehicles) + GVAR(csat_vehicles_supply);
                GVAR(pads) = GVAR(pad_veh_east);
                GVAR(Hardcap_pool) = GVAR(Hardcap_csat_vehicles);
            };

            case independent:
            {    
                _pool = GVAR(AAF_armored) + GVAR(AAF_vehicles) + GVAR(AAF_vehicles_supply);
                GVAR(pads) = GVAR(pad_veh_independent);
                GVAR(Hardcap_pool) = GVAR(Hardcap_aaf_vehicles);
            };

            default 
            {
            };        
        }; 
        GVAR(moveInVeh) = true;
        _konfig ctrlEnable false;       
    };

    case "supplies" : 
    {
        switch (_side) do 
        {
            case west:
            {    
                _pool = GVAR(nato_supplies) + GVAR(nato_static);
                GVAR(pads) = GVAR(pad_sup_west);
                GVAR(Checkbereich) = 4;
                GVAR(Hardcap_pool) = GVAR(Hardcap_nato_supplies);
            };

            case east:
            {    
                _pool = GVAR(csat_supplies) + GVAR(csat_static);
                GVAR(pads) = GVAR(pad_sup_east);
                GVAR(Checkbereich) = 4;
                GVAR(Hardcap_pool) = GVAR(Hardcap_csat_supplies);
            };

            case independent:
            {    
                _pool = GVAR(AAF_supplies) + GVAR(AAF_static);
                GVAR(pads) = GVAR(pad_sup_independent);
                GVAR(Checkbereich) = 4;
                GVAR(Hardcap_pool) = GVAR(Hardcap_aaf_supplies);
            };

            default 
            {
            };        
        }; 
        GVAR(moveInVeh) = false;
        _moveInVeh ctrlShow false;        
    };

    case "sea":
    {
        switch (_side) do 
        {
            case west:
            {    
                _pool = GVAR(nato_sea);
                GVAR(pads) = GVAR(pad_sea_west);
                GVAR(Hardcap_pool) = GVAR(Hardcap_nato_sea);
            };

            case east:
            {    
                _pool = GVAR(csat_sea);
                GVAR(pads) = GVAR(pad_sea_east);
                GVAR(Hardcap_pool) = GVAR(Hardcap_csat_sea);
            };

            case independent:
            {    
                _pool = GVAR(AAF_sea);
                GVAR(pads) = GVAR(pad_sea_independent);
                GVAR(Hardcap_pool) = GVAR(Hardcap_aaf_sea);
            };
            default 
            {
            };        
        }; 
        GVAR(moveInVeh) = true;
        _konfig ctrlEnable false;       
    };
    default 
    {
        switch (_side) do 
        {
            case west:
            {    
                _pool = [];
                GVAR(pads) = GVAR(pad_all_west);
            };

            case east:
            {    
                _pool = [];
                GVAR(pads) = GVAR(pad_all_east);
            };

            case independent:
            {    
                _pool = [];
                GVAR(pads) = GVAR(pad_all_independent);
            };

            default 
            {
            };        
        }; 
    };
};

// Objekte größer 0€ bestimmen 
_pool = _pool select {_x select 1 > 0};

// Objekte Sortieren 
GVAR(orderDialogObjects) = [_pool, 1] call CBA_fnc_sortNestedArray; // billigste zuerst

//Boxen füllen
// Budget 
[_budget] call OPT_GELDZEIT_fnc_renderbudget;

//Anzahl Kaufbutton bestimmen
private _Objektanzahl = 0;
_Objektanzahl = count GVAR(orderDialogObjects);
private _Bildobjekt = "";
private _Nameobjekt = "";
private _Geldobjekt = 0;

for "_i" from 0 to (_Objektanzahl-1) do 
{
    //Bild
    _Bildobjekt = getText (configFile >> "cfgVehicles" >> ((GVAR(orderDialogObjects) select _i) select 0) >> "editorPreview");
    ctrlSetText [(20102 + _i), _Bildobjekt];
    ctrlShow [(20102 + _i), true ];

    //TextName    
    _Nameobjekt = getText (configFile >> "CfgVehicles" >> ((GVAR(orderDialogObjects) select _i) select 0) >> "displayName");
    ctrlSetText [(20010 + _i), _Nameobjekt];
    ctrlShow [(20010 + _i), true ];
    ctrlEnable [(20010 + _i), true];

    //TextGeld    
    _Geldobjekt = ((GVAR(orderDialogObjects) select _i) select 1);
    private _GeldClass = ((GVAR(orderDialogObjects) select _i) select 0);
    private _GeldDatensatz = [];
    _GeldDatensatz = [_GeldClass] call FUNC(loadout);

    ctrlSetText [(20126 + _i), format["%1",_Geldobjekt+(_GeldDatensatz select 10)]];
    ctrlShow [(20126 + _i), true ];
    _display displayCtrl (20010 + _i) ctrlSetTooltip format["Waffenpreis:%1 Grundpreis:%2",(_GeldDatensatz select 10),_Geldobjekt];
}; 

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

    case independent: 
    {
        _rscPicture ctrlSetText "\A3\Data_F\Flags\Flag_AAF_CO.paa";
    };    
};

GVAR(orderPAD) = [];

//Kaufbutton Aktivschlaten bei Freiem Pad
GVAR(idPadCheckShop) =
[{
    private _display = findDisplay 20000;
    private _order = _display displayCtrl 20004;
    private _padBox = _display displayCtrl 20003;
   
    // freie Pads suchen
    private _freiePads = [GVAR(pads), GVAR(Checkbereich)] call FUNC(checkpad);

    // Kaufbuttuon Freischalten und erstes Pad zuordnen
    if ((count _freiePads) > 0) then 
    {
        _order ctrlEnable true;
        GVAR(orderPAD) = _freiePads select 0;
        _padBox ctrlSetTextColor [0.0, 1.0, 0.0, 1];
        _padBox ctrlSetText format ["BOX:%1",GVAR(orderPAD)];
    }
    else 
    {
        _order ctrlEnable false;
        GVAR(orderPAD) = "Kein freie Box vorhanden";
        _padBox ctrlSetTextColor [1.0, 0.0, 0.0, 1];
        _padBox ctrlSetText format ["BOX:%1",GVAR(orderPAD)];
    };
}, 0] call CFUNC(addPerFrameHandler);

// Button Listbox Events 
// Kauf ausführen  
_order ctrlAddEventHandler [ "ButtonClick", 
{
    private _unitCost = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1);
    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);

    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);
    
    [_Datensatz,GVAR(orderPAD),GVAR(moveInVeh),_unitCost] call FUNC(order);
    
    if (GVAR(moveInVeh)) then 
    {
        closeDialog 0;
    };

    private _display = findDisplay IDD_DLG_ORDER;
    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;   
}];

// Konfig ausführen  
_konfig ctrlAddEventHandler [ "ButtonClick", 
{
    private _unitCost = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1);
    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);

    closeDialog 0;

   [EVENT_SHOP_KONFIG_ONLOAD,[_class,"New",_unitCost]] call CFUNC(localEvent);
}];

// Festlegen ob Spieler in Fahrzeug nach kauf
_moveInVeh ctrlAddEventHandler [ "ButtonClick", 
{
    private _display = findDisplay IDD_DLG_ORDER;
    private _moveInVeh = _display displayCtrl 20006;

    if (GVAR(moveInVeh)) then 
    {
        GVAR(moveInVeh) = false;         
        _moveInVeh ctrlSetText "[_] Fahrzeug besetzen";   
        _moveInVeh ctrlSetTextColor [1.0, 0.0, 0.0, 1];       
    }
    else
    {
        GVAR(moveInVeh) = true;         
        _moveInVeh ctrlSetText "[X] Fahrzeug besetzen"; 
        _moveInVeh ctrlSetTextColor [0.0, 1.0, 0.0, 1];             
    };

}];

// Fahrzeuge auf allen Boxen im Bereich löschen 
GVAR(removecount) = 0;

_remove ctrlAddEventHandler [ "ButtonClick", 
{
    if (GVAR(removecount) == 3) then 
    {
        [GVAR(pads)] call FUNC(deletevehicle);
        GVAR(removecount) = 0;
    };
    GVAR(removecount) = GVAR(removecount)+1;
}];

//Kaufbutton EH
//Button 1
_button1 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 0;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];

    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 2
_button2 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 1;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];

    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 3
_button3 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 2;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];

    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 4
_button4 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 3;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];
    
    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 5
_button5 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 4;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];

    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 6
_button6 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 5;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];

    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 7
_button7 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 6;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];

    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 8
_button8 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 7;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];

    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 9
_button9 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 8;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];
    
    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 10
_button10 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 9;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];
    
    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 11
_button11 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 10;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];
    
    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 12
_button12 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 11;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];
    
    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 13
_button13 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 12;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];

    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 14
_button14 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 13;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];
    
    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 15
_button15 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 14;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];

    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 16
_button16 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 15;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];

    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 17
_button17 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 16;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];

    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 18
_button18 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 17;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];

    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 19
_button19 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 18;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];

    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 20
_button20 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 19;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];

    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 21
_button21 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 20;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];

    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 22
_button22 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 21;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];

    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 23
_button23 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 22;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];

    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];

//Button 24
_button24 ctrlAddEventHandler [ "ButtonClick", 
{
    GVAR(Buttonwahl) = 23;

    private _display = findDisplay IDD_DLG_ORDER;
    private _kosten = _display displayCtrl 20002;

    private _class = ((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 0);
    private _Datensatz = [];

    _Datensatz = [_class] call FUNC(loadout);

    private _hardcapobj = "";
    private _hardcapinfo = "U";

    GVAR(Hardcap_pool) apply
    {
        _hardcapobj = _x select 0;
        if (_class isEqualTo _hardcapobj) then 
        {
            _hardcapinfo = format ["%1",_x select 1];       
        }; 
    }; 

    _kosten ctrlSetText format ["€:%1 [%2]",(((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)),_hardcapinfo];

    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];
