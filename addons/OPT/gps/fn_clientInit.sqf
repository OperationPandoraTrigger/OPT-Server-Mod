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
		["_unit",nil],
		["_weapon",nil]
	];

	private _UAVDrohne = [];
	private _UAVMarker = [];

	if (_weapon in allUnitsUAV) then
	{
		if ((side _weapon isEqualTo playerSide) and (alive _x)) then
		{
			_UAVDrohne pushBack _x;
		};
	
		_UAVDrohnen apply 
		{ 
			if ((GVAR(MarkerPool) find _x) isEqualTo -1) then
			{
				_UAVMarker pushBack _x;
			};
		};

		GVAR(MarkerPool) pushBack _UAVMarker;

		_id = [_UAVMarker,1] call FUNC(addMarker);

		GVAR(MarkerIDPool) pushBack _id;
	};	
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

		_id = [OPTADDMARKER, _MarkerDatenblock] call CFUNC(localEvent);

		_idArray pushBack _id;
	};

	_idArray
};

//Update Spielerpool
DFUNC(updateMarkerPool) = 
{
	
	private _units = playableUnits;
	private _spielerPoolAdd = [];
	private _spielerAddEH = [];
	private _id = 0;

	private _spielerPoolAdd = [_units] call FUNC(spielerPoolLeben);

	_spielerPoolAdd apply 
		{ 
			if ((GVAR(MarkerPool) find _x) isEqualTo -1) then
			{
				_spielerAddEH pushBack _x;
			};
		};

	[_spielerAddEH] call FUNC(addEH);

	_id = [_spielerAddEH,0] call FUNC(addMarker);

	GVAR(MarkerPool) pushBack _spielerAddEH;
	GVAR(MarkerIDPool) pushBack _id;

};

//EH hinzufügen
DFUNC(addEH) = 
{
	
	params 
	[
		["_units",[]]
	];

	_units apply 
	{ 
		_x addEventHandler ["GetIn", {[_this] call FUNC(SpielerMarkerText);}];
		_x addEventHandler ["GetOut", {[_this] call FUNC(SpielerMarkerText);}];
		_x addEventHandler ["WeaponAssembled", {[_this] call FUNC(UAV);}];
	};
	
};	

//Spieler Marker Text ändern
DFUNC(SpielerMarkerText) = 
{
	
	params 
	[
		["_vehicle",nil], 
		["_role",""], 
		["_unit",nil], 
		["_turret",[]]
	];

	//Marker Text ändern

	private _vehName = getText (configFile >> "cfgVehicles" >> typeOf (vehicle _unit) >> "displayName");
				
	if (vehicle _unit != _unit) then 
	{
		_text = format["%1 (%2)", _vehName, name _x];		
	}
	else
	{
		_text = format["%1",name _x];			
	};	
		
	private _index = GVAR(MarkerPool) find _x;

	[OPTSETMARKERTEXT, [(GVAR(MarkerIDPool) select _index),_text]] call CFUNC(localEvent);		

};

//EH hinzufügen
DFUNC(UAVMarkerText) = 
{
	
	params 
	[
		["_unit",nil]
	];

	// Spezialfall Drohne
    private _operator = (UAVControl vehicle _unit) select 0;

    // UAV Operator ja/nein
    if (!isNull _operator) then 
	{
        _text = format["%1 (%2)", _vehName, name _operator];
    } 
	else 
	{
		_text = format["%1 (---)", _vehName];
    };
						
	private _index = GVAR(MarkerPool) find _unit;

	[OPTSETMARKERTEXT, [(GVAR(MarkerIDPool) select _index),_text]] call CFUNC(localEvent);		
	
};

//Spieler mit Revive Status
DFUNC(spielerRevive) = 
{
	//Spieler mit Revive Status
	private _units = playableUnits;
	_spielerPoolRevive = [_units] call FUNC(spielerPoolRevive);

	_spielerPoolRevive apply 
	{ 
		if ((GVAR(MarkerPool) find _x) > -1) then
		{
				_spielerRevive pushBack _x;
		};
	};

	//Spieler mit Revive Status Marker Text und Symbol ändern
	_spielerRevive apply 
	{ 
		_text = format["%1 wurde getötet", name _x];		
				
		private _index = GVAR(MarkerPool) find _x;

		[OPTSETMARKERTEXT, [(GVAR(MarkerIDPool) select _index),_text]] call CFUNC(localEvent);

		[OPTSETMARKERICON, [(GVAR(MarkerIDPool) select _index),"loc_Hospital"]] call CFUNC(localEvent);			

	};

	//Spieler Marker Text und Symbol auf Standart ändern
	GVAR(MarkerPool) apply 
	{ 
		_text = format["%1", name _x];		
				
		private _index = GVAR(MarkerPool) find _x;

		[OPTSETMARKERTEXT, [(GVAR(MarkerIDPool) select _index),_text]] call CFUNC(localEvent);

		[OPTSETMARKERICON, [(GVAR(MarkerIDPool) select _index),"mil_triangle"]] call CFUNC(localEvent);			

	};
	
};	

//Init GPS System
["missionStarted", 
{
	//Speicher Marker und Einheiten
	GVAR(MarkerPool) = [];

	private _units = playableUnits;

	GVAR(MarkerPool) = [_units] call FUNC(spielerPoolLeben);

	_id = [GVAR(MarkerPool),0] call FUNC(addMarker);

	GVAR(MarkerIDPool) pushBack _id;

	[GVAR(MarkerPool)] call FUNC(addEH);

	onPlayerConnected "[] call FUNC(updateMarkerPool);";

}, []] call CFUNC(addEventHandler); 

