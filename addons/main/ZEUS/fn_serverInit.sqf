/**
* Author: Fank
* Registers Zeus for clients
*
* Arguments:
* None
*
* Return Value:
* None
*
*/
#include "macros.hpp"

if (!OPT_SECTORCONTROL_trainingon) exitWith {};

[ZEUS_SWAP_EVENT, {
    _this select 0 params["_unit", "_corpse"];

    if (!isNull _corpse) then
    {
        {
            private _assignedUnit = getAssignedCuratorUnit _x;
            private _group = group _x;
            if (_corpse == _assignedUnit || isNull _assignedUnit) exitWith
            {
                unassignCurator _x;
                deleteVehicle _x;
                deleteGroup _group;
            };
        } forEach allCurators;
    };

    private _group = createGroup sideLogic;
    private _curator = _group createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
    _curator setVariable ["addons", 3, true];
    _curator setVariable ["bis_fnc_initModules_activate", false, true];

    // Alle Missionsobjekte editierbar machen (außer die elementar wichtigen)
    private _objs = allMissionObjects "" - allMissionObjects "FlagPole_F" - EGVAR(SHOP,pad_all_west) - EGVAR(SHOP,pad_all_east) -
    [
        NATO_BaseFlag, west_Basis_Teleport1, west_Basis_Teleport2,                       Teleport_NATO_Basis1, Teleport_NATO_Basis2,
        CSAT_BaseFlag, east_Basis_Teleport1, east_Basis_Teleport2, east_Basis_Teleport3, Teleport_CSAT_Basis1, Teleport_CSAT_Basis2, Teleport_CSAT_Basis3,

        west_shop_veh, west_shop_verkauf, west_shop_verkauf2, west_shop_sup, west_shop_air, west_shop_sea,                 west_shop_plane,
        east_shop_veh, east_shop_verkauf, east_shop_verkauf2, east_shop_sup, east_shop_air, east_shop_sea, east_shop_sea2, east_shop_plane,

        VerkaufsBoxWest, VerkaufsBoxWest2, SeaBoxWest1, SeaBoxWest2,
        VerkaufsBoxEast, VerkaufsBoxEast2, SeaBoxEast1, SeaBoxEast2, SeaBoxEast3, SeaBoxEast4
    ];


    _curator addCuratorEditableObjects [_objs, true];
    _unit assignCurator _curator;
}] call CFUNC(addEventHandler);
