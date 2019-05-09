/**
* Dynamische Markerverwaltung, erstellen und verwalten der Anforderungen aus den Einzelfunktionen 
* 
* Autor: [GNC]Lord-MDB
*
* Argumente:
* Pro Zeile ein Argument, mit <TYP> und Beschreibung
* "Keine" wenn keine Argumente übergeben werden
*
* bsp:
* Argumente:
* 0: <OBJECT>   Das Objekt, mit dem xy gemacht wird
* 1: <SIDE>     Die Seite des Objekts 
* 2: <ARRAY>    Die Waffennamen (Strings)
*
* Rückgabewert:
* Rückgabewert mit <TYP> und Beschreibung 
*
* Server Only:
* Nein
* 
* 
* Lokal:
* Ja/Nein
* Lokal bedeutet, dass das Skript keine globalen Variablen o.Ä. verändert/erstellt. 
* Wenn Nein und es bestehen Einflüsse auf andere Skripte hier kurz beschreiben.
* 
* Global:
* Nein
* 
*
*
* API:
* Ja
* 
* 
* Beispiel Externer Aufruf:
* <Rückgabewert> = [<Argumente>] call EFUNC(Modul,Funktion);
* Beispiel interner Aufruf:
* <Rückgabewert> = [<Argumente>] call FUNC(Funktion);
*
*/

#include "macros.hpp"

diag_log "Successfully loaded the OPT/dynmarkerverwaltung module on the client";

//Texturverweise

//Spieler Marker
#define player_icon "\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa"

//Revive Marker
#define revive_icon "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa"

//Heli Marker
#define heli_icon "\A3\ui_f\data\map\vehicleicons\iconHelicopter_ca.paa"

//Flugzeuge Marker
#define flug_icon "\A3\ui_f\data\map\vehicleicons\iconPlane_ca.paa"

//Panzer Marker
#define panzer_icon "\A3\ui_f\data\map\vehicleicons\iconTank_ca.paa"

//Fallschirm Marker
#define fallschirm_icon "\A3\ui_f\data\map\vehicleicons\iconTank_ca.paa"
