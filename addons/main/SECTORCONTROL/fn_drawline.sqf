/**
* Author: form / möhre
* draw straight line on map using rotated marker symbol
*
* Arguments:
* 0: <array> Start coordinates
* 1: <array> End coordinates
* 2: <string> Color
* 3: <int> Thickness
* 4: <string> Marker name
*
* Return Value:
* <string> Marker name or empty string
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
* [[[10051.7, 9771.2], [8891.66, 9520.1]], "ColorRed", 8, "marker_15"] call FUNC(drawline);
*
*/
#include "macros.hpp"

// read parameters 
params ["_pos", "_color", "_size", "_id"]; 
private _start = _pos select 0;
private _end = _pos select 1;
private ["_mrk", "_size", "_dist", "_ang", "_center"]; 

// calculate line 
_dist = sqrt(((_end select 0) - (_start select 0))^2 + ((_end select 1) - (_start select 1))^2) * 0.5; 
_ang = ((_end select 0) - (_start select 0)) atan2((_end select 1) - (_start select 1)); 
_center = [(_start select 0) + sin(_ang) * _dist, (_start select 1) + cos(_ang) * _dist]; 
 
// create marker 
_mrk = createMarkerLocal [_id, _center]; 
if (_mrk != "") then
{
    // define marker 
    _mrk setMarkerDirLocal _ang; 
    _mrk setMarkerShapeLocal "RECTANGLE"; 
    _mrk setMarkerBrushLocal "Solid"; 
    _mrk setMarkerColorLocal _color; 
    _mrk setMarkerSize [_size, _dist];   // Letzter Markerbefehl nicht-local (für serverweiten Broadcast)
 
    // return marker 
    _mrk
};
