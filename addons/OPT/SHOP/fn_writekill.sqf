/**
* Author: James
* log kill of a unit(player/client) or vehicle
* function determines if victim or killer were in a vehicle and logs vehicle too
*
* Arguments:
* 0: <OBJECT> unit or vehicle that was killed
* 1: <OBJECT> instigator, unit that pulled the trigger
* 2: <OBJECT> source unit that caused the damage
* 3: <STRING> classname of projectile
*
* Return Value:
* None
*
* Example:
* [player1, player2, vehicle player2, "someMagazine"] call func(writeKill);
*
* Server only:
* yes
*
* Public:
* no
*/
#include "macros.hpp"

/* PARAMS */
params [
    ["_victim", objNull, [objNull], 1],
    ["_instigator", objNull, [objNull], 1], // instigator: Object - Person who pulled the trigger
    ["_source", objNull, [objNull], 1], // The source unit that caused the damage
    ["_projectile", "", ["s"], 1] //  Class name of the projectile that inflicted the damage ("" for unknown, such as falling damage)
];

// Raw-Logging of everything
["Health", "Raw", [netID _victim, getPlayerUID _victim, _victim, netID _instigator, getPlayerUID _instigator, _instigator, netID _source, getPlayerUID _source, _source, _projectile]] call OPT_LOGGING_fnc_writelog;

/* VALIDATION */
if (_victim isEqualTo objNull) exitWith{};
//if ((_instigator isEqualTo objNull) and (_projectile isEqualTo "")) exitWith{};

/* CODE BODY */
private _cat = "Abschuss";
private _message = "";

private _Sideidunit = 3;
private _Side = "unbekannt";

