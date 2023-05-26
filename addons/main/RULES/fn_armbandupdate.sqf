/**
* Author: form
* Function to update the players armbands
* Should be called on mission start, respawn, kill and teamkill.
*
* Arguments:
* 0: <OBJ> player to equip armbands to
* 1: <BOOL> set to true to equip the teamkill armband
*
* Return Value:
* None
*
* Examples:
* [player, true] call EFUNC(RULES,armbandupdate);
*
*/
#include "macros.hpp"

params ["_player", "_teamkill"];

// remove all kinds of armbands
{
    _player unassignItem _x;
    _player removeItem _x;
} forEach ["OPT_Armband_SWORD", "OPT_Armband_ARF", "OPT_Armband_TEAMKILL"];

// equip and dress the teamkill armband
if (_teamkill) then
{
    _player addItem "OPT_Armband_TEAMKILL";
    _player assignItem "OPT_Armband_TEAMKILL";
}

// or equip and dress the correct armband
else
{
    switch playerSide do
    {
        case west:
        {
            switch EGVAR(SECTORCONTROL,nato_faction) do
            {
                case "ARF":
                {
                    _player addItem "OPT_Armband_ARF";
                    _player assignItem "OPT_Armband_ARF";
                };

                case "SWORD":
                {
                    _player addItem "OPT_Armband_SWORD";
                    _player assignItem "OPT_Armband_SWORD";
                };
            };
        };

        case east:
        {
            switch EGVAR(SECTORCONTROL,csat_faction) do
            {
                case "ARF":
                {
                    _player addItem "OPT_Armband_ARF";
                    _player assignItem "OPT_Armband_ARF";
                };

                case "SWORD":
                {
                    _player addItem "OPT_Armband_SWORD";
                    _player assignItem "OPT_Armband_SWORD";
                };
            };
        };
    };
};
