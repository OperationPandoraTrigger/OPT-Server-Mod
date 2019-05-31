/**
* Funktion zum erstellen eines Markers
* 
* Autor: [GNC]Lord-MDB
*
* Argumente:
* 0: <ARRAY> _startPosition (Start Position des erstellten Marker)
* 1: <STRING> _prioritaet (realtime|normal,Prioritätsangabe für Aktuellsierung in der Tracking Funktion)
* 2: <Objekt> _trackingobjekt (Objekt für die Aktuellsierung des Markers)
* 3: <STRING> _text (Overlay Textanzeige des Markes)
* 4: <STRING> _icon (Texturverweis für Markersymbol)
* 5: <Number> _winkel (Ausrichtung des Markers im Overlay)
* 6: <ARRAY> _farbe (Farbe des Markers in RGB Code)
* 7: <Number> _sichtbarkeit (Sichtbarkeit des Maker auf der Karte: 0-1)
* 8: <Number> _ebene (Ebene des Maker auf der Karte: 0-1)
* 9: <Number> _schriftgroesse (_Schriftgroeße des Maker auf der Karte: 0-50)
*10: <STRING> _schritart (Schritart Overlay Textanzeige des Markes)
*
* Rückgabewert:
* 0: <Number> _markerID (Marker-ID des erstellten Markers)
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
* ja
* 
* Beispiel Externer Aufruf:
* _markerID = [[_startPosition],"_prioritaet",_trackingobjekt,"_text","_icon",_winkel,[_farbe],_sichtbarkeit,_ebene,_schriftgroeße,"_schritart"] call OFUNC(addMarker);
* Beispiel interner Aufruf:
* _markerID = [[_startPosition],"_prioritaet",_trackingobjekt,"_text","_icon",_winkel,[_farbe],_sichtbarkeit,_ebene,_schriftgroeße,"_schritart"] call OFUNC(addMarker);
*
*/

#include "macros.hpp"

params
					
[
	["_startPosition",[0,0,0]],
	["_prioritaet","normal"],
	["_trackingobjekt",nil],
	["_text",""],
	["_icon","\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa"],
	["_winkel",0],
	["_farbe",[1,1,1,1]],
	["_sichtbarkeit",1],
	["_ebene",1],
	["_schriftgroesse",0.08],
	["_schritart","RobotoCondensed"]
];

//Assertions
ASSERT_IS_ARRAY(_startPosition);
ASSERT_IS_STRING(_prioritaet);
ASSERT_IS_OBJECT(_trackingobjekt);
ASSERT_IS_STRING(_text);
ASSERT_IS_STRING(_icon);
ASSERT_IS_NUMBER(_winkel);
ASSERT_IS_ARRAY(_farbe);
ASSERT_IS_NUMBER(_sichtbarkeit);
ASSERT_IS_NUMBER(_ebene);
ASSERT_IS_NUMBER(_schriftgroesse);
ASSERT_IS_STRING(_schritart);

//Datenblock für Markererstellung
private _markerdata = ["ICON", _icon, _farbe, _startPosition, 20, 20, _winkel, _text, _sichtbarkeit, _schriftgroesse, _schritart, "right"];	

//Marker Name erstellen
private _markerNamen = format ["OPTMarker%1",GVAR(idMarkerConuter)];

//Marker erstellen mit Clib
//[_markerNamen, [_markerdata]] call CFUNC(addMapGraphicsGroup);
//BIS Marker
private _marker = createMarkerLocal [_markerNamen, _startPosition];
_marker setMarkerTypeLocal _icon;
_marker setMarkerColorLocal "ColorBlack";
_marker setMarkerSizeLocal [0.8, 0.8];
_marker setMarkerAlphaLocal _sichtbarkeit;
_marker setMarkerTextLocal format["%1",_text];
	
private _prioritaetzeit = 0;

switch (_prioritaet) do 
{
	case "normal": 
	{
		_prioritaetzeit = 0,04;
	}; 

	case "realtime": 
	{
		_prioritaetzeit = 0;
	};    

	default 
	{
		_prioritaetzeit = 0,04;
		ERROR_LOG("Fehlerhafte Priorität angegeben, Standart normal Priorität ausgewählt");
	};

};

//Erstellen Marker im System Speichern
GVAR(markerDatenArray) pushBack [_prioritaetzeit,_trackingobjekt];

GVAR(markerIDArray) pushBack GVAR(idMarkerConuter);

//Rückgabewert
_markerID = GVAR(idMarkerConuter);

//Markerzähler
GVAR(idMarkerConuter) = GVAR(idMarkerConuter) + 1;

_markerID
