/**
* Überwachung ob Dialog vorhanden ist 
* 
* Autor: [GNC]Lord-MDB
*
* Argumente:
* keine
*
* Rückgabewert:
* keine
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
* nein
* 
* Beispiel Externer Aufruf:
* [] call EFUNC(dynmarkerverwaltung,clientInit);
* Beispiel interner Aufruf:
* [] call FUNC(clientInit);
*
*/

#include "macros.hpp"

diag_log "Successfully loaded the OPT/dynmarkerverwaltung module on the client";

//Dialoge zum Overlay hinzufügen für Darstellung
[
	{
		//OPT Karten-Dialog
		[
			{
				((findDisplay 444001) displayCtrl 10007) call CFUNC(registerMapControl)
			}, 
			{
				(!(isNull ((findDisplay 444001) displayCtrl 10007)))
			}
		] call CFUNC(waitUntil);	
		
		//BIS Artillery Dialog
		[
			{
				((findDisplay -1) displayCtrl 500) call CFUNC(registerMapControl)
			}, 
			{
				(!(isNull ((findDisplay -1) displayCtrl 500)))
				}
		] call CFUNC(waitUntil);	
		
		//BIS  UAV Dialog (klappt nicht)
		[
			{
				((findDisplay 160) displayCtrl -1) call CFUNC(registerMapControl)
			}, 
			{
				(!(isNull ((findDisplay 160) displayCtrl -1)))
			}
		] call CFUNC(waitUntil);	
	
	}, 0, []
	
] call CFUNC(addPerFrameHandler);


