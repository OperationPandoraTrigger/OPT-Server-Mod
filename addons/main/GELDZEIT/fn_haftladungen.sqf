/**
* Description:
* Stellt Haftladungen zur Verfügung
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
* [] call func(haftladungen);
*/
#include "macros.hpp"

params ["_target", "_caller", "_actionId", "_arguments"];

private _pic = "A3\Weapons_F\Data\UI\gear_c4_charge_small_CA.paa";
private _bomb = nearestObject [_target, 'PipeBombBase'];

// Roherfassung Objekt
private _start = AGLToASL positionCameraToWorld [0, 0, 0];
private _end = AGLToASL positionCameraToWorld [0, 0, 10];
private _lis = lineIntersectsSurfaces [_start, _end, player, objNull, true, -1];
private _intersection = _lis param [0, []] select 0;

// Check ob Fahrzeug gefunden wurde
if (isNil "_intersection" || _intersection isEqualTo []) exitWith {hint format["%1",MLOC(HAFTLADUNGNOVEH)];};

// Netto Position des Fahrzeugs
private _vDir = _start vectorFromTo _end;
private _position = _intersection vectorAdd (_vDir vectorMultiply + (0.9 * abs(cos(getDir _target + 90)))); // 90 cm abstand
private _offset = _target worldToModel ASLToAGL _position;

private _xoffset = _offset select 0;
private _yoffset = _offset select 1;
private _zoffset = _offset select 2;

// Anheften der Sprengladung mit Offset
_bomb attachTo [_target, [_xoffset, _yoffset, _zoffset]];

// Ausrichten der Sprengladung
private _unitdir = getDir player;
_bomb setVectorDirAndUp [[0, (cos(getDir _target + 90)), 0], [(cos(getDir _target - 90 + _unitdir)), (cos(getDir _target + 90 + _unitdir)), 0]];

// Ausgabe an den Spieler
_pic = "A3\Weapons_F\Data\UI\gear_c4_charge_small_CA.paa";
hint composeText [parseText format ["<t align='left' size='%4'><img image='%3'></t>" +"<t align='center' size='1.25' shadow='true'>%1</t><t align='right' size='%4'><img image='%3'></t>" +"<br/>" +"<t align='center' size='1.0' shadow='true'>%2</t>","C4",MLOC(HAFTLADUNGATTACH),_pic,3.0]];
