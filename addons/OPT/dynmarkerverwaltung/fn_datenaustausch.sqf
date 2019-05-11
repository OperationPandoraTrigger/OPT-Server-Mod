/**
* Datenaustauschfunktion für Dynamische Markerverwaltung
* 
* Autor: [GNC]Lord-MDB
*
* Argumente:
* 0: <STRING>   _modus
* 1: <ARRAY>    _daten
* 1: <ARRAY>    _speicher
*
* Rückgabewert:
* 0: <ARRAY>    _speicher
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
* [] call EFUNC(dynmarkerverwaltung,datenaustausch);
* Beispiel interner Aufruf:
* [] call FUNC(datenaustausch);
*
*/

#include "macros.hpp"

params
	[
		["_modus",""],
		["_daten",[]],
		["_speicher",[]],
	];


switch (_modus) do 
	{
		//Datenblock hinzufügen
		case "neu": 
			{
			_speicher pushBack _daten;	
			}; 	

		//Datenblock wechseln 
		case "wechsel": 
			{

			}; 	
	};
	
_speicher
