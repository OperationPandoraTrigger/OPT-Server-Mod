/**
* Author: form
* force reload players primary weapon
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* call FUNC(reload);
*
*/
#include "macros.hpp"

private _mag = currentMagazine player;
private _mags = magazines player;

// dont reload when player has no magazine
if (_mag != "") then
{
	player removePrimaryWeaponItem _mag;

    // two possible sequences to prevent full or empty inventory
    if (_mag in _mags) then
	{
		reload player;
		player addMagazine _mag;
	}
	else
	{
		player addMagazine _mag;
		reload player;
	};
};
