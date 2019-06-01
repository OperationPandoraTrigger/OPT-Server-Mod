/**
* Funktion zum löschen eines Marker
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
* [_id] call OFUNC(removeMarker);
* Beispiel interner Aufruf:
* [_id] call OFUNC(removeMarker);
*
*/

#include "macros.hpp"

params
					
[
	["_id",0]
];

//Assertions
ASSERT_IS_NUMBER(_id);

//Marker Name erstellen
private _markerNamen = format ["OPTMarker%1",_id]

//Marker erstellen mit Clib
//[_markerNamen] call CFUNC(removeMapGraphicsGroup);
//BIS Marker
deleteMarkerLocal _markerNamen;

//Marker aus System löschen
private _indexArray = GVAR(markerIDArray) find _id;

GVAR(markerIDArray) deleteAt _indexArray;

GVAR(markerDatenArray) deleteAt _indexArray;


