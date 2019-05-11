/**
* Löschen von erstellten Markern 
* 
* Autor: [GNC]Lord-MDB
*
* Argumente:
* 0: <STRING> _ID
*
* Rückgabewert:
* 0: <STRING> _ID
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
* Ja
* 
* Beispiel Externer Aufruf:
* [] call EFUNC(dynmarkerverwaltung,markerloschen);
* Beispiel interner Aufruf:
* [] call FUNC(markerloschen);
*
*/

#include "macros.hpp"

params
	[
		["_id",""]

	];

[_id] call CFUNC(removeMapGraphicsGroup);

_id
