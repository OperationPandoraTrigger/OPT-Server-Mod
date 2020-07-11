/**
* unbind some key functions while the player is unconcious (caused by stupid 3.0)
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
* [] call FUNC(keyunbind);
*/
#include "macros.hpp"

private ["_key","_return"];
_key = _this select 1;
_return = false;

{
    if ((player getVariable ['OPT_isUnconscious',0] == 1) && {_key in (actionkeys _x)}) then 
    {
        _return = (_key == (actionkeys _x) select 0);
        private _txt = "Chat deaktiviert!";
        private _header = parseText "<t size='2.0' color='#D7DF01'>San-System</t>";
        hint Format ["%1 \n\n %2",_header,_txt];
    };
} forEach ['Chat'];


_return