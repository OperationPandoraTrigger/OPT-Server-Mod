/**
* Kurzbeschreibung über das Script 
* 
* Autor: Name des Script erstellers 
*
* Übergebende Variablen:
* Pro Zeile Variablen angeben mit <TYPE> 
* Leer lassen wenn keine Variablen übergeben werden
*
* bsp:
* Übergebende Variablen:
* 0: <OBJECT>   _veh
* 1: <SIDE>     _side
* 2: <ARRAY>    _weapons
* 3: <BOOLEAN>  _buy
* 4: <NUMBER>   _preis
* 5: <STRING>   _displayName
*
* Rückgabe Variablen:
* Variablen angeben mit <TYPE> 
* Leer lassen wenn keine Variablen übergeben werden
*
* Server Allein:
* Ja/Nein Wenn ja und es bestehen Einflüsse auf andere Scripte hier kurz beschreiben.
* 
* Lokal:
* Ja/Nein Wenn Nein und es bestehen Einflüsse auf andere Scripte hier kurz beschreiben.
* 
* Global:
* Ja/Nein Wenn ja die Asuwirkungen auf die anderen Clients kurz beschreiben.
* 
* Beispiel Externe aufruf:
* <Rückgabe Variablen> = [<Übergebende Variablen>] call EFUNC(Modul,Funktion);
* Beispiel interner aufruf:
* <Rückgabe Variablen> = [<Übergebende Variablen>] call FUNC(Funktion);
*
*/

#include "macros.hpp"

diag_log "Successfully loaded the OPT/GPS module on the client";
