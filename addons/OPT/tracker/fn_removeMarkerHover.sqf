/**
* Funktion zum löschen eines Hover Marker
* 
* Autor: [GNC]Lord-MDB
*
* Argumente:
* 0: <Number> _id (Marker ID für Markernamen feststellung)
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
* [_id] call OFUNC(removeMarkerHover);
* Beispiel interner Aufruf:
* [_id] call OFUNC(removeMarkerHover);
*
*/

#include "macros.hpp"

params
					
[
	["_id",0]
];

//Marker Name erstellen
private _markerNamen = format ["OPTMarker%1",_id]

//Hover Marker in Clib Löschen 
//[_markerNamen,"hover"] call CFUNC(removeMapGraphicsGroup);

	
