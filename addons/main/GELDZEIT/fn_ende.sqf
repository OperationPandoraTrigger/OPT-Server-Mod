/**
* Description:
* Abschluss der Mission mit Bildschrimanzeige auf dem Client
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
* [] call FUNC(ende);
*/
#include "macros.hpp"

private _text = "";
switch (GVAR(Fraktionauswahl)) do
{
    case "AAFvsCSAT":
    {
        private _points1 = EGVAR(SECTORCONTROL,aaf_points);
        private _points2 = EGVAR(SECTORCONTROL,csat_points);

        // Ermittel Sieger
        if (_points2 != _points1) then
        {
            if (_points2 > _points1) then
            {
                GVAR(csat_win) = 1;
                _text = MLOC(CSAT_WIN);
            }
            else
            {
                GVAR(aaf_win) = 1;
                _text = MLOC(AAF_WIN);
            };
        }
        else
        {
            _text = MLOC(NO_WINNER);
        };
    };

    case "NATOvsCSAT":
    {
        private _points1 = EGVAR(SECTORCONTROL,nato_points);
        private _points2 = EGVAR(SECTORCONTROL,csat_points);

        // Ermittel Sieger
        if (_points2 != _points1) then
        {
            if (_points2 > _points1) then
            {
                GVAR(csat_win) = 1;
                _text = MLOC(CSAT_WIN);
            }
            else
            {
                GVAR(nato_win) = 1;
                _text = MLOC(NATO_WIN);
            };
        }
        else
        {
            _text = MLOC(NO_WINNER);
        };
    };

    case "NATOvsAAF":
    {
        private _points1 = EGVAR(SECTORCONTROL,nato_points);
        private _points2 = EGVAR(SECTORCONTROL,aaf_points);

        // Ermittel Sieger
        if (_points2 != _points1) then
        {
            if (_points2 > _points1) then
            {
                GVAR(aaf_win) = 1;
                _text = MLOC(AAF_WIN);
            }
            else
            {
                GVAR(nato_win) = 1;
                _text = MLOC(NATO_WIN);
            };
        }
        else
        {
            _text = MLOC(NO_WINNER);
        };
    };

    default:
    {
        ERROR_LOG("Missionende: Fehlerhafte Datenuebergabe - Keine Fraktionauswahl erkannt");
    };
};

DFUNC(endscreen) =
{
    removeallweapons player;
    private _Sideidplayer = 0;
    _sideidplayer = playerSide call BIS_fnc_sideID;

    // Auswahl Bildschirmanzeige und Ende der Mission
    private _end = switch (true) do
    {
        case (_sideidplayer == 1 && {GVAR(nato_win) == 1}) : {["END1",true,true]};
        case (_sideidplayer == 1 && {GVAR(csat_win) == 1}) : {["END2",false,true]};
        case (_sideidplayer == 1 && {GVAR(aaf_win) == 1}) : {["END3",false,true]};

        case (_sideidplayer == 0 && {GVAR(nato_win) == 1}) : {["END1",false,true]};
        case (_sideidplayer == 0 && {GVAR(csat_win) == 1}) : {["END2",true,true]};
        case (_sideidplayer == 0 && {GVAR(aaf_win) == 1}) : {["END3",false,true]};

        case (_sideidplayer == 2 && {GVAR(aaf_win) == 1}) : {["END3",true,true]};
        case (_sideidplayer == 2 && {GVAR(csat_win) == 1}) : {["END2",false,true]};
        case (_sideidplayer == 2 && {GVAR(nato_win) == 1}) : {["END1",false,true]};

        default {["END4",true,true]};
    };

    _end spawn BIS_fnc_endMission;

    GVAR(camera) cameraEffect ["terminate", "back"];
    camDestroy GVAR(camera);
};

//End Bildschirm
private _camPos = vehicle player;
GVAR(camera) = "camera" camCreate [(getPos _camPos Select 0), (getPos _camPos Select 1), 50];
GVAR(camera) cameraEffect ["internal", "back"];
GVAR(camera) camSetTarget _camPos;
GVAR(camera) camCommit 1;

showCinemaBorder false;
GVAR(camera) camSetRelPos [0,10,5];
titleText [_text, "PLAIN DOWN",60];
GVAR(camera) camCommit 10;

[FUNC(endscreen), 10,""] call CFUNC(wait);
