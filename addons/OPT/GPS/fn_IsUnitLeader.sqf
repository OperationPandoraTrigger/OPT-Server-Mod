#include "macros.hpp";
/*
Check if unit is leader of the group.
Currently simply checks for highest rank. Should maybe be switched to fixed slots or typeof checking ("Gruppenfuehrer")?

*/


params ["_unit"];


_unit == leader group _unit;