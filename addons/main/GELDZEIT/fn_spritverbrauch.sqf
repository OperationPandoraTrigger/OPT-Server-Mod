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

if (_veh isKindOf "Helicopter") then
{

    //Helikopter Verbrauch
    [{
        params ["_veh", "_handle"];

        // Flughöhe erfassen
        private _hohe = position _veh select 2;

        // Kontrolle ob Objekt über der Null Höhe sich bewegt.
        if (isEngineOn _veh && _hohe > GVAR(helibasisflughohe)) then
        {
            // Verbrauchsberechnung pro 1sek
            // Formel Fuel-Verbrauchswert
            // Verbrauchtwert (((Flughöhe-basisflughohe)/basisflughohe)*Treibstofffaktor*(Verbraucsfaktor/100))
            _veh setFuel (fuel _veh) - ((((_hohe - GVAR(helibasisflughohe)) / GVAR(helibasisflughohe)) * 0.0055) * (GVAR(heliverbrauchsfaktor) / 100));
        };

        // Erfassung KI Drohnen
        if (typeOf _veh in EGVAR(SHOP,uavs)) then
        {
            // PFH löschen wenn Objekt zerstört wurde
            if (!alive _veh) then
            {
                _handle call CFUNC(removePerframeHandler);
            };
        }
        else
        {
            // PFH löschen wenn Objekt zerstört wurde.
            // oder Pilot aussteigt aus dem Flugzeug
            if ((!alive _veh) || (vehicle player isEqualTo player)) then
            {
                _handle call CFUNC(removePerframeHandler);
            };
        };
    }, 1, _veh] call CFUNC(addPerFrameHandler);
}
else
{
    //Flugzeug Verbrauch
    [{
        params ["_veh", "_handle"];

        // Flughöhe erfassen
        private _hohe = position _veh select 2;

        // Kontrolle ob Objekt über der Null Höhe sich bewegt.
        if (isEngineOn _veh && _hohe > GVAR(flugzeugbasisflughohe)) then
        {
            // Verbrauchsberechnung pro 1sek
            // Formel Fuel-Verbrauchswert
            // Verbrauchtwert (((Flughöhe-basisflughohe)/basisflughohe)*Treibstofffaktor*(Verbraucsfaktor/100))
            _veh setFuel (fuel _veh) - ((((_hohe - GVAR(flugzeugbasisflughohe)) / GVAR(flugzeugbasisflughohe)) * 0.0055) * (GVAR(flugzeugverbrauchsfaktor) / 100));
        };

        // Erfassung KI Drohnen
        if (typeOf _veh in EGVAR(SHOP,uavs)) then
        {   
            // PFH löschen wenn Objekt zerstört wurde.
            if (!alive _veh) then
            {
                _handle call CFUNC(removePerframeHandler);
            };
        }
        else
        {
            // PFH löschen wenn Objekt zerstört wurde.
            // oder Pilot aussteigt aus dem Flugzeug
            if ((!alive _veh) || (vehicle player isEqualTo player)) then
            {
                _handle call CFUNC(removePerframeHandler);
            };
        };
    }, 1, _veh] call CFUNC(addPerFrameHandler);
};
