/**
* Description:
* Stellt Haftladungen zur verfügung
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

private _unit = player;
private _veh = nil;
private _bomb = nil;
private _pic = "A3\Weapons_F\Data\UI\gear_c4_charge_small_CA.paa";

// Fahrzeug und Bomben ermittlung 
_veh = (nearestObjects[_unit,["car","truck","tank","wheeled_apc"],5]) select 0;
_bomb = (nearestObject [_unit, 'PipeBombBase']);

//check ob Beide nötigen Dinge vorhanden sind
if (isNull _veh) exitWith {Hint format["%1",MLOC(HAFTLADUNGNOVEH)];};
if (isNull _bomb) exitWith {Hint format["%1",MLOC(HAFTLADUNGNOBOMBE)];};

private _start = AGLToASL positionCameraToWorld [0,0,0];
private _end   = AGLToASL positionCameraToWorld [0,0,1];
private _lis = lineIntersectsSurfaces [_start, _end, objNull, objNull, true, -1];
private _intersection = _lis param [0, []] select 0;

private _vDir = _start vectorFromTo _end;
private _position = _intersection vectorAdd (_vDir vectorMultiply +0.55); // 55 cm heran
private _offset = _veh worldToModel ASLToAGL _position;

private _xoffset = (_offset select 0);
private _yoffset = (_offset select 1);
private _zoffset = _offset select 2;

_bomb attachTo [_veh, [_xoffset,_yoffset,_zoffset]];
private _unitdir = getDir _unit;
_bomb setVectorDirAndUp [[0,(cos (getDir _veh + 90)),0],[(cos (getDir _veh - 90 +_unitdir)),(cos (getDir _veh + 90 + _unitdir)),0]];

_pic = "A3\Weapons_F\Data\UI\gear_c4_charge_small_CA.paa";
hint composeText [parseText format ["<t align='left' size='%4'><img image='%3'></t>" +"<t align='center' size='1.25' shadow='true'>%1</t><t align='right' size='%4'><img image='%3'></t>" +"<br/>" +"<t align='center' size='1.0' shadow='true'>%2</t>","C4",MLOC(HAFTLADUNGATTACH),_pic,3.0]];

systemChat format ["%1 | %2 | %3 | %4",_intersection,[_xoffset,_yoffset,_zoffset],_position,_vDir];
