/**
* Description:
* 
* 
* Author:
* [GNC]Lord-MDB
*
* Arguments:
* 
*
* Return value:
* 
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
* 
*/

#include "macros.hpp"

DUMP("Successfully loaded the OPT/Shop module on the client");

// Events

[
	EVENT_SHOP_KAUF_ONLOAD, 
	{
		_this params ["_eventArgs"];

		private _id = 0;

		_id = [_eventArgs] call FUNC(einlesenInShopDialog);
	},
	[]
	
] call CFUNC(addEventHandler);

[
	EVENT_SHOP_KONFIG_ONLOAD, 
	{
		_this params ["_eventArgs"];

		private _id = 0;

		_id = _eventArgs call FUNC(einlesenInKonfigDialog);

		systemChat format["konfig :%1",_eventArgs];
	},
	[]
	
] call CFUNC(addEventHandler);

// Entfernung des Boxchecks PFH Shop
[{
	if (isNull (findDisplay 20000 displayCtrl 20002)) then 
	{
		GVAR(idPadCheckShop) call CFUNC(removePerframeHandler);	
	};

}, 1] call CFUNC(addPerFrameHandler);

// Entfernung des Boxchecks PFH Konfig
[{
	if (isNull (findDisplay 22000 displayCtrl 20002)) then 
	{
		GVAR(idPadCheckKonfig) call CFUNC(removePerframeHandler);	
	};

}, 1] call CFUNC(addPerFrameHandler);