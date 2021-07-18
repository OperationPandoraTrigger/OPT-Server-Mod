/**
* Author: Lord-MDB
* Check Playmove und neu setzten der Animation
*
* Arguments:
* 0: <OBJECT> Player der den EV ausgelöst hat
*
* Return Value:
* None
*
* Example:
* [player] call FUNC(checkplaymove);
*
*/
#include "macros.hpp"

params ["_target"];

if (!(animationState _target == "AcinPknlMwlkSnonWnonDb") and alive _target and  !(lifeState _target isEqualTo "INCAPACITATED")) then
{
    _target playMove "AcinPknlMwlkSnonWnonDb";
};
