/**
* Prüft, ob eine Einheit für den Spieler auf der Karte sichtbar ist
* 
* Autor: Senshi
*
* Argumente:
* 0: <OBJECT> _unit Zu prüfende Unit
*
* Rückgabewert:
* 0: <BOOL> True, wenn sichtbar, sonst false
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
* Beispiel interner Aufruf:
* _isVisible = [_unit] call FUNC(isUnitVisible);
*
*/

#include "macros.hpp";

params ["_unit"];

!isNull _unit 
&& alive _unit // Only show alive
&& side group _unit == side group CLib_Player // Only show same side
