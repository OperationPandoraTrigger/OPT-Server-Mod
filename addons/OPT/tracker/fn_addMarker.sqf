/**
* Funktion zum erstellen eines Markers
* 
* Autor: [GNC]Lord-MDB
*
* Argumente:
* 0: <ARRAY> _startPosition (Start Position des erstellten Marker)
* 1: <Number> _prioritaet (0 = Realtime|40 = Normal,Zeitangabe für Aktuellsierung in der Tracking Funktion)
* 2: <Objekt> _trackingobjekt (Objekt für die Aktuellsierung des Markers)
* 3: <STRING> _text (Overlay Textanzeige des Markes)
* 4: <ARRAY> _icon (Texturverweis für Markersymbol)
* 5: <Number> _winkel (Ausrichtung des Markers im Overlay)
* 6: <ARRAY> _farbe (Farbe des Markers in RGB Code)
* 7: <Number> _sichtbarkeit (Sichtbarkeit des Maker auf der Karte: 0-1)
* 8: <Number> _ebene (Ebene des Maker auf der Karte: 0-1)
* 9: <Number> _schriftgroeße (_Schriftgroeße des Maker auf der Karte: 0-50)
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
* _markerID = [[_startPosition],_prioritaet,_trackingobjekt,"_text",[_icon],_winkel,[_farbe],_sichtbarkeit,_ebene,_schriftgroeße,"_schritart"] call OFUNC(addMarker);
* Beispiel interner Aufruf:
* _markerID = [[_startPosition],_prioritaet,_trackingobjekt,"_text",[_icon],_winkel,[_farbe],_sichtbarkeit,_ebene,_schriftgroeße,"_schritart"] call OFUNC(addMarker);
*
*/

#include "macros.hpp"

params
					
[
	["_startPosition",[0,0,0]],
	["_prioritaet",40],
	["_trackingobjekt",nil],
	["_text",""],
	["_icon",[]],
	["_winkel",0],
	["_farbe",[1,1,1,1]],
	["_sichtbarkeit",1],
	["_ebene",1],
	["_schriftgroeße",0.08],
	["_schritart","RobotoCondensed"]
];

//Datenblock für Markererstellung
private _markerdata = ["ICON", _icon, _farbe, _startPosition, 20, 20, _winkel, _text, _sichtbarkeit, _schriftgroeße, _schritart, "right"];	

//Marker Name erstellen
private _markerNamen = format ["OPTMarker%1",GVAR(idMarkerConuter)]

//Markerzähler
GVAR(idMarkerConuter) = GVAR(idMarkerConuter) + 1;

//Marker erstellen mit Clib
[_markerNamen, [_markerdata]] call CFUNC(addMapGraphicsGroup);
	
//Erstellen Marker im System Speichern
GVAR(markerDatenArray) pushBack [_prioritaet,_trackingobjekt];

GVAR(markerIDArray) pushBack GVAR(idMarkerConuter);

//Rückgabewert
_markerID = GVAR(idMarkerConuter);

_markerID
