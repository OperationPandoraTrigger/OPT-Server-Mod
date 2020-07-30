/**
* Author: James
* handle taken weapon according to player class
*
* Arguments:
*   unit: Object - Unit to which the event handler is assigned
*   container: Object - The container from which the item was taken (vehicle, box, etc.)
*   item: String - The class name of the taken item
*
* Return Value:
* None
*
* Example:
* [unit, container, item] call func(weaponCheck);
*
*/
#include "macros.hpp"

params ["_unit", "_container","_item"];
private _typeOfPlayer = typeOf _unit;
private _bad_item_used = false;

// check SMG
if !(_typeOfPlayer in (GVAR(pilots) + GVAR(crew))) then 
{
    {
        if (_x in GVAR(SMG)) then 
        {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check Light launcher
if !(_typeOfPlayer in GVAR(Lightrocketmen)) then 
{
    {
        if (_x in GVAR(lightlaunchers)) then 
        {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check Heavy launcher
if !(_typeOfPlayer in GVAR(Heavyrocketmen)) then 
{
    {
        if (_x in GVAR(Heavylaunchers)) then 
        {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check AA launcher
if !(_typeOfPlayer in GVAR(AArocketmen)) then 
{
    {
        if (_x in GVAR(AAlaunchers)) then 
        {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check recon Sniper
if !(_typeOfPlayer in GVAR(reconSnipers)) then 
{
    {
        if (_x in GVAR(reconSniperRifles)) then 
        {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check sniper
if !(_typeOfPlayer in GVAR(snipers)) then 
{
    {
        if (_x in GVAR(sniperRifles)) then 
        {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check DMR Sniper
if !(_typeOfPlayer in GVAR(DMRsnipers)) then 
{
    {
        if (_x in GVAR(DMRsniperRifles)) then 
        {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check MG
if !(_typeOfPlayer in GVAR(soldatMG)) then 
{
    {
        if (_x in GVAR(MG)) then 
        {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check LMG
if !(_typeOfPlayer in GVAR(soldatLMG)) then 
{
    {
        if (_x in GVAR(LMG)) then 
        {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check recon
if !(_typeOfPlayer in GVAR(recon)) then 
{
    {
        if (_x in GVAR(reconRifles)) then 
        {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check grenade launcher
if !(_typeOfPlayer in GVAR(grenadiers)) then 
{
    {
        if (_x in GVAR(grenadelaunchers)) then 
        {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check Minenscanner
if !(_typeOfPlayer in GVAR(pioniers)) then 
{
    {
        _unit unassignItem _x; 
        _unit removeItems _x
    } forEach ["MineDetector"];
};

// check medic item
if !(_typeOfPlayer in GVAR(medic)) then 
{
    {
        _unit removeItems _x;
    } forEach ["Medikit"]; 
};

if (_bad_item_used) then 
{
    private _txt = "Waffe unzulässig für aktuelle Spielerklasse.\n\n Waffe wurde entfernt.";
    private _header = parseText "<t size='2.0' color='#D7DF01'>Regelverstoß</t>";
    hint Format ["%1 \n\n %2",_header,_txt];
};