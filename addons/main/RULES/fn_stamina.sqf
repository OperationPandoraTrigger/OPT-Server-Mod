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

private _typeOfPlayer = typeOf player;

// check Munitionsträger
if (_typeOfPlayer in GVAR(Soldatmuni)) then
{
    _stamina = GVAR(StaminaInfmuni);
};

// check Light launcher
if (_typeOfPlayer in GVAR(Lightrocketmen)) then
{
    _stamina = GVAR(StaminaInfaaat);
};

// check Heavy launcher
if (_typeOfPlayer in GVAR(Heavyrocketmen)) then
{
    _stamina = GVAR(StaminaInfaaat);
};

// check AA launcher
if (_typeOfPlayer in GVAR(AArocketmen)) then
{
    _stamina = GVAR(StaminaInfaaat);
};


