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

params ["_unit", "_container", "_item"];
private _typeOfPlayer = typeOf _unit;
private _bad_item_used = false;
private "_bad_weapon_used";

// check SMG
if !(_typeOfPlayer in (GVAR(pilots) + GVAR(jetpilots) + GVAR(crew) + GVAR(pioneers))) then
{
    {
        if (_x in GVAR(SMG)) then
        {
            _unit removeWeapon _x;
            _bad_weapon_used = _x;
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
            _bad_weapon_used = _x;
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
            _bad_weapon_used = _x;
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
            _bad_weapon_used = _x;
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
            _bad_weapon_used = _x;
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
            _bad_weapon_used = _x;
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
            _bad_weapon_used = _x;
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
            _bad_weapon_used = _x;
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
            _bad_weapon_used = _x;
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
            _bad_weapon_used = _x;
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
            _bad_weapon_used = _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check Minenscanner
if !(_typeOfPlayer in GVAR(pioneers)) then
{
    {
        _unit unassignItem _x;
        _unit removeItems _x;
        _bad_weapon_used = _x;
    } forEach ["MineDetector"];
};

// check medic item
if !(_typeOfPlayer in GVAR(medic)) then
{
    {
        _unit removeItems _x;
        _bad_weapon_used = _x;
    } forEach ["Medikit"];
};

// check Minen
if !(_typeOfPlayer in GVAR(pioneers)) then
{
    {
        if (_x in GVAR(Sprengmittel)) then
        {
            _unit removeMagazines _x;
            _bad_weapon_used = _x;
            _bad_item_used = true;
        };
    } forEach (magazines _unit);
};

if (_bad_item_used) then
{
    private _txt = MLOC(WEAPON_LOCK);
    private _header = MLOC(RULE_VIOLATION);
    hint format ["%1\n\n%2", _header, _txt];
    ["Cheat", "BadWeapon", [getPlayerUID player, name player, side player, position player, _typeOfPlayer, _bad_weapon_used]] remoteExecCall [QEFUNC(LOGGING,writelog), 2, false];
};
