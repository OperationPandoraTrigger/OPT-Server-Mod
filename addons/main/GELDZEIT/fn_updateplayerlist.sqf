/**
* Author: James, form
* add a new player to the player list that is managed by the server
*
* Arguments:
* 0: <STRING> unique UID of player
* 1: <STRING> name of player
* 2: <SIDE> side of player
* 3: <OBJ> player object
* 4: <BOOL> player is connected
*
* Return Value:
* None
*
* Example:
* [123456789, "James", east, bis_o2_1234, true] call func(updatePlayerList);
*
* Server only:
* yes
*
* Public:
* yes
*/
#include "macros.hpp"

params
[
   ["_uid", "s", ["s"], 1],
   ["_name", "s", ["s"], 1],
   ["_side", sideUnknown, [sideUnknown], 1],
   ["_player", objNull],
   ["_connected", true]
];

if (_uid isEqualTo "" or _name isEqualTo "") exitWith{};

// Finde Spieler in der Liste
private _pos = (GVAR(playerList) apply {_x select 0}) find _uid;

// Spieler ist schon in der Liste -> Update (z.B. nach Seitenwechsel oder Nickchange)
if (_pos != -1) then
{
   GVAR(playerList) set [_pos, [_uid, _name, _side, _player, _connected]];
}
// Spieler ist noch nicht in der Liste -> Add
else
{
   GVAR(playerList) pushBack [_uid, _name, _side, _player, _connected];
};
publicVariable QGVAR(playerList);

// Listen vorfiltern und für alle Clients sichtbar machen (zum durch-iterieren fürs GPS)
// Nur derzeit verbundene Spieler, nach Seite aufgeteilt
GVAR(playerListActiveWEST) = GVAR(playerList) select { (_x select 4) && (_x select 2) == west };
publicVariable QGVAR(playerListActiveWEST);

GVAR(playerListActiveEAST) = GVAR(playerList) select { (_x select 4) && (_x select 2) == east };
publicVariable QGVAR(playerListActiveEAST);

GVAR(playerListActiveGUER) = GVAR(playerList) select { (_x select 4) && (_x select 2) == independent };
publicVariable QGVAR(playerListActiveGUER);
