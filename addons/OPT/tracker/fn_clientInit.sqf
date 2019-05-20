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
* [] call EFUNC(tracker,clientInit);
* Beispiel interner Aufruf:
* [] call FUNC(clientInit);
*
*/

#include "macros.hpp"

DUMP("Successfully loaded the OPT/tracker module on the client");

//OPT Karten-Dialog
["OPTKartenDialog", 
	{
		((findDisplay 444001) displayCtrl 10007) call CFUNC(registerMapControl)
	},	
[]] call CFUNC(addEventHandler);

//BIS Artillery Dialog
["BISArtilleryDialog", 
	{
		((findDisplay -1) displayCtrl 500) call CFUNC(registerMapControl)
	},
[]] call CFUNC(addEventHandler);

//BIS UAV Dialog
["BISUAVDialog", 
	{
		((findDisplay 160) displayCtrl 51) call CFUNC(registerMapControl)
	},
[]] call CFUNC(addEventHandler);

//Feststellung ob Dialog vorhanden ist und Eventauslösung 
[
	{
		//OPT Karten-Dialog
		if (!(isNull ((findDisplay 444001) displayCtrl 10007))) then
		{
			["OPTKartenDialog", []] call CFUNC(localEvent)
		};	
		
		//BIS Artillery Dialog
		if (!(isNull ((findDisplay -1) displayCtrl 500))) then
		{
			["BISArtilleryDialog", []] call CFUNC(localEvent)
		};	
		
		//BIS UAV Dialog 
		if (!(isNull ((findDisplay 160) displayCtrl 51))) then
		{
				["BISUAVDialog", []] call CFUNC(localEvent)
		};	
		
		//Zeit verzörgerung für Durchlauf 1/sek
		[{}, 1 ,""] call CLib_fnc_wait;
	
	}, 0, []
	
] call CFUNC(addPerFrameHandler);

