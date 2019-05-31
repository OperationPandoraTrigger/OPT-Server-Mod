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
DFUNC(uav) = 
{
	
	params 
	[
		["_unit",nil],
		["_weapon",nil]
	];

	private _uavDrohne = [];
	private _uavMarker = [];

	if (_weapon in allUnitsUAV) then
	{
		if ((side _weapon isEqualTo playerSide) and (alive _x)) then
		{
			_uavDrohne pushBack _x;
		};
	
		_uavDrohne apply 
		{ 
			if ((GVAR(markerPool) find _x) isEqualTo -1) then
			{
				_uavMarker pushBack _x;
			};
		};

		GVAR(markerPool) pushBack _uavMarker;

		_id = [_uavMarker,1] call FUNC(addMarker);

		GVAR(markerIDPool) pushBack _id;
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

    	private _markerDatenblock = 
		[
		[0,0,0],
		"normal",
		_x,
		_text,
		"mil_triangle", // PLAYER_ICON
		getDir _x,
		_farbe		
		];

		_id = [OPTADDMARKER, _markerDatenblock] call CFUNC(localEvent);

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
		if ((GVAR(markerPool) find _x) isEqualTo -1) then
		{
			_spielerAddEH pushBack _x;
		};
	};

	[_spielerAddEH] call FUNC(addEH);

	_id = [_spielerAddEH,0] call FUNC(addMarker);

	GVAR(markerPool) pushBack _spielerAddEH;
	GVAR(markerIDPool) pushBack _id;

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
		_x addEventHandler ["GetIn", {[_this] call FUNC(spielerMarkerText);}];
		_x addEventHandler ["GetOut", {[_this] call FUNC(spielerMarkerText);}];
		_x addEventHandler ["WeaponAssembled", {[_this] call FUNC(uav);}];
		_x addEventHandler ["PlayerViewChanged", {[_this] call FUNC(UAVMarkerText)}];
		_x addEventHandler ["Dammaged", {[_this] call FUNC(markerTextRevive);}];
	};
	
};	

//Spieler Marker Text ändern
DFUNC(spielerMarkerText) = 
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
		
	private _index = GVAR(markerPool) find _x;

	[OPTSETMARKERTEXT, [(GVAR(markerIDPool) select _index),_text]] call CFUNC(localEvent);		

};

//UAV Marker Text
DFUNC(uavMarkerText) = 
{
	
	params [
		["_oldUnit",nil], 
		["_newUnit",nil], 
		["_vehicle",nil],
		["_oldCamera",nil], 
		["_newCamera",nil], 
		["_uav",nil]
	];

	// Spezialfall Drohne
    private _operator = (UAVControl vehicle _uav) select 0;

	private _vehName = getText (configFile >> "cfgVehicles" >> typeOf (vehicle _unit) >> "displayName");
	
    // UAV Operator ja/nein
    if (!isNull _operator) then 
	{
        _text = format["%1 (%2)", _vehName, name _operator];
    } 
	else 
	{
		_text = format["%1 (---)", _vehName];
    };
						
	private _index = GVAR(markerPool) find _unit;

	[OPTSETMARKERTEXT, [(GVAR(markerIDPool) select _index),_text]] call CFUNC(localEvent);		
	
};

//Marker Text Revive
DFUNC(markerTextRevive) = 
{
	params 
	[
		["_unit",nil]
	];

	//Spieler mit Revive Status
	private _unit = playableUnits;
	private _spielerPoolRevive = [];
	private _spielerRevive = [];

	private _spielerPoolRevive = [_unit] call FUNC(spielerPoolRevive);

	_spielerPoolRevive apply 
	{ 
		if ((GVAR(markerPool) find _x) > -1) then
		{
			_spielerRevive pushBack _x;
		};
	};

	//Spieler mit Revive Status Marker Text und Symbol ändern
	_spielerRevive apply 
	{ 
		_text = format["%1 wurde getötet", name _x];		
				
		private _index = GVAR(markerPool) find _x;

		[OPTSETMARKERTEXT, [(GVAR(markerIDPool) select _index),_text]] call CFUNC(localEvent);

		[OPTSETMARKERICON, [(GVAR(markerIDPool) select _index),"loc_Hospital"]] call CFUNC(localEvent);			

	};

};	

//Marker Text zurücksetzen 
DFUNC(markerTextReset) = 
{
	params 
	[
		["_unit",nil]
	];

	private _spielerAddEH = [];

	//Spieler mit Revive Status
	private _spielerPoolAdd = [_unit] call FUNC(spielerPoolLeben);

	_spielerPoolAdd apply 
	{ 
		if ((GVAR(markerPool) find _x) isEqualTo -1) then
		{
			_spielerAddEH pushBack _x;
		};
	};

	//Spieler Marker Text und Symbol auf Standart ändern
	GVAR(markerPool) apply 
	{ 
		_text = format["%1", name _x];		
				
		private _index = GVAR(markerPool) find _x;

		[OPTSETMARKERTEXT, [(GVAR(markerIDPool) select _index),_text]] call CFUNC(localEvent);

		[OPTSETMARKERICON, [(GVAR(markerIDPool) select _index),"mil_triangle"]] call CFUNC(localEvent);			

	};
		
};	

//Init GPS System
["missionStarted", 
{
	//Speicher Marker und Einheiten
	GVAR(markerPool) = [];

	private _units = playableUnits;

	GVAR(markerPool) = [_units] call FUNC(spielerPoolLeben);

	_id = [GVAR(markerPool),0] call FUNC(addMarker);

	GVAR(markerIDPool) pushBack _id;

	[GVAR(markerPool)] call FUNC(addEH);

	onPlayerConnected "[] call FUNC(updateMarkerPool);";

}, []] call CFUNC(addEventHandler); 

