/**
* Author: James
* add ace menu entry for earplugs
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call func(earplugs);
*
*/
#include "macros.hpp"

if (isNil QGVAR(earplugsInUse)) then 
{
    GVAR(earplugsInUse) = 1;
};

switch (GVAR(earplugsInUse)) do 
{
    case 1: 
    {
        1 fadeSound 0.25;
        [format["<t size='0.8' shadow='1' color='#ffffff'>%1</t>", MLOC(EARPLUGS_25)], (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 1] spawn BIS_fnc_dynamicText;
        GVAR(earplugsInUse) = 3;
    };

    case 2: 
    {
        1 fadeSound 1;
        [format["<t size='0.8' shadow='1' color='#ffffff'>%1</t>", MLOC(EARPLUGS_OUT)],  (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 1] spawn BIS_fnc_dynamicText;
        GVAR(earplugsInUse) = 1;
    };

    case 3: 
    {
        1 fadeSound 0.5;
        [format["<t size='0.8' shadow='1' color='#ffffff'>%1</t>", MLOC(EARPLUGS_50)],  (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 1] spawn BIS_fnc_dynamicText;
        GVAR(earplugsInUse) = 2;
    };
};
