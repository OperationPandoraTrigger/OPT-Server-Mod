/**
* Löschen eines erstellten Markern mit der angegebenen ID 
* 
* Autor: [GNC]Lord-MDB
*
* Argumente:
* 0: <STRING> _ID (Markername des zu löschenden Marker)
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
* Ja
* 
* Beispiel Externer Aufruf:
* ["_id"] call EFUNC(dynmarkerverwaltung,markerLoschen);
* Beispiel interner Aufruf:
* ["_id"] call FUNC(markerLoschen);
*
*/

#include "macros.hpp"

params
	[
		["_id",""]
	];

[_id] call CFUNC(removeMapGraphicsGroup);

nil
