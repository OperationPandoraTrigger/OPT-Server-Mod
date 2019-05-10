/**
* Dynamische Markerverwaltung, erstellen und verwalten der Anforderungen aus den Einzelfunktionen 
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
* Ja
* 
* Beispiel Externer Aufruf:
* [] call EFUNC(dynmarkerverwaltung,clientInit);
* Beispiel interner Aufruf:
* [] call FUNC(clientInit);
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
#define fallschirm_icon "\A3\ui_f\data\map\vehicleicons\iconParachute_ca.paa"

//Dialoge zum Overlay hinzufügen für Darstellung
GVAR(dialogCheck) = 
[
	{
		//OPT Karten-Dialog
		if (!(isNull ((findDisplay 444001) displayCtrl 10007))) then
		{
			((findDisplay 444001) displayCtrl 10007) call CFUNC(registerMapControl);
			[{}, {(isNull ((findDisplay 444001) displayCtrl 10007))}] call CFUNC(waitUntil);	
		};

		//BIS Artillery Dialog
		if (!(isNull ((findDisplay -1) displayCtrl 500))) then
		{
			((findDisplay -1) displayCtrl 500) call CFUNC(registerMapControl);
			[{}, {(isNull ((findDisplay -1) displayCtrl 500))}] call CFUNC(waitUntil);	
		};

		//BIS  UAV Dialog (klappt nicht)
		if (!(isNull ((findDisplay 160) displayCtrl -1))) then
		{
			((findDisplay 160) displayCtrl -1) call CFUNC(registerMapControl);
			[{}, {(isNull ((findDisplay 160) displayCtrl -1))}] call CFUNC(waitUntil);	
		};

	}, 0, []
	
] call CFUNC(addPerFrameHandler);

//alte Marker löschen
DFUNC(markerloeschen) = 
{
	params 
	[
		["_id",""],
	];
	
	_id apply 
	{ 

		[_x] call CFUNC(removeMapGraphicsGroup);

	};	

};

//Initialisierung
["missionStarted", 
{
	GVAR(Marker) = [];

	//Gobalenarray verarbeiten und ausführen
	GVAR(gobalerMarkerArray) = 
	[
		{
			params
			[
				["_params",[]],
				["_nr",0]
			];

			if (count GVAR(Marker) > 0) then  
			{
				[GVAR(Marker)] call FUNC(markerloeschen);
			};	

			if (count _params > 0) then  
			{
				_params apply 
				{ 
					_x params
					[
						["_id",""],
						["_type",""],
						["_farbe",[]],
						["_text",""],
						["_sichtbarkeit",1],
						["_position",[]],
						["_winkel",0]
					];

					private _marker = [];

					switch (_type) do 
					{
						case "Spieler": 
						{
							_marker = ["ICON", player_icon, _farbe, _position, 20, 20, _winkel, _text, _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
						}; 

						case "Revive": 
						{
							_marker = ["ICON", revive_icon, _farbe, _position, 20, 20, _winkel, _text, _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
						}; 

						case "Heli": 
						{
							_marker = ["ICON", heli_icon, _farbe, _position, 20, 20, _winkel, _text, _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
						};  

						case "Flugzeuge": 
						{
							_marker = ["ICON", flug_icon, _farbe, _position, 20, 20, _winkel, _text, _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
						};    

						case "Panzer": 
						{
							_marker = ["ICON", panzer_icon, _farbe, _position, 20, 20, _winkel, _text, _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
						}; 

						case "Fallschirm": 
						{
							_marker = ["ICON", fallschirm_icon, _farbe, _position, 20, 20, _winkel, _text, _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
						};    

						default 
						{
						};
					};	

					// Sammelarray Marker
					GVAR(Marker) pushBack _id;

					[_id, [_marker]] call CFUNC(addMapGraphicsGroup);

				};	

			};	

		}, 0, []
		
	] call CFUNC(addPerFrameHandler);

  	
}, []] call CFUNC(addEventHandler); 


