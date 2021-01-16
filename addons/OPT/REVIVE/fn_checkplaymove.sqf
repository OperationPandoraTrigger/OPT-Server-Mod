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
#include "script_component.hpp"

params ["_target"];

if !(animationState _target == "AcinPknlMwlkSnonWnonDb") then 
{
	_target playMove "AcinPknlMwlkSnonWnonDb";
};


