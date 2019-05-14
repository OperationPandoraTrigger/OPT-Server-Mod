/**
* Löschen von erstellten Markern 
* 
* Autor: [GNC]Lord-MDB
*
* Argumente:
* 0: <STRING> _ID (Markername des zu löschenden Marker)
*
* Rückgabewert:
* 0: <STRING> _ID (Markername des gelöschten Marker)
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

(_this select 0) params
	[
		["_id",""]

	];

[_id] call CFUNC(removeMapGraphicsGroup);

nil
