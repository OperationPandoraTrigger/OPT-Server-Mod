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
    ["_type", ""],
    ["_items", []],
    ["_pads", []],
    ["_checkbereich", 9],
    ["_moveInVeh", false]
];

// Shop gegen erneutes öffnen sperren (per Hotkey sonst mehrfach moeglich)
if (GVAR(LOCK)) exitWith {};
GVAR(LOCK) = true;

//Hardcap Send Auslösung Zurücksetzen
GVAR(Daten_send) = false;

//Shopart bestimmen
GVAR(vehicleType) = _type;
private _pool = _items;
GVAR(pads) = _pads;
GVAR(moveInVeh) = _moveInVeh;

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

// ESC-Taste zum schliessen benutzt -> Dialog wieder freigeben
_display displayAddEventhandler["KeyDown",
{
    params ["_display", "_key"];
    if (_key == 1) exitWith {GVAR(LOCK) = false;};
}];

_order ctrlEnable false;
_konfig ctrlEnable false;
_moveInVeh ctrlSetTextColor [0.0, 1.0, 0.0, 1];
_moveInVeh ctrlSetText "[X] Fahrzeug besetzen";
_kosten ctrlSetText format ["€:%1",0];

GVAR(Buttonwahl) = 0;

//Bereich für Boxkontrolle
GVAR(Checkbereich) = _checkbereich;

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

// Objekte größer 0€ bestimmen
_pool = _pool select {_x select 1 > 0};

// Objekte Sortieren
// GVAR(orderDialogObjects) = [_pool, 1] call CBA_fnc_sortNestedArray; // billigste zuerst

// Objekte unsortiert übernehmen, da sie schon in einer sinnvollen Reihenfolge angelegt wurden
GVAR(orderDialogObjects) = _pool;

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
private _playerFaction = "";
switch playerSide do
{
    case west:
    {
        _playerFaction = EGVAR(SECTORCONTROL,nato_faction);
    };

    case east:
    {
        _playerFaction = EGVAR(SECTORCONTROL,csat_faction);
    };
};

switch _playerFaction do
{
    case "ARF":
    {
        _rscPicture ctrlSetText "\opt\opt_client\addons\core\bilder\arf_logo.paa";
    };

    case "SWORD":
    {
        _rscPicture ctrlSetText "\opt\opt_client\addons\core\bilder\sword_logo.paa";
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
        GVAR(LOCK) = false;
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
        _moveInVeh ctrlSetText "[  ] Fahrzeug besetzen";
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
    GVAR(removecount) = GVAR(removecount)+1;

    private _display = findDisplay IDD_DLG_ORDER;
    private _remove = _display displayCtrl 20008;
    private _text = "Räumen";
    switch GVAR(removecount) do
    {
        case 1: {_text = "Räumen 3.."};
        case 2: {_text = "Räumen 2.."};
        case 3: {_text = "Räumen 1.."};
    };
    _remove ctrlSetText _text;

    if (GVAR(removecount) == 4) then
    {
        [GVAR(pads)] call FUNC(deletevehicle);
        GVAR(removecount) = 0;
    };
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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

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
    private _hardcapinfo = "∞";

    if (_class in GVAR(Hardcap_pool)) then
    {
        private _hardcaparray = GVAR(Hardcap_pool) get _class;
        private _hardcapleft = _hardcaparray select 0;
        private _hardcaptotal = _hardcaparray select 1;
        _hardcapinfo = format["%1/%2", _hardcapleft, _hardcaptotal];
    };

    _kosten ctrlSetText format ["€:%1 [%2]", (((GVAR(orderDialogObjects) select GVAR(Buttonwahl)) select 1) + (_Datensatz select 10)), _hardcapinfo];

    private _budget = _display displayCtrl 20009;
    [_budget] call OPT_GELDZEIT_fnc_renderbudget;
}];
