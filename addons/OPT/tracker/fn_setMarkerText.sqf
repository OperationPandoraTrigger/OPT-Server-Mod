/**
* Funktion zum setzen eines Marker textes
* 
* Autor: [GNC]Lord-MDB
*
* Argumente:
* 0: <Number> _id (Marker ID für Markernamen feststellung)
* 1: <STRING> _text (Overlay Textanzeige des Markes)
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
* [_id,"_text"] call OFUNC(setMarkerText);
* Beispiel interner Aufruf:
* [_id,"_text"] call OFUNC(setMarkerText);
*
*/

#include "macros.hpp"

params
					
[
	["_id",0],
	["_text","Error"]
];

//Assertions
ASSERT_IS_NUMBER(_id);
ASSERT_IS_STRING(_text);

//Marker Name erstellen
private _markerNamen = format ["OPTMarker%1",_id];

//Marker Text an Clib geben 
//[_markerNamen, [_text]] call CFUNC(addMapGraphicsGroup);
//BIS Marker
_markerNamen setMarkerTextLocal format["%1",_text];
	
