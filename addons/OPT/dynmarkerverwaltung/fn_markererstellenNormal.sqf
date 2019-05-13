/**
* Erstellten von normalen Markern im Overlay
* 
* Autor: [GNC]Lord-MDB
*
* Argumente:
* 0: <STRING> _ID (Markername des erstellten Marker)
* 1: <STRING> _type (Art des erstellten Markers:Spieler,Revive,Heli,Flugzeuge,Panzer,Fallschirm)
* 2: <ARRAY> _farbe (Farbe in RGB Code)
* 3: <STRING> _text (Bezeichnung des Marker)
* 4: <Number> _sichtbarkeit (Sichtbarkeit des Maker auf der Karte: 0-1)
* 5: <ARRAY> _position (Position in [x,y,z])
* 6: <Number> _winkel (Winkel in Grad)
*
* Rückgabewert:
* 0: <STRING> _ID (Markername des erstellten Marker)
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
* [] call EFUNC(dynmarkerverwaltung,markererstellenNormal);
* Beispiel interner Aufruf:
* [] call FUNC(markererstellenNormal);
*
*/

#include "macros.hpp"

(_this select 0) params
					
[
	["_id",""],
	["_type",""],
	["_farbe",[]],
	["_text",""],
	["_sichtbarkeit",1],
	["_position",[]],
	["_winkel",0]
];

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

[_id, [_marker]] call CFUNC(addMapGraphicsGroup);

_id