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
		private _id = 0;

		_id = [] call FUNC(einlesenInShopDialog);
	},
	[]
	
] call CFUNC(addEventHandler);