/**
* Author: form
* force reequip players primary weapon
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* call FUNC(weaponreequip);
*
*/
#include "macros.hpp"

private _weapon = primaryWeapon player;
private _items = primaryWeaponItems player;
private _mag = primaryWeaponMagazine player;

player removeWeapon _weapon;
player removeWeaponGlobal _weapon;

player addWeapon _weapon;
removeAllPrimaryWeaponItems player;

{
    player addMagazine _x;
} forEach _mag;

{
    player addPrimaryWeaponItem _x;
} forEach _items;

player selectWeapon _weapon;
