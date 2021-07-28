#include "macros.hpp"

private _type = "TvT";
private _logged = false;

// Ermittle Sieger
if (EGVAR(SECTORCONTROL,csat_points) != EGVAR(SECTORCONTROL,nato_points)) then
{
    if (EGVAR(SECTORCONTROL,csat_points) > EGVAR(SECTORCONTROL,nato_points)) then
    {
        _logged = true;
        [east, format ["%1:%2", EGVAR(SECTORCONTROL,nato_points), EGVAR(SECTORCONTROL,csat_points)], _type] call ocap_fnc_exportData;
    }
    else
    {
        _logged = true;
        [west, format ["%1:%2", EGVAR(SECTORCONTROL,nato_points), EGVAR(SECTORCONTROL,csat_points)], _type] call ocap_fnc_exportData;
    };
}
else
{
    _logged = true;
    [sideUnknown, format ["%1:%2", EGVAR(SECTORCONTROL,nato_points), EGVAR(SECTORCONTROL,csat_points)], _type] call ocap_fnc_exportData;
};

if (!_logged) then
{
    [sideUnknown, format ["NATO:%1 CSAT:%2", EGVAR(SECTORCONTROL,nato_points), EGVAR(SECTORCONTROL,csat_points)], _type] call ocap_fnc_exportData;
};
