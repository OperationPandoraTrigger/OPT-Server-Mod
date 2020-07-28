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

DUMP("REVIVE EH");

//Event Aüslösung bei bewustlosen Spieler.
[
	"ace_unconscious",
	{
		params ["_unit", "_isUnconscious"]; 

		[_unit] call FUNC(isUnconscious);
	}
] call CBA_fnc_addEventHandler;

//Funktion für EH auslösung
DFUNC(isUnconscious) = 
{
	params ["_unit"];

	if (_unit isEqualTo player) then 
	{
		//Var für GPS setzen 
		_unit setVariable ["OPT_isUnconscious", 1, true];

		//Schaden weiterer abschalten
		_unit allowDamage false;

		//Einheit aus Fahrzeug endfernen
		if (vehicle _unit != _unit) then 
		{
			unAssignVehicle _unit;
			_unit action ["GetOut", vehicle _unit];
		};

		//Sprengladungen mit Todmanschalter zünden
		[_unit] call ace_explosives_fnc_onIncapacitated;

		//Dialog ausführen
		[] call FUNC(dialog);
	};
};

//var nach Respwan zurück setzen
["Respawn", {

    {
		[player, false, 1, true] call ace_medical_fnc_setUnconscious;
		player setVariable ["OPT_isUnconscious", 0, true];
		player setVariable ["OPT_isStabilized", 0, true];
		player allowDamage true;
		1 enableChannel true;
		OPT_REVIVE_unconsciousHandler = nil;
		 
    } call CFUNC(execNextFrame);

}] call CFUNC(addEventhandler);

//EH für Spielerabschüsslog 
//Event Aüslösung bei bewustlosen Spieler.

DFUNC(playerHandleDamage) = 
{
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

	if ((_unit getVariable "ACE_isUnconscious") and isNil "OPT_REVIVE_unconsciousHandler") then 
	{
		OPT_REVIVE_unconsciousHandler = true;
		[_unit, _instigator, _source, _projectile] remoteExecCall ["OPT_SHOP_fnc_writeKill", 2, false];

		if (_unit == _source) then 
        {          
			["Name des Gegners:", "Selbstverschulden"] spawn BIS_fnc_infoText;
        } 
		else
		{         
			["Name des Gegners:", format["%1",name _instigator]] spawn BIS_fnc_infoText;

        };
	};
};

player addEventHandler ["HandleDamage", FUNC(playerHandleDamage)];

// 3D Marker
GVAR(missionEH_draw3D) = addMissionEventHandler ["Draw3D", 
{
    private _nearbyUnits = playableUnits select 
	{
        (_x distance player) < 30 and
        _x getVariable "ACE_isUnconscious" and
        _x != player and
        SIDE _x == PLAYERSIDE
    };
    {
        private _name = NAME _x;
        drawIcon3D ["\a3\ui_f\data\map\MapControl\hospital_ca.paa", [0.6,0.15,0,0.8], _x, 0.5, 0.5, 0, format["%1 (%2m)", _name, ceil (player distance _x)], 0, 0.02];

    } count _nearbyUnits;
}];









