/**
* Author: Lord-MDB
* Teilt alle Clienten den Datensatz des Hardcaps neu zu.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call Func(hardcap_send);
*
*/
#include "macros.hpp"

GVAR(Daten_send) = true;
publicVariable QGVAR(Hardcap_pool);
publicVariable QGVAR(Daten_send);
