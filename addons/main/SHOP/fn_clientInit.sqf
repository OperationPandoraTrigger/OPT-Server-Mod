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

// Innerhalb dieser Entfernung zum Shop-Schild kann der Spieler den Shop via Hotkey öffnen
#define MAX_DISTANCE_TO_SHOP 3

GVAR(Daten_send) = false;
GVAR(eventArgs) = [];

// Events
[
    EVENT_SHOP_KAUF_ONLOAD,
    {
        _this params ["_eventArgs"];
        GVAR(eventArgs) = _eventArgs;
        _this remoteExecCall [QFUNC(hardcap_send), 2, false];
        [{GVAR(eventArgs) call FUNC(einlesenInShopDialog)}, {GVAR(Daten_send)}, "Awesome Delay"] call CLib_fnc_waitUntil;
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
    GVAR(LOCK) = false;

    switch playerSide do
    {
        case west:
        {
            west_shop_air addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_AIR)], {[EVENT_SHOP_KAUF_ONLOAD,["choppers", GVAR(nato_choppers), GVAR(pad_air_west), 13, true]] call CFUNC(localEvent);},"", 6, false, true, "", "count (UAVControl getConnectedUAV player # 1) == 0"];
            west_shop_plane addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_AIR)], {[EVENT_SHOP_KAUF_ONLOAD,["planes", GVAR(nato_planes) + GVAR(nato_jets) + GVAR(nato_uavs_air), GVAR(pad_plane_west), 13, true]] call CFUNC(localEvent);},"", 6, false, true, "", "count (UAVControl getConnectedUAV player # 1) == 0"];
            civ1_shop_plane addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_AIR)], {[EVENT_SHOP_KAUF_ONLOAD,["planes", GVAR(nato_planes), [PlaneBoxCiv1], 13, true]] call CFUNC(localEvent);},"", 6, false, true, "", "count (UAVControl getConnectedUAV player # 1) == 0"];
            civ2_shop_plane addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_AIR)], {[EVENT_SHOP_KAUF_ONLOAD,["planes", GVAR(nato_planes), [PlaneBoxCiv2], 13, true]] call CFUNC(localEvent);},"", 6, false, true, "", "count (UAVControl getConnectedUAV player # 1) == 0"];
            west_shop_veh addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_GROUND)], {[EVENT_SHOP_KAUF_ONLOAD,["vehicles", GVAR(nato_vehicles) + GVAR(nato_vehicles_supply) + GVAR(nato_armored), GVAR(pad_veh_west), 9, true]] call CFUNC(localEvent);},"", 6, false, true, "", "count (UAVControl getConnectedUAV player # 1) == 0"];
            west_shop_sup addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_EQUIPMENT)], {[EVENT_SHOP_KAUF_ONLOAD,["supplies", GVAR(nato_supplies) + GVAR(nato_static) + GVAR(nato_uavs_land), GVAR(pad_sup_west), 4, false]] call CFUNC(localEvent);},"", 6, false, true, "", "count (UAVControl getConnectedUAV player # 1) == 0"];
            west_shop_sea addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_SEA)], {[EVENT_SHOP_KAUF_ONLOAD,["sea", GVAR(nato_sea), GVAR(pad_sea_west), 9, true]] call CFUNC(localEvent);},"", 6, false, true, "", "count (UAVControl getConnectedUAV player # 1) == 0"];
            west_shop_verkauf addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_SELL)], {[EVENT_SHOP_VERKAUF_ORDER,["sell"]] call CFUNC(localEvent);},"", 6, false, true, "", "count (UAVControl getConnectedUAV player # 1) == 0"];
            west_shop_verkauf2 addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_SELL)], {[EVENT_SHOP_VERKAUF_ORDER,["sell"]] call CFUNC(localEvent);},"", 6, false, true, "", "count (UAVControl getConnectedUAV player # 1) == 0"];
        };

        case east:
        {
            east_shop_air addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_AIR)], {[EVENT_SHOP_KAUF_ONLOAD,["choppers", GVAR(csat_choppers), GVAR(pad_air_east), 13, true]] call CFUNC(localEvent);},"", 6, false, true, "", "count (UAVControl getConnectedUAV player # 1) == 0"];
            east_shop_plane addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_AIR)], {[EVENT_SHOP_KAUF_ONLOAD,["planes", GVAR(csat_planes) + GVAR(csat_jets) + GVAR(csat_uavs_air), GVAR(pad_plane_east), 13, true]] call CFUNC(localEvent);},"", 6, false, true, "", "count (UAVControl getConnectedUAV player # 1) == 0"];
            civ1_shop_plane addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_AIR)], {[EVENT_SHOP_KAUF_ONLOAD,["planes", GVAR(csat_planes), [PlaneBoxCiv1], 13, true]] call CFUNC(localEvent);},"", 6, false, true, "", "count (UAVControl getConnectedUAV player # 1) == 0"];
            civ2_shop_plane addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_AIR)], {[EVENT_SHOP_KAUF_ONLOAD,["planes", GVAR(csat_planes), [PlaneBoxCiv2], 13, true]] call CFUNC(localEvent);},"", 6, false, true, "", "count (UAVControl getConnectedUAV player # 1) == 0"];
            east_shop_veh addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_GROUND)], {[EVENT_SHOP_KAUF_ONLOAD,["vehicles", GVAR(csat_vehicles) + GVAR(csat_vehicles_supply) + GVAR(csat_armored), GVAR(pad_veh_east), 9, true]] call CFUNC(localEvent);},"", 6, false, true, "", "count (UAVControl getConnectedUAV player # 1) == 0"];
            east_shop_sup addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_EQUIPMENT)], {[EVENT_SHOP_KAUF_ONLOAD,["supplies", GVAR(csat_supplies) + GVAR(csat_static) + GVAR(csat_uavs_land), GVAR(pad_sup_east), 4, false]] call CFUNC(localEvent);},"", 6, false, true, "", "count (UAVControl getConnectedUAV player # 1) == 0"];
            east_shop_sea addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_SEA)], {[EVENT_SHOP_KAUF_ONLOAD,["sea", GVAR(csat_sea), GVAR(pad_sea_east), 9, true]] call CFUNC(localEvent);},"", 6, false, true, "", "count (UAVControl getConnectedUAV player # 1) == 0"];
            east_shop_sea2 addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_SEA)], {[EVENT_SHOP_KAUF_ONLOAD,["sea", GVAR(csat_sea), GVAR(pad_sea_east2), 9, true]] call CFUNC(localEvent);},"", 6, false, true, "", "count (UAVControl getConnectedUAV player # 1) == 0"];
            east_shop_verkauf addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_SELL)], {[EVENT_SHOP_VERKAUF_ORDER,["sell"]] call CFUNC(localEvent);},"", 6, false, true, "", "count (UAVControl getConnectedUAV player # 1) == 0"];
            east_shop_verkauf2 addAction [format["<t color=""#F60707"">%1</t>", MLOC(SHOPMENU_SELL)], {[EVENT_SHOP_VERKAUF_ORDER,["sell"]] call CFUNC(localEvent);},"", 6, false, true, "", "count (UAVControl getConnectedUAV player # 1) == 0"];
        };

        default
        {};
    };

    //Shop Dialog öffnen
    /*
    * https://cbateam.github.io/CBA_A3/docs/files/keybinding/fnc_addKeybind-sqf.html
    */
    [
        "OPT",
        "OPT Shop System",
        ["Shop-Dialog öffnen", "Öffnet den Shop-Dialog in der Nähe des Schildes"],
        {
            switch playerSide do
            {
                case west:
                {
                    // Entfernungsabfragen zu den einzelnen Shop-Schildern. Verschachtelt für Performancebringenden Abbruch.
                    if (player distance west_shop_air < MAX_DISTANCE_TO_SHOP) then
                    {
                        [EVENT_SHOP_KAUF_ONLOAD,["choppers", GVAR(nato_choppers), GVAR(pad_air_west), 13, true]] call CFUNC(localEvent);
                    }
                    else
                    {
                        if (player distance west_shop_veh < MAX_DISTANCE_TO_SHOP) then
                        {
                            [EVENT_SHOP_KAUF_ONLOAD,["vehicles", GVAR(nato_vehicles) + GVAR(nato_vehicles_supply) + GVAR(nato_armored), GVAR(pad_veh_west), 9, true]] call CFUNC(localEvent);
                        }
                        else
                        {
                            if (player distance west_shop_sup < MAX_DISTANCE_TO_SHOP) then
                            {
                                [EVENT_SHOP_KAUF_ONLOAD,["supplies", GVAR(nato_supplies) + GVAR(nato_static) + GVAR(nato_uavs_land), GVAR(pad_sup_west), 4, false]] call CFUNC(localEvent);
                            }
                            else
                            {
                                if (player distance west_shop_sea < MAX_DISTANCE_TO_SHOP) then
                                {
                                    [EVENT_SHOP_KAUF_ONLOAD,["sea", GVAR(nato_sea), GVAR(pad_sea_west), 9, true]] call CFUNC(localEvent);
                                }
                                else
                                {
                                    if (player distance west_shop_plane < MAX_DISTANCE_TO_SHOP) then
                                    {
                                        [EVENT_SHOP_KAUF_ONLOAD,["planes", GVAR(nato_planes) + GVAR(nato_jets) + GVAR(nato_uavs_air), GVAR(pad_plane_west), 13, true]] call CFUNC(localEvent);
                                    }
                                    else
                                    {
                                        if (player distance civ1_shop_plane < MAX_DISTANCE_TO_SHOP) then
                                        {
                                            [EVENT_SHOP_KAUF_ONLOAD,["planes", GVAR(nato_planes), [PlaneBoxCiv1], 13, true]] call CFUNC(localEvent);
                                        }
                                        else
                                        {
                                            if (player distance civ2_shop_plane < MAX_DISTANCE_TO_SHOP) then
                                            {
                                                [EVENT_SHOP_KAUF_ONLOAD,["planes", GVAR(nato_planes), [PlaneBoxCiv2], 13, true]] call CFUNC(localEvent);
                                            }
                                            else
                                            {
                                                if ((player distance west_shop_verkauf < MAX_DISTANCE_TO_SHOP) || (player distance west_shop_verkauf2 < MAX_DISTANCE_TO_SHOP)) then
                                                {
                                                    [EVENT_SHOP_VERKAUF_ORDER, ["sell"]] call CFUNC(localEvent);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };

                case east:
                {
                    // Entfernungsabfragen zu den einzelnen Shop-Schildern. Verschachtelt für Performancebringenden Abbruch.
                    if (player distance east_shop_air < MAX_DISTANCE_TO_SHOP) then
                    {
                        [EVENT_SHOP_KAUF_ONLOAD,["choppers", GVAR(csat_choppers), GVAR(pad_air_east), 13, true]] call CFUNC(localEvent);
                    }
                    else
                    {
                        if (player distance east_shop_veh < MAX_DISTANCE_TO_SHOP) then
                        {
                            [EVENT_SHOP_KAUF_ONLOAD,["vehicles", GVAR(csat_vehicles) + GVAR(csat_vehicles_supply) + GVAR(csat_armored), GVAR(pad_veh_east), 9, true]] call CFUNC(localEvent);
                        }
                        else
                        {
                            if (player distance east_shop_sup < MAX_DISTANCE_TO_SHOP) then
                            {
                                [EVENT_SHOP_KAUF_ONLOAD,["supplies", GVAR(csat_supplies) + GVAR(csat_static) + GVAR(csat_uavs_land), GVAR(pad_sup_east), 4, false]] call CFUNC(localEvent);
                            }
                            else
                            {
                                if (player distance east_shop_sea < MAX_DISTANCE_TO_SHOP) then
                                {
                                    [EVENT_SHOP_KAUF_ONLOAD,["sea", GVAR(csat_sea), GVAR(pad_sea_east), 9, true]] call CFUNC(localEvent);
                                }
                                else
                                {
                                    if (player distance east_shop_sea2 < MAX_DISTANCE_TO_SHOP) then
                                    {
                                        [EVENT_SHOP_KAUF_ONLOAD,["sea", GVAR(csat_sea), GVAR(pad_sea_east2), 9, true]] call CFUNC(localEvent);
                                    }
                                    else
                                    {
                                        if (player distance east_shop_plane < MAX_DISTANCE_TO_SHOP) then
                                        {
                                            [EVENT_SHOP_KAUF_ONLOAD,["planes", GVAR(csat_planes) + GVAR(csat_jets) + GVAR(csat_uavs_air), GVAR(pad_plane_east), 13, true]] call CFUNC(localEvent);
                                        }
                                        else
                                        {
                                            if (player distance civ1_shop_plane < MAX_DISTANCE_TO_SHOP) then
                                            {
                                                [EVENT_SHOP_KAUF_ONLOAD,["planes", GVAR(csat_planes), [PlaneBoxCiv1], 13, true]] call CFUNC(localEvent);
                                            }
                                            else
                                            {
                                                if (player distance civ2_shop_plane < MAX_DISTANCE_TO_SHOP) then
                                                {
                                                    [EVENT_SHOP_KAUF_ONLOAD,["planes", GVAR(csat_planes), [PlaneBoxCiv2], 13, true]] call CFUNC(localEvent);
                                                }
                                                else
                                                {
                                                    if ((player distance east_shop_verkauf < MAX_DISTANCE_TO_SHOP) || (player distance east_shop_verkauf2 < MAX_DISTANCE_TO_SHOP)) then
                                                    {
                                                        [EVENT_SHOP_VERKAUF_ORDER, ["sell"]] call CFUNC(localEvent);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };

                default
                {};
            };
        },
        {},
        [
            DIK_F3,
            [false, false, false] // [shift, ctrl, alt]
        ]
    ] call CBA_fnc_addKeybind;

    //TFAR Verschlüsselung bei Fahrzeugen

    player addEventHandler ["GetInMan",
    {
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
            private _VehicleLR = player call TFAR_fnc_VehicleLR;
            private _encryption = _VehicleLR call TFAR_fnc_getLrRadioCode;

            // Check if vehicle was occupied by other team. IF so, we change the encryption to match the team again.
            switch (playerSide) do
            {
                case west:
                {
                    if ((toLower(_encryption) == "_opfor")) then
                    {
                        [_VehicleLR, "_bluefor"] call TFAR_fnc_setLrRadioCode;
                        systemChat "Die Funk-Verschlüsselung wurde geändert.";
                    };
                };

                case east:
                {
                    if ((toLower(_encryption) == "_bluefor")) then
                    {
                        [_VehicleLR, "_opfor"] call TFAR_fnc_setLrRadioCode;
                        systemChat "Die Funk-Verschlüsselung wurde geändert.";
                    };
                };
            };
        };
    }];
}, []] call CFUNC(addEventHandler);
