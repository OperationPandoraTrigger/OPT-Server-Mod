/**
* Author: form
* deletes sectormarkers from the map
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* Yes
*
* Public:
* No 
* 
* Global:
* No
* 
* API:
* No
*
* Example:
* [] call FUNC(deletesectormarkers);
*
*/
#include "macros.hpp"

{
    deleteMarker (_x select 4);
} forEach GVAR(SectorMarkers);
