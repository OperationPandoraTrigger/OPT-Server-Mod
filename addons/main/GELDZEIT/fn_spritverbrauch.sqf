/**
* Description:
* Erhöht den Treibstoffverbrauch in abhängigkeit der Höhe
* 
* Author: Lord-MDB
* 
* Arguments:
* none
*
* Return Value:
* None
*
*
* Server only:
* no
*
* Global:
* no
* 
* Public:
* no
*
* Example:
* [Veh] call func(spritverbrauch);
*/
#include "macros.hpp"

params 
[
    ["_veh", objNull]
];

[{

    params ["_veh", "_handle"];   

    // Flughöhe erfassen
    private _hohe = position _veh select 2;

    // Kontrolle ob Objekt über der Null Höhe sich bewegt.
    if (_hohe > GVAR(flughohenull)) then 
    {
        // Vorhandener Treibstoff
        private Treibstoffmenge = fuel _veh;

        // Verbrauchsberechnung pro 1sek
        // Formel Fuel-Verbrauchswert
        // Verbrauchtwert (((Flughöhe-Nullhöhe)/Nullhöhe)*0.55)/Verbrauchsfaktor
        private Treibstoffmengeneu = Treibstoffmenge-((((_hohe-GVAR(flughohenull))/GVAR(flughohenull))*0.55)/GVAR(verbrauchsfaktor));       

        _veh  setFuel Treibstoffmengeneu;
    };    

    // PFH löschen wenn Objekt zerstört wurde.
    if (! alive _veh) then 
    {

        _handle call CFUNC(removePerframeHandler);
    };

}, 1,[_veh]] call CFUNC(addPerFrameHandler);

