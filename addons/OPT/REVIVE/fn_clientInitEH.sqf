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
* call FUNC(clientInitEH);
*/

#include "macros.hpp";

//Event zum Ausblende weiteren Schaden und Status setzen
["Dammaged", {

    params ["_unit", "_selection", "_damage", "_hitIndex", "_hitPoint", "_shooter", "_projectile"];
    _unit = _unit select 0;

	//Abfrage ob Einheit beustlos ist
	if (_unit getVariable ["ACE_isUnconscious", false]) then
	{

		//Var für GPS setzen 
		_unit setVariable ["FAR_isUnconscious", 1, true];

		//Schaden weiterer abschalten
		_unit allowDamage false;
	};


}] call CFUNC(addEventhandler);

//var nach Respwan zurück setzen
["Respawn", {

    {
		player setVariable ["FAR_isUnconscious", 0, true];
		player setVariable ["FAR_isStabilized", 0, true];
		player allowDamage true;
		 
    } call CFUNC(execNextFrame);

}] call CFUNC(addEventhandler);



