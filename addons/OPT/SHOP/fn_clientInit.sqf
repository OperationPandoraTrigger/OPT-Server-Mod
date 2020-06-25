/**
* Description:
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

DUMP("Successfully loaded the OPT/Shop module on the client");

// Events

[
	EVENT_SHOP_KAUF_ONLOAD, 
	{
		_this params ["_eventArgs"];

		_eventArgs call FUNC(einlesenInShopDialog);
	},
	[]
	
] call CFUNC(addEventHandler);

[
	EVENT_SHOP_KONFIG_ONLOAD, 
	{
		_this params ["_eventArgs"];

		_eventArgs call FUNC(einlesenInKonfigDialog);

	},
	[]
	
] call CFUNC(addEventHandler);

[
	EVENT_SHOP_VERKAUF_ORDER, 
	{
		_this params ["_eventArgs"];

		_eventArgs call FUNC(einlesenInVerkaufDialog);
	},
	[]
	
] call CFUNC(addEventHandler);

// Entfernung des Boxchecks PFH Shop
[{
	if (isNull (findDisplay 20000 displayCtrl 20002)) then 
	{
		GVAR(idPadCheckShop) call CFUNC(removePerframeHandler);	
	};

}, 1] call CFUNC(addPerFrameHandler);

// Entfernung des Boxchecks PFH Konfig
[{
	if (isNull (findDisplay 22000 displayCtrl 20002)) then 
	{
		GVAR(idPadCheckKonfig) call CFUNC(removePerframeHandler);	
	};

}, 1] call CFUNC(addPerFrameHandler);

if (hasInterface) then 
{

	//Shop Dialog öffnen
    /*
    * https://cbateam.github.io/CBA_A3/docs/files/keybinding/fnc_addKeybind-sqf.html
    */
    [
        "OPT", 
        "OPT Shop System", 
        ["Shop-Dialog öffnen", "Öffnet den Shop-Dialog im Fahnenbereich."], 
        {
            private _triggerUnitsair = 
			(list csat_trigger_Shop_Air1) 
			//+ (list nato_trigger_Shop_Air1)
			+ (list guer_trigger_Shop_Air1);

			private _triggerUnitsveh = 
			(list csat_trigger_Shop_veh1) 
			//+ (list nato_trigger_Shop_veh1);
			+ (list guer_trigger_Shop_veh1);

			private _triggerUnitssup = 
			(list csat_trigger_Shop_Sup1) 
			//+ (list nato_trigger_Shop_Sup1);
			+ (list guer_trigger_Shop_Sup1);

			private _triggerUnitssea = 
			(list csat_trigger_Shop_Sea1) 
			//+ (list nato_trigger_Shop_Sea1);
			+ (list guer_trigger_Shop_Sea1);

            if (player in _triggerUnitsair) then 
			{
                 [EVENT_SHOP_KAUF_ONLOAD,["choppers"]] call CFUNC(localEvent);
            };

			if (player in _triggerUnitsveh) then 
			{
                [EVENT_SHOP_KAUF_ONLOAD,["vehicles"]] call CFUNC(localEvent);
            };

			if (player in _triggerUnitssup) then 
			{
                [EVENT_SHOP_KAUF_ONLOAD,["supplies"]] call CFUNC(localEvent);
            };

			if (player in _triggerUnitssea) then 
			{
                [EVENT_SHOP_KAUF_ONLOAD,["sea"]] call CFUNC(localEvent);
            };
        }, 
        {}, 
        [
            DIK_F3, 
            [false, false, false] // [shift, ctrl, alt]
        ]
    ] call CBA_fnc_addKeybind;

	//Konfigdialog öffnen
    /*
    * https://cbateam.github.io/CBA_A3/docs/files/keybinding/fnc_addKeybind-sqf.html
    */
    [
        "OPT", 
        "OPT Konfig System", 
        ["Konfig-Dialog öffnen", "Öffnet den Konfig-Dialog im Boxbereich."], 
        {
            private _triggerUnitsair = 
			(list csat_trigger_Shop_Air1) 
			//+ (list nato_trigger_Shop_Air1)
			+ (list guer_trigger_Shop_Air1);

			private _triggerUnitsveh = 
			(list csat_trigger_Shop_veh1) 
			//+ (list nato_trigger_Shop_veh1);
			+ (list guer_trigger_Shop_veh1);

			private _triggerUnitssup = 
			(list csat_trigger_Shop_Sup1) 
			//+ (list nato_trigger_Shop_Sup1);
			+ (list guer_trigger_Shop_Sup1);

			private _triggerUnitssea = 
			(list csat_trigger_Shop_Sea1) 
			//+ (list nato_trigger_Shop_Sea1);
			+ (list guer_trigger_Shop_Sea1);

            if (player isEqualTo assignedDriver vehicle player and (vehicle player in _triggerUnitsair)) then 
			{
                [EVENT_SHOP_KONFIG_ONLOAD,["leer","old",0]] call CFUNC(localEvent);
            };

			if (player isEqualTo assignedDriver vehicle player and (vehicle player in _triggerUnitsveh)) then 
			{
                [EVENT_SHOP_KONFIG_ONLOAD,["leer","old",0]] call CFUNC(localEvent);
            };

			if (player isEqualTo assignedDriver vehicle player and (vehicle player in _triggerUnitssup)) then 
			{
                [EVENT_SHOP_KONFIG_ONLOAD,["leer","old",0]] call CFUNC(localEvent);
            };
            
        }, 
        {}, 
        [
            DIK_F3, 
            [false, false, false] // [shift, ctrl, alt]
        ]
    ] call CBA_fnc_addKeybind;

};

