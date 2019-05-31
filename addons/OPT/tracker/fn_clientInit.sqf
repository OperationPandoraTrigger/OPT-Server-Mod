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
	OPT_KARTEN_DIALOG_OPEN, 
	{
		((findDisplay 444001) displayCtrl 10007) call CFUNC(registerMapControl)
	},
	[]

] call CFUNC(addEventHandler);

//BIS Artillery Dialog
[
	BIS_ARTILLERY_DIALOG_OPEN, 
	{
		((findDisplay -1) displayCtrl 500) call CFUNC(registerMapControl)
	},
	[]

] call CFUNC(addEventHandler);

//BIS UAV Dialog
[
	BIS_UAV_DIALOG_OPEN, 
	{
		((findDisplay 160) displayCtrl 51) call CFUNC(registerMapControl)
	},
	[]

] call CFUNC(addEventHandler);

//Event addMarker
[
	OPT_ADD_MARKER, 
	{
		_this params ["_eventArgs"];

		private _id = 0;

		_id = _eventArgs call OFUNC(addMarker);

		_id
	},
	[]

] call CFUNC(addEventHandler);

//Event setMarkerText
[
	OPT_SET_MARKER_TEXT, 
	{
		_this params ["_eventArgs"];

		_eventArgs call OFUNC(setMarkerText);

	},
	[]

] call CFUNC(addEventHandler);

//Event setMarkerIcon
[
	OPT_SET_MARKER_ICON, 
	{
		_this params ["_eventArgs"];

		_eventArgs call OFUNC(setMarkerIcon);

	},
	[]

] call CFUNC(addEventHandler);

//Event setMarkerColor
[
	OPT_SET_MARKER_COLOR, 
	{
		_this params ["_eventArgs"];

		_eventArgs call OFUNC(setMarkerColor);
	},
	[]

] call CFUNC(addEventHandler);

//Event setMarkerHover
[
	OPT_SET_MARKER_HOVER, 
	{
		_this params ["_eventArgs"];

		_eventArgs call OFUNC(setMarkerHover);
	},
	[]

] call CFUNC(addEventHandler);

//Event removeMarkerHover
[
	OPT_REMOVE_MARKER_HOVER, 
	{
		_this params ["_eventArgs"];

		_eventArgs call OFUNC(removeMarkerHover);
	},
	[]

] call CFUNC(addEventHandler);

//Event removeMarker
[
	OPT_REMOVE_MARKER, 
	{
		_this params ["_eventArgs"];

		_eventArgs call OFUNC(removeMarker);
	},
	[]

] call CFUNC(addEventHandler);

//Feststellung ob Dialog vorhanden ist und Eventauslösung 
[
	{
		
		//OPT Karten-Dialog
		if (!(isNull ((findDisplay 444001) displayCtrl 10007))) then
		{
			[OPT_KARTEN_DIALOG_OPEN, []] call CFUNC(localEvent)
		};	
		
		//BIS Artillery Dialog
		if (!(isNull ((findDisplay -1) displayCtrl 500))) then
		{
			[BIS_ARTILLERY_DIALOG_OPEN, []] call CFUNC(localEvent)
		};	
		
		//BIS UAV Dialog 
		if (!(isNull ((findDisplay 160) displayCtrl 51))) then
		{
			[BIS_UAV_DIALOG_OPEN, []] call CFUNC(localEvent)
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
		["_markerID",0],
		["_trackingobjekt",nil]
	];

	//Assertions
	ASSERT_IS_NUMBER(_markerID);
	ASSERT_IS_OBJECT(_trackingobjekt);

	//Marker Name erstellen
	private _markerNamen = format ["OPTMarker%1",_markerID];

	//BIS Marker
	_markerNamen setmarkerpos getPosWorld _trackingobjekt;
	_markerNamen setmarkerdir getdir _trackingobjekt;
	
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

			//Stufe Normal 40ms
			private _stufeNormal = 0,04;

			//Stufe Realtime 0ms
			private _stufeRealtime = 0;

			//BearbeitungsStufe Normal
			if (_prioritaetzeit isEqualTo _stufeNormal) then
			{

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

							(_markerIDArray select _i),
							((_markerDatenArray select _i) select 1) 

						] call FUNC(markerVersetzen);

					};	
				};
			};

			//BearbeitungsStufe Realtime
			if (_prioritaetzeit isEqualTo _stufeRealtime) then
			{

				// Kontrolle ob Karte oder Kartendialog geöffnet ist
				private _KartenOpen = [] call FUNC(kartenCheckOpen);

				if (_KartenOpen) then
				{
					//Marker versetzen aufrufen
					[

						(_markerIDArray select _i),
						((_markerDatenArray select _i) select 1) 

					] call FUNC(markerVersetzen);

				};	
				
			};

		};    
	},
	0,
	[]
	
] call CFUNC(addPerFrameHandler);