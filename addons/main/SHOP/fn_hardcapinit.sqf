/**
* Description:Loadout laden für Standartausführung der Bewaffnung
*
*
* Author:
* form
*
* Arguments:
* 0 <int> Hardcap-Level
*
* Return value:
* None
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
* 3 call FUNC(hardcapinit);
*/
#include "macros.hpp"

params
[
    ["_hardcapMode", 0]
];

GVAR(Hardcap_pool) = createHashMap;
if (_hardcapMode > 0) then
{
    {
        _x params ["_Classname", "_BuyPrice", "_SellPrice", "_SellPriceEnemy", "_NeedsCargo", "_GivesCargo", "_Draggable", "_Carriable", "_CanRepair", "_GrabOffset", "_GrabDir", "_HeightOffset", "_Side", "_HardCap", "_BeamRadius"];
        private _hardcap = _HardCap select (_hardcapMode - 1);
        if (_hardcap >= 0) then
        {
            GVAR(Hardcap_pool) set [_Classname, [_hardcap, _hardcap]];
        };
    } forEach GVAR(DB_all);
};
publicVariable QGVAR(Hardcap_pool);
