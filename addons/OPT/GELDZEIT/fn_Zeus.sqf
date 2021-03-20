/**
* Description:
* Stellt im Trainingsmodus Zeus zur Verfügung
* 
* Author: Lord-MDB
* 
* Arguments:
* none
*
* Return Value:
* None
*
*
* Server only:
* no
*
* Global:
* no
* 
* Public:
* no
*
* Example:
* [] call func(zeus);
*/
#include "macros.hpp"

["commy_registerCurator", 
{
    params ["_unit"];

    private _curator = createGroup sideLogic createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
    _curator setVariable ["addons", 3, true];
    _curator addCuratorEditableObjects [allMissionObjects "", true];
    _unit assignCurator _curator;

    "Zeusmodus verfügbar." remoteExec ["systemChat", _unit];
}] call CBA_fnc_addEventHandler;				

["commy_registerCurator", player] call CBA_fnc_serverEvent;
