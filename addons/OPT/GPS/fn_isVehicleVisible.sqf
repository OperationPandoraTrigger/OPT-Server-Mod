/**
* Beschreibung:
* Prüft, ob ein Fahrzeug für den Spieler auf der Karte sichtbar ist
* 
* Autor: 
* Senshi
*
* Argumente:
* 0: <OBJECT> _unit Zu prüfendes Vehicle
*
* Rückgabewert:
* 0: <BOOL> True, wenn sichtbar, sonst false
*
* Server Only:
* Nein
* 
* Global:
* Nein
* 
* API:
* Nein
* 
* Beispiel:
* _isVisible = [_unit] call FUNC(isVehicleVisible);
*/

#include "macros.hpp";

params ["_veh"];

!isNull _veh 
&& {
	damage _veh < 1 // Don't show destroyed
	&& { alive _x} count crew _veh > 1 // Don't show empty
	&& side group (crew _vehicle) select 0 == side group CLib_Player // Don't show hostile
}
// Wrapping with {} makes this a lazy eval: If the isNull fails, the other conditions aren't checked.
// Otherwise, all conditions would be checked, even if the first one fails.