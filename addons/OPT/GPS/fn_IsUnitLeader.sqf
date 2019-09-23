/**
* Prüft, ob eine Einheit der Anführer einer Gruppe ist
* 
* Autor: Senshi
*
* Argumente:
* 0: <OBJECT> _unit Zu prüfende Unit
*
* Rückgabewert:
* 0: <BOOL> True, wenn Leader, sonst false
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
* _isLeader = [_unit] call FUNC(isUnitLeader);
*
*/

#include "macros.hpp";

params ["_unit"];

_unit == leader group _unit;