// victim = man?
if (_victim isKindOf "Man") then 
{
    if (isNull _victim) then
    {
        _Sideidunit = 3;
        _name1 = "unbekannt";
        _Side = "unbekannt";
    }
    else
    {
        _Sideidunit = getnumber (configFile >> "CfgVehicles" >> (typeof _victim) >> "side");

        switch (_Sideidunit) do 
        {
            case 0 : 
            {
                _Side = "EAST";
            };

            case 1 : 
            {
                _Side = "WEST";
            };

            case 2 : 
            {
                _Side = "GUER";
            };
            case 3 : 
            {
                _Side = "unbekannt";
            };
        };			
    };

    // base information about victim
    _message = format[
        "Einheit: %1 (side: %2)",
        NAME _victim, _Side
    ];

    // was victim in a vehicle?
    if !(vehicle _victim isEqualTo _victim) then 
    {
        private _name = getText (configFile >> "CfgVehicles" >> typeOf (vehicle _victim) >> "displayName");
        _message = format["%1 (vehicle: %2)", _message, _name];
    };

    // instigator known?
    if !(_instigator isEqualTo objNull) then 
    {
        
        if (_victim isEqualTo _instigator) then 
        {
            _message = format["%1 von: Selbstverschulden.", _message];

        } 
        else 
        {
            
            // base information about instigator
            _message = format["%1 von: %2 (side: %3)", _message, NAME _instigator, SIDE _instigator];

            // source in vehicle or not?
            if !(_source isEqualTo _instigator) then 
            {
                private _name = getText (configFile >> "CfgVehicles" >> typeOf _source >> "displayName");
                _message = format["%1 (vehicle: %2)", _message, _name];
            };

        };

    } 
    else 
    {
        _message = format["%1 von: unbekannt", _message];
        
    };

    // projectile known?
    private _projectileName = "";
    if !(_projectile isEqualTo "") then 
    {
        
        // find display name of magazine
        private _name = "";
        {
            if (getText (_x >> "ammo") isEqualTo _projectile) exitWith 
            {
                // find upmost parent that is not too generic
                private _parent = _x;
                while {!(getText ((inheritsFrom _parent) >> "displayName") isEqualTo "")} do 
                {
                    _parent = inheritsFrom _x;
                };
                _name = getText (_parent >> "displayName");
                _projectileName = _name;

                if !(_name isEqualTo "") then 
                {
                    _message = format["%1 (magazine: %2)", _message, _name];
                };
                
            };  
        
        } forEach ([configFile >> "CfgMagazines", 0, true] call BIS_fnc_returnChildren);
        
    };
    ["Health", "Kill", [getPlayerUID _victim, name _victim, side _victim, getPlayerUID _instigator, name _instigator, side _instigator, _victim distance2D _instigator, _projectileName]] call OPT_LOGGING_fnc_writelog;
} 
else // victim = vehicle!
{
    private _vec = _victim;
    private _category ="";

    private _faction = (getText(configFile >> 'CfgVehicles' >> typeOf _vec >> 'faction'));
    private _name = (getText(configFile >> 'CfgVehicles' >> typeOf _vec >> 'displayName'));
    private _light = (opt_shop_nato_vehicles + opt_shop_csat_vehicles + opt_shop_AAF_vehicles + opt_shop_nato_vehicles_supply + opt_shop_csat_vehicles_supply + opt_shop_AAF_vehicles_supply) apply {toLower (_x select 0)};
    private _heavy = (opt_shop_nato_armored + opt_shop_csat_armored + opt_shop_AAF_armored) apply {toLower (_x select 0)};
    private _air = (opt_shop_nato_choppers + opt_shop_csat_choppers + opt_shop_AAF_choppers) apply {toLower (_x select 0)};
    private _boat = (opt_shop_nato_sea + opt_shop_csat_sea + opt_shop_AAF_sea) apply {toLower (_x select 0)};
    
    _category = if (toLower (typeOf _vec) in _light) then 
    {
        "Leicht"
    } 
    else 
    {
        if (toLower (typeOf _vec) in _heavy) then 
        {
            "Schwer"
        } 
        else 
        {
            if (toLower (typeOf _vec) in _air) then 
            {
                "Flug"
            } 
            else 
            {
                if (toLower (typeOf _vec) in _boat) then 
                {
                    "Boot"
                } 
                else 
                {
                    "Unbekannt"
                }                
            };
        };
    };
    _message = format["Fahrzeug: %1 (category: %2) (side: %3)", _name, _category, _faction];

    // Täter bekannt
    if !(_instigator isEqualTo objNull) then 
    {
        // source is vehicle or player?
        if (_source isEqualTo _instigator) then 
        {
            _message = format["%1 von: %2 (side: %3).", _message, NAME _instigator , SIDE _instigator];
            ["Vehicle", "DestroyByMan", [_name, _category, _faction, netId _victim, getPlayerUID _instigator, name _instigator, side _instigator, _victim distance2D _instigator, _projectile]] call OPT_LOGGING_fnc_writelog;
        } 
        else 
        {
            private _killername = getText (configFile >> "CfgVehicles" >> typeOf _source >> "displayName");
            private _killerTxt = [];
            private _crewArray = [];
            private _separator = toString [9]; // tabulator
            // in case of a vehicle, credit kill to all crew members
            {
                private _unit = _x select 0;
                private _cargoIdx = _x select 2;

                // crew member have cargo index of -1, else > 0
                if (_cargoIdx == -1) then 
                {
                    _killerTxt pushBack format["%1 (side: %2) (vehicle: %3)", NAME _unit, SIDE _unit, _killername];
                    _crewArray pushBack getPlayerUID _unit;
                    _crewArray pushBack name _unit;
                };
            } forEach (fullCrew _source);

            _killerTxt = _killerTxt joinString ", ";
            _message = format[
                "%1 von: %2", _message, _killerTxt
            ];
            ["Vehicle", "DestroyByCrew", [_name, _category, _faction, netId _victim, getText (configFile >> "CfgVehicles" >> typeOf _source >> "displayName"), side _instigator, _victim distance2D _instigator, _crewArray joinString _separator]] call OPT_LOGGING_fnc_writelog;
        };
    } 
    else // Täter nicht bekannt
    {
        // Selbstverschulden?
        if (_vec == _source) then 
        {
            _message = format["%1 von: Selbstverschulden", _message];
            ["Vehicle", "DestroyByAccident", [_name, _category, _faction, netId _victim]] call OPT_LOGGING_fnc_writelog;
        } 
    };

};

// Log
private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;
diag_log format["[%1] (%2) Log: %3 --- %4","OPT", _cat, _timestamp, _message];
