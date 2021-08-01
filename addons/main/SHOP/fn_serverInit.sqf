/**
* Description:
* Init Server Hardcap Daten für Shop
*
* Author:
* form
*
* Arguments:
*
* Return Value:
*
* Server Only:
* Yes
*
* Global:
* No
*
* API:
* No
*
* Example:
* [] call FUNC(serverInit);
*/
#include "macros.hpp"

// Gutschrift-System
GVAR(RECENT_ORDERS) = createHashMap;
publicVariable QGVAR(RECENT_ORDERS);

// Hardcap
GVAR(Hardcap_pool) = createHashMap;

if (GVAR(hardcapmode) > 0) then
{
    {
        _x params ["_Classname", "_BuyPrice", "_SellPrice", "_SellPriceEnemy", "_NeedsCargo", "_GivesCargo", "_Draggable", "_Carriable", "_CanRepair", "_GrabOffset", "_GrabDir", "_HeightOffset", "_Side", "_HardCap"];
        private _hardcap = _HardCap select (GVAR(hardcapmode) - 1);
        if (_hardcap >= 0) then
        {
            GVAR(Hardcap_pool) set [_Classname, [_hardcap, _hardcap]];
        };
    } forEach GVAR(DB_all);
};
publicVariable QGVAR(Hardcap_pool);
