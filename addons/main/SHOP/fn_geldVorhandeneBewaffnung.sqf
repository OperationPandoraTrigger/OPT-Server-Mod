/**
* Description:
* Funktion Magazine erfassung von Fahrzeug und Geld Berechnung
*
* Author:
* [GNC]Lord-MDB
*
* Arguments:
* 0 <Side> Seite der Ausführung
* 1 <Array> Magazine des Fahrzeugs
*
* Return Value:
* 0 <Number> Geld der Bewaffnung
*
* Server only:
* no
*
* Public:
* no
*
* Global:
* no
*
* Sideeffects:
* no
*
* Example:
*
*/

#include "macros.hpp"

params
[
    "_side",
    "_magazineVehArryNew"
];

private _bewaffnungPreis = 0;
if (_side isEqualTo sideUnknown) exitWith {ERROR_LOG("geldVorhandeneBewaffnung: Fehler bei Seitenübergabe _side");_bewaffnungPreis};

private _vehiclePool = [];
if (_side isEqualTo west) then
{
    _vehiclePool = GVAR(Raktenheliwest) + GVAR(Gunheliwest) + GVAR(Gunvehwest);
}
else
{
    _vehiclePool = GVAR(Raktenhelieast)  + GVAR(Gunhelieast) + GVAR(Gunveheast);
};

switch (_side) do
{
    case west:
    {
        _vehiclePool = GVAR(Raktenheliwest) + GVAR(Gunheliwest) + GVAR(Gunvehwest);
    };

    case east:
    {
        _vehiclePool = GVAR(Raktenhelieast)  + GVAR(Gunhelieast) + GVAR(Gunveheast);
    };

    case independent:
    {
        _vehiclePool = GVAR(Raktenheliindependent)  + GVAR(Gunheliindependent) + GVAR(Gunvehindependent);
    };

    default
    {
    };
};

for "_i" from 1 to (count _vehiclePool) do
{
    {
        private _magazineName = _vehiclePool select (_i - 1) select 0;
        // prüfe alle ausgewählten Magazine und vergleiche mit gewähltem Fahrzeug aus Pool
        // wenn Magazine gefunden, addiere Preis
        if (_magazineName isEqualTo (_x select 0)) then
        {
            private _magazinePrice = _vehiclePool select (_i - 1) select 2;
            _bewaffnungPreis = _bewaffnungPreis + (_magazinePrice * (_x select 1));
        };
    } forEach _magazineVehArryNew;
};

_bewaffnungPreis
