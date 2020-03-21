/**
* Description:
* Log Eintragauslösung für die Statistik
* 
* Author:
* Lord-MDB
*
* Arguments:
*
* Return Value:
*
* Server Only:
* Yes
* 
* Global:
* No
* 
* API:
* No
* 
* Example:
*/


#include "macros.hpp"

params 
[
	["_verletzter", objNull],
	["_retter" ,objNull],
	["_art" , 0]	
];

private _name1 = name _verletzter;
private _name2 = name _retter;

switch (_art) do 
{
	case 1 : 
	{	
		private _message = format 
		[
    		"%1 (%2) wurde von %3 (%4) wiederbelebt.", 
   	 		_name1, 
    		side _verletzter,
    		_name2,
			side _retter
		];

		["REVIVE", _message] call opt_log_fnc_write;
	};

	case 2 : 
	{	
		private _message = format 
		[
    		"%1 (%2) wurde von %3 (%4) stabilisiert.", 
   	 		_name1, 
    		side _verletzter,
    		_name2,
			side _retter
		];

		["REVIVE", "Jemand wurde wiederbelebt"] call opt_log_fnc_write;
	};

};