["missionStarted", 
{

	//AddAction für Dialog öffnen
	east_shop_air addAction [("<t color=""#F60707"">" + ("Luftwaffe") + "</t>"), {[EVENT_SHOP_KAUF_ONLOAD,["choppers"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];
	//west_shop_air addAction [("<t color=""#F60707"">" + ("Luftwaffe") + "</t>"), {[EVENT_SHOP_KAUF_ONLOAD,["choppers"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	
	guer_shop_air addAction [("<t color=""#F60707"">" + ("Luftwaffe") + "</t>"), {[EVENT_SHOP_KAUF_ONLOAD,["choppers"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

	east_shop_veh addAction [("<t color=""#F60707"">" + ("Fahrzeuge") + "</t>"), {[EVENT_SHOP_KAUF_ONLOAD,["vehicles"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];
	//west_shop_veh addAction [("<t color=""#F60707"">" + ("Fahrzeuge") + "</t>"), {[EVENT_SHOP_KAUF_ONLOAD,["vehicles"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	
	guer_shop_veh addAction [("<t color=""#F60707"">" + ("Fahrzeuge") + "</t>"), {[EVENT_SHOP_KAUF_ONLOAD,["vehicles"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

	east_shop_sup addAction [("<t color=""#F60707"">" + ("Ausrüstung") + "</t>"), {[EVENT_SHOP_KAUF_ONLOAD,["supplies"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];
	//west_shop_sup addAction [("<t color=""#F60707"">" + ("Ausrüstung") + "</t>"), {[EVENT_SHOP_KAUF_ONLOAD,["supplies"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	
	guer_shop_sup addAction [("<t color=""#F60707"">" + ("Ausrüstung") + "</t>"), {[EVENT_SHOP_KAUF_ONLOAD,["supplies"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

	east_shop_sea addAction [("<t color=""#F60707"">" + ("Wasserfahrzeuge") + "</t>"), {[EVENT_SHOP_KAUF_ONLOAD,["sea"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];
	//west_shop_sea addAction [("<t color=""#F60707"">" + ("Wasserfahrzeuge") + "</t>"), {[EVENT_SHOP_KAUF_ONLOAD,["sea"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	
	guer_shop_sea addAction [("<t color=""#F60707"">" + ("Wasserfahrzeuge") + "</t>"), {[EVENT_SHOP_KAUF_ONLOAD,["sea"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

	east_shop_verkauf addAction [("<t color=""#F60707"">" + ("Verkaufen") + "</t>"), {[EVENT_SHOP_VERKAUF_ORDER,["sell"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];
	//west_shop_verkauf addAction [("<t color=""#F60707"">" + ("Verkaufen") + "</t>"), {[EVENT_SHOP_VERKAUF_ORDER,["sell"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	
	guer_shop_verkauf addAction [("<t color=""#F60707"">" + ("Verkaufen") + "</t>"), {[EVENT_SHOP_VERKAUF_ORDER,["sell"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

}, []] call CFUNC(addEventHandler); 	