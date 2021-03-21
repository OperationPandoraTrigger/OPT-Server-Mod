/**
* Description:Löschen von allen Fahrzeugen auf dem Boxen
* 
* 
* Author:
* [GNC]Lord-MDB
*
* Arguments:
* 0 <Objekt> Pads in dem das Fahrzeug gelöscht werden soll
*
* Return value:
* No
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

params 
[
    ["_pads", []]

];

// alle Objekte im auf den Pads erfassen

_pads apply
{

    private _spawnpos = _x;
    private _objs = [];
    
    _objs = nearestObjects [_spawnpos, ["AllVehicles", "Thing"], GVAR(Checkbereich)];

    // now delete
    {
        // Current result is saved in variable _x
        if (toLower (typeOf _x) in (GVAR(orderDialogObjects) apply {toLower (_x select 0)}) and ({isPlayer (_x select 0)} count (fullCrew _x)) == 0) then {
            deleteVehicle _x;
        };

        if ((_x isKindOf "CAManBase") and !alive _x) then 
        {
            deleteVehicle _x;
        };    

    } forEach _objs;

};
