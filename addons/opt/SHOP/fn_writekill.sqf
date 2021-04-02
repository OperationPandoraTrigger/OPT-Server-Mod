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
params
[
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

// victim = man?
if (_victim isKindOf "Man") then 
{
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

    // Täter bekannt
    if !(_instigator isEqualTo objNull) then 
    {
        // source is vehicle or player?
        if (_source isEqualTo _instigator) then 
        {
            ["Vehicle", "DestroyByMan", [_name, _category, _faction, netId _victim, getPlayerUID _instigator, name _instigator, side _instigator, _victim distance2D _instigator, _projectile]] call OPT_LOGGING_fnc_writelog;
        } 
        else 
        {
            private _crewArray = [];
            private _separator = toString [9]; // tabulator
            // in case of a vehicle, credit kill to all crew members
            {
                private _unit = _x select 0;
                private _cargoIdx = _x select 2;

                // crew member have cargo index of -1, else > 0
                if (_cargoIdx == -1) then 
                {
                    _crewArray pushBack getPlayerUID _unit;
                    _crewArray pushBack name _unit;
                };
            } forEach (fullCrew _source);
            ["Vehicle", "DestroyByCrew", [_name, _category, _faction, netId _victim, getText (configFile >> "CfgVehicles" >> typeOf _source >> "displayName"), side _instigator, _victim distance2D _instigator, _crewArray joinString _separator]] call OPT_LOGGING_fnc_writelog;
        };
    } 
    else // Täter nicht bekannt
    {
        // Selbstverschulden?
        if (_vec == _source) then 
        {
            ["Vehicle", "DestroyByAccident", [_name, _category, _faction, netId _victim]] call OPT_LOGGING_fnc_writelog;
        } 
    };
};
