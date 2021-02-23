/**
* Description:
* 
* 
* Author:
* Lord-MDB
*
* Arguments:
*
* Return Value:
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
* [] call FUNC(clientInitEH);
*/

#include "macros.hpp";

//Funktion für EH auslösung
DFUNC(isUnconscious) = 
{
	params ["_unit"];

	if (_unit isEqualTo player) then 
	{
		//Var für GPS setzen 
		_unit setVariable ["OPT_isUnconscious", 1, true];

		//Einheit aus Fahrzeug endfernen
		if (vehicle _unit != _unit) then 
		{
			unAssignVehicle _unit;
			_unit action ["GetOut", vehicle _unit];
		};

		//Sprengladungen mit Todmanschalter zünden
		[_unit] call ace_explosives_fnc_onIncapacitated;

		//TFAR ausschalten
		player setVariable ["tf_unable_to_use_radio", true];

		//Schaden ausblenden
		player allowDamage false;

		//Dialog ausführen
		[] call FUNC(dialog);
	};
};

//var nach Respwan zurück setzen
["Respawn", {
	params ["_data", "_args"];
    _data params ["_new", "_old"];
	
	_old removeEventHandler ["handleDamage", GVAR(PLAYER_HANDLE_DAMAGE_EH_ID)];
	
	GVAR(PLAYER_HANDLE_DAMAGE_EH_ID) = _new addEventHandler ["HandleDamage", FUNC(playerHandleDamage)];


	_new setVariable ["OPT_isUnconscious", 0, true];
	_new setVariable ["OPT_isStabilized", 0, true];
	_new setVariable ["OPT_isDragged", 0, true];
	_new allowDamage true;
	_new setVariable ["tf_unable_to_use_radio", false];
	
	GVAR(OPT_isDragging) = false;
	OPT_GELDZEIT_earplugsInUse = 1;
	OPT_REVIVE_unconsciousHandler = nil;
	OPT_REVIVE_respawnedHandler = nil;
	
	1 enableChannel true;	
}] call CFUNC(addEventhandler);

//EH für Spielerabschüsslog 
//Event Aüslösung bei bewustlosen Spieler.

DFUNC(playercheckINCAPACITATED) = 
{
	if ((lifeState GVAR(playerHandleDamage_unit) isEqualTo "INCAPACITATED") and isNil "OPT_REVIVE_unconsciousHandler") then 
	{
		OPT_REVIVE_unconsciousHandler = true;
		[GVAR(playerHandleDamage_unit), GVAR(playerHandleDamage_instigator), GVAR(playerHandleDamage_source), GVAR(playerHandleDamage_projectile)] remoteExecCall ["OPT_SHOP_fnc_writeKill", 2, false];

		if (GVAR(playerHandleDamage_unit) == GVAR(playerHandleDamage_source)) then 
        {          
			[MLOC(KILL_MSG), MLOC(KILL_SELF)] spawn BIS_fnc_infoText;
        } 
		else
		{         
			[MLOC(KILL_MSG), format["%1",name GVAR(playerHandleDamage_instigator)]] spawn BIS_fnc_infoText;

        };

		//Funktion starten wenn Spieler bewustlos ist. 
		[player] call FUNC(isUnconscious);	
	};

};

DFUNC(playerHandleDamage) = 
{
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

	private _unitDamage = damage _unit;
	private _resultingDamage = _damage;

	[FUNC(playercheckINCAPACITATED), 1,""] call CLib_fnc_wait;

	if (_unitDamage >= GVAR(MAX_DAMAGE)) then { 
		_resultingDamage = GVAR(MAX_DAMAGE);
	};
	
	_resultingDamage;
};

GVAR(PLAYER_HANDLE_DAMAGE_EH_ID) = player addEventHandler ["HandleDamage", FUNC(playerHandleDamage)];

// 3D Marker
GVAR(missionEH_draw3D) = addMissionEventHandler ["Draw3D", 
{
    private _nearbyUnits = playableUnits select 
	{
        (_x distance player) < 30 and
        lifeState _x isEqualTo "INCAPACITATED" and
        _x != player and
        SIDE _x == PLAYERSIDE
    };
    {
        private _name = NAME _x;
        drawIcon3D ["\a3\ui_f\data\map\MapControl\hospital_ca.paa", [0.6,0.15,0,0.8], _x, 0.5, 0.5, 0, format["%1 (%2m)", _name, ceil (player distance _x)], 0, 0.02];

    } count _nearbyUnits;
}];
