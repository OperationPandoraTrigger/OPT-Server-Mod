/**
* Description:
* Initialisierung Rules System 
*
* Author:
* Lord-MDB
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* No
*
* Public:
* No 
* 
* Global:
* No
* 
* API:
* No
*
* Example:
* [] call FUNC(clientInit);
*/
#include "macros.hpp"

#define PLACE_WAITING -1
#define PLACE_CANCEL 0
#define PLACE_APPROVE 1

["missionStarted", {

[] call FUNC(setup_classnames);

player addEventHandler ["Take", {_this call FUNC(weaponCheck)}];

// EH für Positionssperre in Fahrzeugen beim Einsteigen
player addEventHandler ["GetInMan", 
{
    /*  
        unit: Object - Unit the event handler is assigned to
        position: String - Can be either "driver", "gunner" or "cargo"
        vehicle: Object - Vehicle the unit entered
        turret: Array - turret path
    */
    params ["_unit", "_pos", "_vec", "_turret"];

    if (!(OPT_SECTORCONTROL_trainingon)) then 
	{
        if (!(typeOf _unit in GVAR(pilots))) then 
		{
            if (_vec isKindOf "Air" && _pos in GVAR(blockedVehiclePositions_air)) then 
			{
                if (!(typeOf _vec in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then 
				{
                    _unit action ["GetOut", _vec];
                    private _txt = MLOC(SLOT_LOCK_PILOT);
					private _header = MLOC(SLOT_LOCK);
    				hint Format ["%1 \n\n %2",_header,_txt];
                };
            };
        };
    };

    if (!(OPT_SECTORCONTROL_trainingon)) then 
	{
        if (!(typeOf _unit in GVAR(crew))) then 
		{
            if (_pos in GVAR(blockedVehiclePositions_veh)) then 
			{
                if (typeOf _vec in GVAR(crew_vecs) || _vec isKindOf "Tank") then 
				{
                    _unit action ["GetOut", _vec];
                    private _txt = MLOC(SLOT_LOCK_CREW);
                    private _header = MLOC(SLOT_LOCK);
    				hint Format ["%1 \n\n %2",_header,_txt];
                };
            };
        };
    };
}];

// EH für Positionssperre in Fahrzeugen bei Platztausch
player addEventHandler ["SeatSwitchedMan", 
{
        /*  
           unit1: Object - Unit switching seat.
        unit2: Object - Unit with which unit1 is switching seat.
        vehicle: Object - Vehicle where switching seats is taking place.
    */
    params ["_unit1", "_unit2", "_vec"];

    if (!(OPT_SECTORCONTROL_trainingon)) then 
	{
        if (!(typeOf _unit1 in GVAR(pilots))) then 
		{
            if (_vec isKindOf "Air" && (assignedVehicleRole  _unit1 select 0) in GVAR(blockedVehiclePositions_air)) then 
			{
                if (!(typeOf _vec in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then 
				{
                    _unit1 action ["GetOut", _vec];
                    _txt = MLOC(SLOT_LOCK_PILOT);
                    private _header = MLOC(SLOT_LOCK);
    				hint Format ["%1 \n\n %2",_header,_txt];
                };
            };
        };
    };

    if (!(OPT_SECTORCONTROL_trainingon)) then 
	{
        if (!(typeOf _unit1 in GVAR(crew))) then 
		{
            if ( (assignedVehicleRole _unit1 select 0) in GVAR(blockedVehiclePositions_veh)) then 
			{
                if (typeOf _vec in GVAR(crew_vecs) || _vec isKindOf "Tank") then 
				{
                    _unit1 action ["GetOut", _vec];
                    _txt = MLOC(SLOT_LOCK_CREW);
                    private _header = MLOC(SLOT_LOCK);
    				hint Format ["%1 \n\n %2",_header,_txt];
                };
            };
        };
    };

}];

DFUNC(Minencheck) = 
{
    private _explosive = nearestObject [player, "ACE_Explosives_Place"];

    // allow satchel and charge
    if ((typeOf _explosive) find "SatchelCharge" != -1 or (typeOf _explosive) find "DemoCharge" != -1) exitWith {};    

    // only if near flag
    if (typeOf Player in GVAR(pioniers)) exitWith {};

    deleteVehicle _explosive;  

    // Warnhinweis
    private _txt = MLOC(PLACE_MINE);
    private _header = MLOC(RULE_VIOLATION);
    hint Format ["%1 \n\n %2",_header,_txt];

};

// EH für Sprengmeister

    GVAR(eh_ace_interactMenuClosed) = ["ace_interactMenuClosed", 
    {
        _this spawn 
        {
            _this params ["_menuType"];

            if (
                _menuType == 1 and // Eigenmenü
                ace_explosives_pfeh_running // explosive placing in progress
            ) then 
            {
                // wait until explosive was placed by player
                [FUNC(Minencheck), {(ace_explosives_placeAction == PLACE_APPROVE)}, "Awesome Delay"] call CLib_fnc_waitUntil;

            };
        };

    }] call CBA_fnc_addEventHandler;

// UAV Drohenstation kontrolle
[] call FUNC(uav);

}] call CFUNC(addEventhandler);
