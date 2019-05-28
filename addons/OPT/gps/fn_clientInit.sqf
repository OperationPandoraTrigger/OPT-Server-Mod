/**
* Spielerdarstellung auf der Karte 
* 
* Autor: [GNC]Lord-MDB
*
* Argumente:
* kein
*
* Rückgabewert:
* kein
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
* Nein
* 
* Beispiel Externer Aufruf:
* [] call EFUNC(gps,clientInit);
* Beispiel interner Aufruf:
* [] call FUNC(clientInit);
*
*/

#include "macros.hpp"

DUMP("Successfully loaded the OPT/GPS module on the client");

// Event Liste
#include "\opt\opt\addons\opt\tracker\Events.hpp"

// Textur Liste
#include "\opt\opt\addons\opt\tracker\Texturen.hpp"

// Kontrolle ob Map oder Dialog geöffnet wird
DFUNC(dialogCheck) = 
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

	//BIS  UAV Dialog	
	if (!(isNull ((findDisplay 160) displayCtrl 51))) then
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

//Ermitteln Spieler der Seite
DFUNC(spielerPoolLeben) = 
{

	params 
	[
		["_units",[]]
	];

	private _spielerPoolLeben = [];

	//Spielerfeststellung die zur Seite gehören und keine Revive Status haben 
	_units apply 
	{ 
		if ((side _x isEqualTo playerSide) and !((_x getVariable ["FAR_isUnconscious", 0]) == 1) and (alive _x)) then
		{
			_spielerPoolLeben pushBack _x;
		};
	};	

	_spielerPoolLeben

};

//Ermitteln Spieler die Revive Status haben
DFUNC(spielerPoolRevive) = 
{

	params 
	[
		["_units",[]]
	];

	private _spielerPoolRevive = [];

	//Spielerfeststellung die zur Seite gehören und Revive Status haben 
	_units apply 
	{ 
		if ((side _x isEqualTo playerSide) and ((_x getVariable ["FAR_isUnconscious", 0]) == 1) and (alive _x)) then
		{
			_spielerPoolRevive pushBack _x;
		};
	};	

	_spielerPoolRevive
};

//UAV Drohnen
DFUNC(UAV) = 
{
	
	params 
	[
		["_units",[]]
	];

	private _UAVDrohne = [];

	_units apply 
	{ 
		if ((side _x isEqualTo playerSide) and (alive _x)) then
		{
			_UAVDrohne pushBack _x;
		};
	};

	_UAVDrohne
};	

//Zusätzliche Marker erstellen
DFUNC(addMarker) = 
{

	params 
	[
		["_units",[]],
		["_modus",0]
	];

	private _farbe = [1,1,1,1];	
	private _idArray = [];
	private _id = 0;
	private _text = "";

	switch (playerSide) do 
	{
    	case west: 
		{
			//blau
			_farbe = [0,0,1,1];	
    	};
    	case east: 
		{
			//rot
        	_farbe = [1,0,0,1];	
   		};
	};

	_units apply 
	{ 
		private _vehName = getText (configFile >> "cfgVehicles" >> typeOf (vehicle _x) >> "displayName");

		switch (_modus) do 
		{
    		case 0: 
			{
				//Spieler
				_text = format["%1", name _x]	
    		};
    		case 1: 
			{
				//UAV
        		_text = format["%1 (---)", _vehName]
   			};
		};

    	private _MarkerDatenblock = 
		[
		[0,0,0],
		"normal",
		_x,
		_text,
		"mil_triangle", // PLAYER_ICON
		getDir _x,
		_farbe,		
		];

		_id = [OPTAddMarker, _MarkerDatenblock] call CFUNC(localEvent);

		_idArray pushBack _id;
	};

	_idArray
};

