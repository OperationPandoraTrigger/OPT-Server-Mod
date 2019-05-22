/**
* Überwachung ob Dialog vorhanden ist und Anmeldung des Dialog in Clibsystem
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

// Event Liste
#include "Events.hpp"

//OPT Karten-Dialog
[
	OPTKartenDialogOpen, 
	{
		((findDisplay 444001) displayCtrl 10007) call CFUNC(registerMapControl)
	},
	[]

] call CFUNC(addEventHandler);

//BIS Artillery Dialog
[
	BISArtilleryDialogOpen, 
	{
		((findDisplay -1) displayCtrl 500) call CFUNC(registerMapControl)
	},
	[]

] call CFUNC(addEventHandler);

//BIS UAV Dialog
[
	BISUAVDialogOpen, 
	{
		((findDisplay 160) displayCtrl 51) call CFUNC(registerMapControl)
	},
	[]

] call CFUNC(addEventHandler);

//Event addMarker
[
	OPTAddMarker, 
	{
		_this params ["_eventArgs"];

		[_eventArgs] call OFUNC(addMarker);
	},
	[]

] call CFUNC(addEventHandler);

//Feststellung ob Dialog vorhanden ist und Eventauslösung 
[
	{
		
		//OPT Karten-Dialog
		if (!(isNull ((findDisplay 444001) displayCtrl 10007))) then
		{
			[OPTKartenDialogOpen, []] call CFUNC(localEvent)
		};	
		
		//BIS Artillery Dialog
		if (!(isNull ((findDisplay -1) displayCtrl 500))) then
		{
			[BISArtilleryDialogOpen, []] call CFUNC(localEvent)
		};	
		
		//BIS UAV Dialog 
		if (!(isNull ((findDisplay 160) displayCtrl 51))) then
		{
			[BISUAVDialogOpen, []] call CFUNC(localEvent)
		};		
	},
	1, //Zeit verzörgerung für Durchlauf 1/sek
	[]
	
] call CFUNC(addPerFrameHandler);

//Markerzähler einrichten
GVAR(idMarkerConuter) = 0;

//Markerspeichern einrichten
GVAR(markerDatenArray) = [];

GVAR(markerIDArray) = [];

//Hilfs Variable für Zeitkontrolle
GVAR(markerZeitNormalcheck) = 0;

//versetzt den Marker zum Objekt

DFUNC(markerVersetzen) = 
{
	params
					
	[
		["_markerID",0,
		["_trackingobjekt",nil],
	];

	//Marker Name erstellen
	private _markerNamen = format ["OPTMarker%1",_markerID]

	//[_markerNamen, [_trackingobjekt]] call CFUNC(addMapGraphicsGroup);

};

//Kontrolle ob Karte oder Kartendialog geöffnet ist.

DFUNC(kartenCheckOpen) = 
{
	
	private _KartenOpen = false;
	
	// OPT Kartendialog 
	if (!(isNull ((findDisplay 444001) displayCtrl 10007))) then
	{
		_KartenOpen = true;	
	};

	//BIS Artillery Dialog 
	if (!(isNull ((findDisplay -1) displayCtrl 500))) then
	{
		_KartenOpen = true;	
	};	

	//BIS UAV Dialog
	if (!(isNull ((findDisplay 160) displayCtrl 51))) then
	{
		_KartenOpen = true;	
	};

	//Mini GPS oder Karte
	if (visibleMap or visibleGPS) then
	{
		_KartenOpen = true;	
	};	

_KartenOpen

};


//Tracking Funktion für versetzen der Marker
[
	{
		// Gobalen Markerspeicher auslesen
		private _markerDatenArray = GVAR(markerDatenArray);

		private _markerIDArray = GVAR(markerIDArray);
		
		// Kontrolle ob Marker versetzt wird
		for "_i" from 0 to count _markerDatenArray do 
		{
			private _prioritaetzeit = (_markerDatenArray select _i) select 0;

			//BearbeitungsStufe Normal
			if ((GVAR(markerZeitNormalcheck) + _prioritaetzeit) <= time) then
			{
				//Neue Zeitmarke ermitteln
				GVAR(markerZeitNormalcheck) = time;

				// Kontrolle ob Karte oder Kartendialog geöffnet ist
				private _KartenOpen = [] call FUNC(kartenCheckOpen);

				if (_KartenOpen) then
				{
					//Marker versetzen aufrufen
					[

						((_markerDatenArray select _i) select 1),
						(_markerIDArray select _i) 

					] call FUNC(markerVersetzen);

				};	
			};		
		};    
	},
	0,
	[]
	
] call CFUNC(addPerFrameHandler);