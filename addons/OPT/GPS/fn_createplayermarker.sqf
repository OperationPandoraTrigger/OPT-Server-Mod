/**
* Description:
* client GPS. Create special local player marker
* 
* Author: 
* [GNC]Lord-MDB & James
*
* Arguments:
* None
*
* Return Value:
* 0: <MARKER> player marker
*
* Server only:
* no
*
* Public:
* no
*
* Global:
* no
*
* Sideeffects:
* create local marker
* 
* Example:
* [] call EFUNC(createPlayerMarker);
*
*/
#include "macros.hpp";

private _markerplayer = createMarkerLocal [format["%1_%2", playerSide, "player"], [0,0]];
_markerplayer setMarkerTypeLocal "mil_circle";
_markerplayer setMarkerColorLocal "ColorBrown";
_markerplayer setMarkerSizeLocal [0.8, 0.8];
_markerplayer setMarkerAlphaLocal 0.6;

_markerplayer
