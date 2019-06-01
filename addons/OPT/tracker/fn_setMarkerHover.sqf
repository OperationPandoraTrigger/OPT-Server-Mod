/**
* Funktion zum setzen eines Marker Hovers
* 
* Autor: [GNC]Lord-MDB
*
* Argumente:
* 0: <Number> _markerID (Marker-ID des Markers)
* 1: <ARRAY> _startPosition (Start Position des erstellten Marker)
* 2: <STRING> _textHover (Hovertext der anzeigt wird)
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
* keinen
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
* [_id,[_startPosition],"_textHover","_text","_icon",_winkel,[_farbe],_sichtbarkeit,_ebene,_schriftgroeße,"_schritart"] call OFUNC(setMarkerHover);
* Beispiel interner Aufruf:
* [_id,[_startPosition],"_textHover","_text","_icon",_winkel,[_farbe],_sichtbarkeit,_ebene,_schriftgroeße,"_schritart"] call OFUNC(setMarkerHover);
*
*/

#include "macros.hpp"

params
					
[
	["_markerID",0],
	["_startPosition",[0,0,0]],
	["_textHover",""],
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
ASSERT_IS_NUMBER(_markerID);
ASSERT_IS_ARRAY(_startPosition);
ASSERT_IS_STRING(_textHover);
ASSERT_IS_STRING(_text);
ASSERT_IS_STRING(_icon);
ASSERT_IS_NUMBER(_winkel);
ASSERT_IS_ARRAY(_farbe);
ASSERT_IS_NUMBER(_sichtbarkeit);
ASSERT_IS_NUMBER(_ebene);
ASSERT_IS_NUMBER(_schriftgroesse);
ASSERT_IS_STRING(_schritart);

//Datenblock für Marker Hover erstellung
private _markerdata = ["ICON", _icon, _farbe, _startPosition, 20, 20, _winkel, _text, _sichtbarkeit, _schriftgroesse, _schritart, "right"];	

private _markerDescription = ["ICON", _icon, _farbe, _startPosition, 20, 20, _winkel, format ["%1 : %2",_text,_textHover], _sichtbarkeit, _schriftgroesse, _schritart, "right"];		
	
//Marker Name erstellen
private _markerNamen = format ["OPTMarker%1",_markerID];

//Marker Hover an Clib geben 

//[_markerNamen, [_markerdata, _markerdata, _markerDescription], "hover"] call CFUNC(addMapGraphicsGroup);


