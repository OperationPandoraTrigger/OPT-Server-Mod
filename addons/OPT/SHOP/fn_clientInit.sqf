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

GVAR(eventArgs) = [];

// Events

[
	EVENT_SHOP_KAUF_ONLOAD, 
	{
		_this params ["_eventArgs"];

		GVAR(eventArgs) = _eventArgs;

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

["missionStarted", 
{

	switch OPT_GELDZEIT_Fraktionauswahl do 
	{
			case "AAFvsCSAT" : 
			{
				//AddAction für Dialog öffnen
				east_shop_air addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_AIR)], {[EVENT_SHOP_KAUF_ONLOAD,["choppers"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];
				independent_shop_air addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_AIR)], {[EVENT_SHOP_KAUF_ONLOAD,["choppers"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

				east_shop_veh addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_GROUND)], {[EVENT_SHOP_KAUF_ONLOAD,["vehicles"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];
				independent_shop_veh addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_GROUND)], {[EVENT_SHOP_KAUF_ONLOAD,["vehicles"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

				east_shop_sup addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_EQUIPMENT)], {[EVENT_SHOP_KAUF_ONLOAD,["supplies"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];
				independent_shop_sup addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_EQUIPMENT)], {[EVENT_SHOP_KAUF_ONLOAD,["supplies"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

				east_shop_sea addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_SEA)], {[EVENT_SHOP_KAUF_ONLOAD,["sea"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];
				independent_shop_sea addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_SEA)], {[EVENT_SHOP_KAUF_ONLOAD,["sea"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

				east_shop_verkauf addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_SELL)], {[EVENT_SHOP_VERKAUF_ORDER,["sell"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];
				independent_shop_verkauf addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_SELL)], {[EVENT_SHOP_VERKAUF_ORDER,["sell"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

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
						+ (list aaf_trigger_Shop_Air1);

						private _triggerUnitsveh = 
						(list csat_trigger_Shop_veh1) 
						+ (list aaf_trigger_Shop_veh1);

						private _triggerUnitssup = 
						(list csat_trigger_Shop_Sup1) 
						+ (list aaf_trigger_Shop_Sup1);

						private _triggerUnitssea = 
						(list csat_trigger_Shop_Sea1) 
						+ (list aaf_trigger_Shop_Sea1);

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
						+ (list aaf_trigger_Shop_Air1);

						private _triggerUnitsveh = 
						(list csat_trigger_Shop_veh1) 
						+ (list aaf_trigger_Shop_veh1);

						private _triggerUnitssup = 
						(list csat_trigger_Shop_Sup1) 
						+ (list aaf_trigger_Shop_Sup1);

						private _triggerUnitssea = 
						(list csat_trigger_Shop_Sea1) 
						+ (list aaf_trigger_Shop_Sea1);

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

     
			};

			case "NATOvsCSAT" : 
			{
				//AddAction für Dialog öffnen
				east_shop_air addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_AIR)], {[EVENT_SHOP_KAUF_ONLOAD,["choppers"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];
				west_shop_air addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_AIR)], {[EVENT_SHOP_KAUF_ONLOAD,["choppers"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

				east_shop_veh addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_GROUND)], {[EVENT_SHOP_KAUF_ONLOAD,["vehicles"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];
				west_shop_veh addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_GROUND)], {[EVENT_SHOP_KAUF_ONLOAD,["vehicles"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

				east_shop_sup addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_EQUIPMENT)], {[EVENT_SHOP_KAUF_ONLOAD,["supplies"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];
				west_shop_sup addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_EQUIPMENT)], {[EVENT_SHOP_KAUF_ONLOAD,["supplies"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

				east_shop_sea addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_SEA)], {[EVENT_SHOP_KAUF_ONLOAD,["sea"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];
				west_shop_sea addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_SEA)], {[EVENT_SHOP_KAUF_ONLOAD,["sea"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

				east_shop_verkauf addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_SELL)], {[EVENT_SHOP_VERKAUF_ORDER,["sell"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];
				west_shop_verkauf addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_SELL)], {[EVENT_SHOP_VERKAUF_ORDER,["sell"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

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
						+ (list nato_trigger_Shop_Air1);

						private _triggerUnitsveh = 
						(list csat_trigger_Shop_veh1) 
						+ (list nato_trigger_Shop_veh1);

						private _triggerUnitssup = 
						(list csat_trigger_Shop_Sup1) 
						+ (list nato_trigger_Shop_Sup1);

						private _triggerUnitssea = 
						(list csat_trigger_Shop_Sea1) 
						+ (list nato_trigger_Shop_Sea1);

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
						+ (list nato_trigger_Shop_Air1);

						private _triggerUnitsveh = 
						(list csat_trigger_Shop_veh1) 
						+ (list nato_trigger_Shop_veh1);

						private _triggerUnitssup = 
						(list csat_trigger_Shop_Sup1) 
						+ (list nato_trigger_Shop_Sup1);

						private _triggerUnitssea = 
						(list csat_trigger_Shop_Sea1) 
						+ (list nato_trigger_Shop_Sea1);

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
			};

			case "NATOvsAAF" : 
			{
				//AddAction für Dialog öffnen
				west_shop_air addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_AIR)], {[EVENT_SHOP_KAUF_ONLOAD,["choppers"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	
				independent_shop_air addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_AIR)], {[EVENT_SHOP_KAUF_ONLOAD,["choppers"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

				west_shop_veh addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_GROUND)], {[EVENT_SHOP_KAUF_ONLOAD,["vehicles"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	
				independent_shop_veh addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_GROUND)], {[EVENT_SHOP_KAUF_ONLOAD,["vehicles"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

				west_shop_sup addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_EQUIPMENT)], {[EVENT_SHOP_KAUF_ONLOAD,["supplies"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	
				independent_shop_sup addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_EQUIPMENT)], {[EVENT_SHOP_KAUF_ONLOAD,["supplies"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

				west_shop_sea addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_SEA)], {[EVENT_SHOP_KAUF_ONLOAD,["sea"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	
				independent_shop_sea addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_SEA)], {[EVENT_SHOP_KAUF_ONLOAD,["sea"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

				west_shop_verkauf addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_SELL)], {[EVENT_SHOP_VERKAUF_ORDER,["sell"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	
				independent_shop_verkauf addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_SELL)], {[EVENT_SHOP_VERKAUF_ORDER,["sell"]] call CFUNC(localEvent);},"", 6, false, true, "", ""];	

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
						(list nato_trigger_Shop_Air1)
						+ (list aaf_trigger_Shop_Air1);

						private _triggerUnitsveh = 
						(list nato_trigger_Shop_veh1)
						+ (list aaf_trigger_Shop_veh1);

						private _triggerUnitssup = 
						(list nato_trigger_Shop_Sup1)
						+ (list aaf_trigger_Shop_Sup1);

						private _triggerUnitssea = 
						(list nato_trigger_Shop_Sea1)
						+ (list aaf_trigger_Shop_Sea1);

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
						(list nato_trigger_Shop_Air1)
						+ (list aaf_trigger_Shop_Air1);

						private _triggerUnitsveh = 
						(list nato_trigger_Shop_veh1)
						+ (list aaf_trigger_Shop_veh1);

						private _triggerUnitssup = 
						(list nato_trigger_Shop_Sup1)
						+ (list aaf_trigger_Shop_Sup1);

						private _triggerUnitssea = 
						(list nato_trigger_Shop_Sea1)
						+ (list aaf_trigger_Shop_Sea1);

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

			};

			default 
			{
				ERROR_LOG("calcDominator: Fehlehalte Datenübergabe keine Fraktionauswahl erkannt");
				private _side = sideUnknown;
			};
	};

//TFAR Verschlüsselung bei Fahrzeugen

player addEventHandler ["GetInMan", {
    /*
    unit: Object - Unit the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    vehicle: Object - Vehicle the unit entered
    turret: Array - turret path
    */
    params ["_unit", "_pos", "_veh", "_turret"];

    // check if there is a radio in the vehicle
    if (_veh call TFAR_fnc_hasVehicleRadio) then 
	{
        _VehicleLR = player call TFAR_fnc_VehicleLR;
        _encryption = _VehicleLR call TFAR_fnc_getLrRadioCode;
        
        // Check if vehicle was occupied by other team. IF so, we change the encryption to match the team again.
        switch (PLAYERSIDE) do 
		{
            case west: 
			{
                if ((toLower(_encryption) == "_opfor") or (toLower(_encryption) == "_independent")) then 
				{
                    [_VehicleLR, "_bluefor"] call TFAR_fnc_setLrRadioCode;
                    systemChat "Die Funk-Verschlüsselung wurde geändert.";
                };
            };
            case east:  
			{
                if ((toLower(_encryption) == "_bluefor") or (toLower(_encryption) == "_independent")) then 
				{
                    [_VehicleLR, "_opfor"] call TFAR_fnc_setLrRadioCode;
                    systemChat "Die Funk-Verschlüsselung wurde geändert.";
                };            
            };
			case independent: 
			{
                if ((toLower(_encryption) == "_bluefor") or (toLower(_encryption) == "_opfor")) then 
				{
                    [_VehicleLR, "independent"] call TFAR_fnc_setLrRadioCode;
                    systemChat "Die Funk-Verschlüsselung wurde geändert.";
                };
            };
        };
    };

}];


}, []] call CFUNC(addEventHandler); 	