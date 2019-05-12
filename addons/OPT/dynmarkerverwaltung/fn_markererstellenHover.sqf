/**
* Erstellten von Hover Markern im Overlay
* 
* Autor: [GNC]Lord-MDB
*
* Argumente:
* 0: <STRING> _ID (Markername des Erstellten Marker)
* 1: <STRING> _type (Art des erstellen Markers:Spieler,Revive,Heli,Flugzeuge,Panzer,Fallschirm)
* 2: <ARRAY> _farbe (Farbe in RGB Code)
* 3: <STRING> _text (Bezeichnung des Marker)
* 4: <Number> _sichtbarkeit (Sichtbarkeit des Maker auf der Karte: 0-1)
* 5: <ARRAY> _position (Position in [x,y,z])
* 6: <Number> _winkel (Winkel in Grad)
* 7: <STRING> _textHover (Hover Text Anzeige)
*
* Rückgabewert:
* 0: <STRING> _ID (Markername des Erstellten Marker)
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
* [] call EFUNC(dynmarkerverwaltung,markererstellenHover);
* Beispiel interner Aufruf:
* [] call FUNC(markererstellenHover);
*
*/

#include "macros.hpp"


params
					
[
	["_id",""],
	["_type",""],
	["_farbe",[]],
	["_text",""],
	["_sichtbarkeit",1],
	["_position",[]],
	["_winkel",0],
	["_textHover",""]
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
private _manDescription = [];

switch (_type) do 
{
	case "Spieler": 
	{
		_marker = ["ICON", player_icon, _farbe, _position, 20, 20, _winkel, _text, _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
		_manDescription = ["ICON", player_icon, _farbe, _position, 20, 20, _winkel, format ["%1 : %2",_text,_textHover], _sichtbarkeit, 0.08, "RobotoCondensed", "right"];		
	}; 

	case "Revive": 
	{
		_marker = ["ICON", revive_icon, _farbe, _position, 20, 20, _winkel, _text, _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
		_manDescription = ["ICON", revive_icon, _farbe, _position, 20, 20, _winkel, format ["%1 : %2",_text,_textHover], _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
	}; 

	case "Heli": 
	{
		_marker = ["ICON", heli_icon, _farbe, _position, 20, 20, _winkel, _text, _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
		_manDescription = ["ICON", heli_icon, _farbe, _position, 20, 20, _winkel, format ["%1 : %2",_text,_textHover], _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
	};  

	case "Flugzeuge": 
	{
		_marker = ["ICON", flug_icon, _farbe, _position, 20, 20, _winkel, _text, _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
		_manDescription = ["ICON", flug_icon, _farbe, _position, 20, 20, _winkel, format ["%1 : %2",_text,_textHover], _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	

	};    

	case "Panzer": 
	{
		_marker = ["ICON", panzer_icon, _farbe, _position, 20, 20, _winkel, _text, _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
		_manDescription = ["ICON", panzer_icon, _farbe, _position, 20, 20, _winkel, format ["%1 : %2",_text,_textHover], _sichtbarkeit, 0.08, "RobotoCondensed", "right"];		
	}; 

	case "Fallschirm": 
	{
		_marker = ["ICON", fallschirm_icon, _farbe, _position, 20, 20, _winkel, _text, _sichtbarkeit, 0.08, "RobotoCondensed", "right"];	
		_manDescription = ["ICON", fallschirm_icon, _farbe, _position, 20, 20, _winkel, format ["%1 : %2",_text,_textHover], _sichtbarkeit, 0.08, "RobotoCondensed", "right"];		
	};    

	default 
	{
	};
};	

[_id, [_marker]] call CFUNC(addMapGraphicsGroup);

[_id, [_marker, _marker, _manDescription], "hover"] call CFUNC(addMapGraphicsGroup);

_id