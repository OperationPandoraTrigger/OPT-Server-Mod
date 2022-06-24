/**
* Description:
* Initialisierung Geld Zeit System
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
* [] call FUNC(clientInit);
*/
#include "macros.hpp"

//Event Bildschirmanzeige
[
    EVENT_SPIELUHR_ENDBILDSCHIRM,
    {
        [] call FUNC(ende);
    },
    []
] call CFUNC(addEventHandler);

[] call FUNC(playerinit);

["missionStarted",
{
    [getPlayerUID player, profileName, playerSide] remoteExecCall [QFUNC(updatePlayerList), 2, false];

    // TEAM BALANCE - end mission for player if side is full
    // nicht in onPlayerRespawn, da nur zu Missionsbeginn pruefen
    if (!(OPT_SECTORCONTROL_trainingon)) then
    {
        if (isMultiplayer && hasInterface) then
        {
            if (GVAR(TEAMBALANCE) > 0) then
            {
                private _en_pa = if (playerSide == blufor) then {playersNumber opfor} else {playersNumber blufor};

                if ((playersNumber playerSide) > (_en_pa + GVAR(TEAMBALANCE))) then
                {
                    endMission (switch (playerSide) do
                    {
                        case (blufor) : {"balanceBLUFOR"};
                        case (opfor) : {"balanceOPFOR"};
                        default {"LOSER"};
                    });
                };
            };
        };
    };

    // Freeze-Time
    [] call FUNC(frezztime);

// Dynamische Sichtweite bei den CSAT Seebasen 
//Gegenseite kann nur bis zur Sichtlinie das Wasser einsehen
[{
    if (!(OPT_SECTORCONTROL_trainingon)) then
    {
        if (playerSide == blufor) then
        {
           private _userviewdistance = viewDistance;
           private _sichtline = [Opforlinie1,Opforlinie2,Opforlinie3,Opforlinie4,Opforlinie5,Opforlinie6,Opforlinie7,Opforlinie8,Opforlinie9,Opforlinie10,Opforlinie11,Opforlinie12,Opforlinie13,Opforlinie14,Opforlinie15];
           private _userdistance = 0;
           private _userdistancearray = [];
           private _userdistancemin = 0;
           
           {
                _userdistance = Player distance2D _x;
                _userdistancearray pushBack _userdistance;
      
           } forEach _sichtline;
           
           _userdistancemin = selectMin _userdistancearray;
           
           systemChat format ["UD:%1 X:%2 b:%3",_userdistancemin,viewDistance,(_userdistancemin > _userviewdistance)];
           
           if (_userdistancemin > _userviewdistance) then
           {
                setViewDistance -1;
           }
           else 
           {
                setViewDistance _userdistancemin;
           };  

        };         
    };    

}, 1, _this] call CFUNC(addPerFrameHandler);

}] call CFUNC(addEventhandler);
