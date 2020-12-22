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

// EH für Sprengmeister
player addEventHandler ["FiredMan", 
{
	/* 
		0 unit: Object - Unit the event handler is assigned to (the instigator)
		1 weapon: String - Fired weapon
        2 muzzle: String - Muzzle that was used
        3 mode: String - Current mode of the fired weapon
        4 ammo: String - Ammo used
        5 magazine: String - magazine name which was used
        6 projectile: Object - Object of the projectile that was shot out
        7 vehicle: Object - Vehicle, if weapon is vehicle weapon, otherwise objNull
    */
    if ((_this select 1 == "Put") and !(typeOf player in GVAR(pioniers)) and !(((_this select 5) isEqualTo "SatchelCharge_Remote_Mag") or ((_this select 5) isEqualTo "DemoCharge_Remote_Mag") or ((_this select 5) isEqualTo "ClaymoreDirectionalMine_Remote_Mag"))) then 
        {
            // lösche Mine
            deleteVehicle (_this select 6);
            // gib Spieler Mine zurück
            player addMagazine (_this select 5);
            // Warnhinweis
            private _txt = MLOC(PLACE_MINE);
            private _header = MLOC(RULE_VIOLATION);
            hint Format ["%1 \n\n %2",_header,_txt];
    	};  
}];



// UAV Drohenstation kontrolle
[] call FUNC(uav);

}] call CFUNC(addEventhandler);
