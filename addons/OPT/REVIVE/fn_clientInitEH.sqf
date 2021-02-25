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

    {
		player setVariable ["OPT_isUnconscious", 0, true];
		player setVariable ["OPT_isStabilized", 0, true];
		player setVariable ["OPT_isDragged", 0, true];
		GVAR(OPT_isDragging) = false;
		player allowDamage true;
		1 enableChannel true;
		1 fadeSound 1;
		OPT_GELDZEIT_earplugsInUse = 1;
		OPT_REVIVE_unconsciousHandler = nil;
		OPT_REVIVE_respawnedHandler = nil;
		player setVariable ["tf_unable_to_use_radio", false];

		//Schaden Freigeben
		player allowDamage true;
		 
    } call CFUNC(execNextFrame);

}] call CFUNC(addEventhandler);

//EH für Spielerabschüsslog 
//Event Aüslösung bei bewustlosen Spieler.

DFUNC(playercheckINCAPACITATED) = 
{
	if ((lifeState GVAR(playerHandleDamage_unit) isEqualTo "INCAPACITATED") and isNil "OPT_REVIVE_unconsciousHandler") then 
	{
		OPT_REVIVE_unconsciousHandler = true;

		if ((GVAR(playerHandleDamage_unit) == GVAR(playerHandleDamage_source)) or (GVAR(playerHandleDamage_unit) == GVAR(playerHandleDamage_instigator)))then 
        {          
			[MLOC(KILL_MSG), MLOC(KILL_SELF)] spawn BIS_fnc_infoText;
			[GVAR(playerHandleDamage_unit), GVAR(playerHandleDamage_instigator), GVAR(playerHandleDamage_source), GVAR(playerHandleDamage_projectile)] remoteExecCall ["OPT_SHOP_fnc_writeKill", 2, false];
        } 
		else
		{ 
			[MLOC(KILL_MSG), format["%1",name GVAR(playerHandleDamage_instigator)]] spawn BIS_fnc_infoText;
			[GVAR(playerHandleDamage_unit), GVAR(playerHandleDamage_instigator), GVAR(playerHandleDamage_source), GVAR(playerHandleDamage_projectile)] remoteExecCall ["OPT_SHOP_fnc_writeKill", 2, false];
        };

		//Funktion starten wenn Spieler bewustlos ist. 
		[player] call FUNC(isUnconscious);	
	};

};

DFUNC(playerHandleDamage) = 
{
	params ["_unit", "_source", "_damage", "_instigator"];

	//Var übergabe
	GVAR(playerHandleDamage_unit) = _unit; 
	GVAR(playerHandleDamage_instigator) = _instigator; 
	GVAR(playerHandleDamage_source) = _source; 
	GVAR(playerHandleDamage_projectile) = ""; 
	GVAR(playerHandleDamage_damage) = _damage; 

	// Schade hoeher eingestellen Werte Blocken um Autorespwan zu verhindern.
	if (_damage >= GVAR(MAX_DAMAGE)) then 
    { 
		_unit setDamage GVAR(MAX_DAMAGE);		
	};	

	if (getDammage _unit >= GVAR(MAX_DAMAGE)) then 
    { 
		_unit setDamage GVAR(MAX_DAMAGE);		
	};	

	[FUNC(playercheckINCAPACITATED), 1,""] call CLib_fnc_wait;
};

player addEventHandler ["hit", FUNC(playerHandleDamage)];

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
