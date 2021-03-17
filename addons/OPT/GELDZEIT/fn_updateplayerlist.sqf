/**
* Author: James
* add a new player to the player list that is managed by the server
*
* Arguments:
* 0: <STRING> unique UID of player
* 1: <STRING> name of player 
* 2: <SIDE> side of player 
*
* Return Value:
* None
*
* Example:
* [123456789, "James", east] call func(updatePlayerList);
*
* Server only:
* yes
*
* Public:
* yes
*/
#include "macros.hpp"

params [
   ["_uid", "s", ["s"], 1],
   ["_name", "s", ["s"], 1],
   ["_side", sideUnknown, [sideUnknown], 1]
];

if (_uid isEqualTo "" or _name isEqualTo "") exitWith{};

// Finde Spieler in der Liste
private _pos = (GVAR(playerList) apply {_x select 0}) find _uid;

// Spieler ist schon in der Liste -> Update (z.B. nach Seitenwechsel oder Nickchange)
if (_pos != -1) then
{
   GVAR(playerList) set [_pos, [_uid, _name, _side]];
}
// Spieler ist noch nicht in der Liste -> Add
else
{
   GVAR(playerList) pushBack [_uid, _name, _side];
};
