/**
* Funktion zum setzen eines Marker Icons
* 
* Autor: [GNC]Lord-MDB
*
* Argumente:
* 0: <Number> _id (Marker ID für Markernamen feststellung)
* 1: <STRING> _icon (Texturverweis für Markersymbol)
*
* Rückgabewert:
* keinen
*
* Server Only:
* Nein
* 
* Lokal:
* Ja
* 
* Global:
* Nein
* 
* API:
* ja
* 
* Beispiel Externer Aufruf:
* [_id,"_icon"] call OFUNC(setMarkerIcon);
* Beispiel interner Aufruf:
* [_id,"_icon"] call OFUNC(setMarkerIcon);
*
*/

#include "macros.hpp"

params
					
[
	["_id",0],
	["_icon","\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa"]
];

//Assertions
ASSERT_IS_NUMBER(_id);
ASSERT_IS_STRING(_icon);

//Marker Name erstellen
private _markerNamen = format ["OPTMarker%1",_id];

//Marker Icon an Clib geben 
//[_markerNamen, [_icon]] call CFUNC(addMapGraphicsGroup);
//BIS Marker
_markerNamen setMarkerTypeLocal _icon;
	
