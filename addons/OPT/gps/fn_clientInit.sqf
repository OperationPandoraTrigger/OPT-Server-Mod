/**
* Spielerdarstellung auf der Karte 
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
* Lokal:
* Ja/Nein
* Lokal bedeutet, dass das Skript keine globalen Variablen o.Ä. verändert/erstellt. 
* Wenn Nein und es bestehen Einflüsse auf andere Skripte hier kurz beschreiben.
* 
* Global:
* Nein
*
* API:
* Nein
* 
* Beispiel Externer Aufruf:
* [] call EFUNC(gps,clientInit);
* Beispiel interner Aufruf:
* [] call FUNC(clientInit);
*
*/

#include "macros.hpp"

diag_log "Successfully loaded the OPT/GPS module on the client";

// Kontrolle ob Map oder Dialog geöffnet wird
DFUNC(Dialogcheck) = 
{
	private _verarbeitungEin = false;

	//OPT Karten-Dialog
	if (!(isNull ((findDisplay 444001) displayCtrl 10007))) then
		{
			_verarbeitungEin = true;
		};

	//BIS Artillery Dialog
	if (!(isNull ((findDisplay -1) displayCtrl 500))) then
		{
			_verarbeitungEin = true;
		};

	//BIS  UAV Dialog (klappt nicht)	
	if (!(isNull ((findDisplay 160) displayCtrl -1))) then
		{
			_verarbeitungEin = true;
		};

	//BIS  Karte und Minimap
	if (visibleMap or visibleGPS) then
		{
			_verarbeitungEin = true;
		};

	_verarbeitungEin	
};

