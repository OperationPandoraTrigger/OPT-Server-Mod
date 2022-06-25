/**
* Description:
* Dymamische Sichtweite in Festgelegten bereichen
*
* Author:
* Lord-MDB
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* No
*
* Public:
* No
*
* Global:
* No
* 
* API:
* No
*
* Example:
* [] call FUNC(dynamischesichtweite);
*/
#include "macros.hpp"

// Dynamische Sichtweite bei den CSAT Seebasen 
//Gegenseite kann nur bis zur Sichtlinie das Wasser einsehen

GVAR(userviewdistance) = viewDistance;

[{
    if (True) then
    //if (!(OPT_SECTORCONTROL_trainingon)) then
    {
        if (playerSide == blufor) then
        {
            private _sichtlinearray = [Opforlinie0,Opforlinie1,Opforlinie2,Opforlinie3,Opforlinie4,Opforlinie5,Opforlinie6,Opforlinie7,Opforlinie8,Opforlinie9,Opforlinie10,Opforlinie11,Opforlinie12,Opforlinie13,Opforlinie14,Opforlinie15,Opforlinie16];
            private _sichtwinkelarray = [[90,270],[90,270],[1,270],[1,180],[1,180],[1,180],[1,180],[1,180],[1,235],[45,235],[45,235],[45,235],[45,235],[45,235],[45,235],[45,235],[45,235]];         
            private _userdistance = 0;
            private _userdistancearray = [];
            private _userdistancemin = 0;
            private _userdir = 0;
            private _userdistancearrayindex = 0;
            private _sichtwinkelblock = [];
        
            // Distance erfassen für ermittlung des kleines abstands zu Sichtline
            {
                _userdistance = vehicle Player distance2D _x;
                _userdistancearray pushBack _userdistance;
      
            } forEach _sichtlinearray;

            // Blickwinkel des Spielers
            _userdir = Getdir vehicle Player;
            _userdistancemin = selectMin _userdistancearray;
            _userdistancearrayindex = _userdistancearray findIf {_userdistancemin isEqualTo _x};
            _sichtwinkelblock = _sichtwinkelarray select _userdistancearrayindex;
            
            //systemChat format ["UD:%1 D:%4 X:%2 UDir:%3 I:%5 SWA:%6 ",_userdistancemin,GVAR(userviewdistance),_userdir,viewDistance,_userdistancearrayindex,_sichtwinkelblock]; 

            if ((_userdir > (_sichtwinkelblock select 0)) and (_userdir < (_sichtwinkelblock select 1)) and (_userdistancemin < GVAR(userviewdistance))) then
            {
                setViewDistance _userdistancemin;
            }
            else 
            {
                setViewDistance GVAR(userviewdistance);
            };  
        };         
    };    

}, 1, _this] call CFUNC(addPerFrameHandler);