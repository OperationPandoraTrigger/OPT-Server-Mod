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
                    private _txt = "Es ist nur Piloten erlaubt zu fliegen!";
					private _header = "Slotsperre";
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
                    private _txt = "Dieser Platz ist Besatzungsmitgliedern vorbehalten!";
                    private _header = "Slotsperre";
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
                    _txt = "Es ist nur Piloten erlaubt zu fliegen!";
                    private _header = "Slotsperre";
    				hint Format ["%1 \n\n %2",_header,_txt];
                };
            };
        };
    };

    if (!(OPT_SECTORCONTROL_trainingon)) then 
	{
        if (!(typeOf _unit1 in GVAR(crew))) then 
		{
            systemChat format ["c1:%1 B2:%2",(assignedVehicleRole _unit1 select 0), ((assignedVehicleRole _unit1 select 0) in GVAR(blockedVehiclePositions_veh))];
            if ( (assignedVehicleRole _unit1 select 0) in GVAR(blockedVehiclePositions_veh)) then 
			{
                if (typeOf _vec in GVAR(crew_vecs) || _vec isKindOf "Tank") then 
				{
                    _unit1 action ["GetOut", _vec];
                    _txt = "Dieser Platz ist Besatzungsmitgliedern vorbehalten!";
                    private _header = "Slotsperre";
    				hint Format ["%1 \n\n %2",_header,_txt];
                };
            };
        };
    };

}];


}] call CFUNC(addEventhandler);
