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

publicVariable QGVAR(Hardcap_nato_choppers);
publicVariable QGVAR(Hardcap_nato_vehicles);
publicVariable QGVAR(Hardcap_nato_supplies);
publicVariable QGVAR(Hardcap_nato_sea);

publicVariable QGVAR(Hardcap_csat_choppers);
publicVariable QGVAR(Hardcap_csat_vehicles);
publicVariable QGVAR(Hardcap_csat_supplies);
publicVariable QGVAR(Hardcap_csat_sea);

publicVariable QGVAR(Hardcap_aaf_choppers);
publicVariable QGVAR(Hardcap_aaf_vehicles);
publicVariable QGVAR(Hardcap_aaf_supplies);
publicVariable QGVAR(Hardcap_aaf_sea);

publicVariable QGVAR(Daten_send);
