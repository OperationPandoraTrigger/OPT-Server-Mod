/**
* Author: James
* log destroyed vehicle with detailed information
*
* Arguments:
* 0: <OBJECT> - Object the event handler is assigned to
* 1: <OBJECT> - Object that killed the unit. Contains the unit itself in case of collisions
* 2: <OBJECT> - Person who pulled the trigger
* 3: <BOOL> - same as useEffects in setDamage alt syntax
*
* Return Value:
* None
*
* Example:
* [car, killer, instigator] call Func(handleDeadVehicle);
*
*/
#include "macros.hpp"

// rewrite into killed and damagged EH so we have the source parameter available
params
[
    ["_vec", objNull, [objNull], 1],
    ["_source", objNull, [objNull], 1],
    ["_instigator", objNull, [objNull], 1],
    "_useEffects"
];

// log destroyed vehicle and killer
[_vec, _instigator, _source] call FUNC(writeKill);

//Loging Besatzung bei HEli Abschuss
//Heli abschusse werden sonst nicht dem AA gut geschrieben. 
if (_vec isKindOf "Air") then 
{
    (crew _vec) apply 
    {
        [_x, _instigator, _source] remoteExecCall ["OPT_SHOP_fnc_writeKill", 2, false];
    };
 };   

// delete all wrecks within the base safezone
switch OPT_GELDZEIT_Fraktionauswahl do 
{
        case "AAFvsCSAT":
        {
            if (!(_vec isKindOf "CAManBase") and ((_vec distance2D (getmarkerPos "respawn_guerrila") < 200) or (_vec distance2D (getmarkerPos "respawn_east") < 200) or (_vec distance2D (getmarkerPos "Marker_CSAT_Basis2") < 200) or (_vec distance2D (getmarkerPos "Marker_AAF_Basis2") < 200))) then 
            {
                [_vec] call 
                {
                    params ["_vec"];
                    deleteVehicle _vec;

                    // message only for those within a 200m radius
                    _name = getText(configFile >> "CfgVehicles" >> typeOf _vec >> "displayName");
                    _txt = format["Es gab einen Unfall in der Basis.\n\n Das Wrack von %1 wurde entsorgt.", _name];
                    [_txt] remoteExecCall ["hint", playableUnits select {_x distance _vec < 200}, false];
                };
            };     
        };

        case "NATOvsCSAT":
        {
            if (!(_vec isKindOf "CAManBase") and ((_vec distance2D (getmarkerPos "respawn_west") < 200) or (_vec distance2D (getmarkerPos "respawn_east") < 200) or (_vec distance2D (getmarkerPos "Marker_CSAT_Basis2") < 200) or (_vec distance2D (getmarkerPos "Marker_NATO_Basis2") < 200))) then 
            {
                [_vec] call 
                {
                    params ["_vec"];
                    deleteVehicle _vec;

                    // message only for those within a 200m radius
                    _name = getText(configFile >> "CfgVehicles" >> typeOf _vec >> "displayName");
                    _txt = format["Es gab einen Unfall in der Basis.\n\n Das Wrack von %1 wurde entsorgt.", _name];
                    [_txt] remoteExecCall ["hint", playableUnits select {_x distance _vec < 200}, false];
                };
            };
        };

        case "NATOvsAAF":
        {
            if (!(_vec isKindOf "CAManBase") and ((_vec distance2D (getmarkerPos "respawn_west") < 200) or (_vec distance2D (getmarkerPos "respawn_guerrila") < 200) or (_vec distance2D (getmarkerPos "Marker_NATO_Basis2") < 200) or (_vec distance2D (getmarkerPos "Marker_AAF_Basis2") < 200))) then 
            {
                [_vec] call 
                {
                    params ["_vec"];
                    deleteVehicle _vec;

                    // message only for those within a 200m radius
                    _name = getText(configFile >> "CfgVehicles" >> typeOf _vec >> "displayName");
                    _txt = format["Es gab einen Unfall in der Basis.\n\n Das Wrack von %1 wurde entsorgt.", _name];
                    [_txt] remoteExecCall ["hint", playableUnits select {_x distance _vec < 200}, false];
                };
            };       
        };

           default 
        {
            ERROR_LOG("handleDeadVehicle: Fehlerhafte Datenübergabe - Keine Fraktionauswahl erkannt");
        };
};