//Init GPS System
["missionStarted", 
{
	//Speicher Marker und Einheiten
	GVAR(spielerPool) = [];
	GVAR(MarkerPool) =[];
	GVAR(UAVPool) = [];

	private _units = playableUnits;

	GVAR(spielerPool) = [_units] call FUNC(spielerPoolLeben);

	_id = [GVAR(spielerPool),0] call FUNC(addMarker);

	GVAR(MarkerPool) pushBack _id;

}, []] call CFUNC(addEventHandler); 

//Update GPS Marker
[
	{
		//zwischenspeicher Marker und Einheiten
		private _spielerPoolAdd = [];
		private _spielerPoolRevive = [];
		private _spielerAddMarker = [];
		private _spielerRevive = [];
		private _UAVMarker = [];

		private _farbe = [1,1,1,1];	
		private _units = playableUnits;
		private _text = "";
		private _vehName = "";

		private _spielerPoolAdd = [_units] call FUNC(spielerPoolLeben);

		_spielerPoolAdd apply 
		{ 
			if ((GVAR(spielerPool) find _x) isEqualTo -1) then
			{
				_spielerAddMarker pushBack _x;
			};
		};

		_id = [_spielerAddMarker,0] call FUNC(addMarker);

		GVAR(spielerPool) pushBack _spielerAddMarker;
		GVAR(MarkerPool) pushBack _id;

		//UAV Drohnen Marker
		private _UAVDrohnen = [allUnitsUAV] call FUNC(UAV);

		_UAVDrohnen apply 
		{ 
			if ((GVAR(UAVPool) find _x) isEqualTo -1) then
			{
				_UAVMarker pushBack _x;
			};
		};

		GVAR(UAVPool) pushBack _UAVMarker;

		_id = [_UAVMarker,1] call FUNC(addMarker);

		GVAR(MarkerPool) pushBack _id;

		//Marker Text ändern
		GVAR(spielerPool) apply 
		{ 
			if (vehicle _x != _x) then 
			{
				_vehName = getText (configFile >> "cfgVehicles" >> typeOf (vehicle _x) >> "displayName");
				
				// Spezialfall Drohne
                 if ((vehicle _x) in allUnitsUAV) then 
				{
                    private _operator = (UAVControl vehicle _x) select 0;

                    // UAV Operator ja/nein
                     if (!isNull _operator) then 
					{
                        _text = format["%1 (%2)", _vehName, name _operator];
                    } 
					else 
					{
						_text = format["%1 (---)", _vehName];
                    };
				};	

				_text = format["%1 (%2)", _vehName, name _x];		
			}
			else
			{
				_text = format["%1",name _x];			
			};	
		
			private _index = GVAR(spielerPool) find _x;

			[OPTsetMarkerText, [(GVAR(MarkerPool) select _index),_text]] call CFUNC(localEvent);		

		};

		//Spieler mit Revive Status
		_spielerPoolRevive = [_units] call FUNC(spielerPoolRevive);

		_spielerPoolRevive apply 
		{ 
			if ((GVAR(spielerPool) find _x) > -1) then
			{
				_spielerRevive pushBack _x;
			};
		};

		//Spieler mit Revive Status Marker Text und Symbol ändern
		_spielerRevive apply 
		{ 
			_text = format["%1 wurde getötet", name _x];		
				
			private _index = GVAR(spielerPool) find _x;

			[OPTsetMarkerText, [(GVAR(MarkerPool) select _index),_text]] call CFUNC(localEvent);

			[OPTsetMarkerIcon, [(GVAR(MarkerPool) select _index),"loc_Hospital"]] call CFUNC(localEvent);			

		};

		//Spieler Marker Text und Symbol auf Standart ändern
		GVAR(spielerPool) apply 
		{ 
			_text = format["%1", name _x];		
				
			private _index = GVAR(spielerPool) find _x;

			[OPTsetMarkerText, [(GVAR(MarkerPool) select _index),_text]] call CFUNC(localEvent);

			[OPTsetMarkerIcon, [(GVAR(MarkerPool) select _index),"mil_triangle"]] call CFUNC(localEvent);			

		};
	},
	1, //1 Sek Verarbeitung
	[]
	
] call CFUNC(addPerFrameHandler);