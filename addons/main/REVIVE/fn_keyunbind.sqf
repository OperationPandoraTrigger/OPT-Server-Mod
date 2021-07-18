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
        private _txt = MLOC(CHAT_DEACTIVATED);
        private _header = MLOC(SAN_SYS);
        hint format["%1\n\n%2", _header, _txt];
    };
} forEach ['Chat'];

_return
