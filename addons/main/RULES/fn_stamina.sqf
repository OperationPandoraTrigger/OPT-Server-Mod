/**
* Author: [GNC]Lord-MDB
* Ausdauerwertefaktor setzen nach Klasse bei Start der Mission und nach den Respwan
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call func(uav);
*
*/
#include "macros.hpp"

private _stamina = GVAR(StaminaInfrest);

// check Munitionsträger
if (typeOf player in GVAR(Soldatmuni)) then
{
    _stamina = GVAR(StaminaInfmuni);
};

// check Light launcher
if (typeOf player in GVAR(Lightrocketmen)) then
{
    _stamina = GVAR(StaminaInfaaat);
};

// check Heavy launcher
if (typeOf player in GVAR(Heavyrocketmen)) then
{
    _stamina = GVAR(StaminaInfaaat);
};

// check AA launcher
if (typeOf player in GVAR(AArocketmen)) then
{
    _stamina = GVAR(StaminaInfaaat);
};

player setUnitTrait ["loadCoef", _stamina];
