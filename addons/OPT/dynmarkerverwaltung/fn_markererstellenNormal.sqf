/**
* Erstellen von normalen Markern im Overlay
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

#include "Texturen.sqf"

private _marker = [];

switch (_type) do 
{
	case "Spieler": 
	{
		_marker = ["ICON", PLAYER_ICON, _farbe, _position, 20, 20, _winkel, _text, _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
	}; 

	case "Revive": 
	{
		_marker = ["ICON", REVIVE_ICON, _farbe, _position, 20, 20, _winkel, _text, _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
	}; 

	case "Heli": 
	{
		_marker = ["ICON", HELI_ICON, _farbe, _position, 20, 20, _winkel, _text, _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
	};  

	case "Flugzeuge": 
	{
		_marker = ["ICON", FLUG_ICON, _farbe, _position, 20, 20, _winkel, _text, _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
	};    

	case "Panzer": 
	{
		_marker = ["ICON", PANZER_ICON, _farbe, _position, 20, 20, _winkel, _text, _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
	}; 

	case "Fallschirm": 
	{
	_marker = ["ICON", FALLSCHIRM_ICON, _farbe, _position, 20, 20, _winkel, _text, _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
	};    

	default 
	{
	};
};	

[_id, [_marker]] call CFUNC(addMapGraphicsGroup);

nil
