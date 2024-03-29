/**
* Author: [GNC]Lord-MDB
* Punkte erfassung in der Spielzeit
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call FUNC(punkte);
*
*/
#include "macros.hpp"

//Init
GVAR(csat_points_f) = 0;
GVAR(nato_points_f) = 0;
GVAR(points_logtime) = 0;

if ((round GVAR(flagCountNATO) + round GVAR(flagCountCSAT)) > 1.01) then
{
    GVAR(PointsPerSec) = 0.016667;  // 1 Punkt pro Minute (1 / 60 = 0,0166666666) bei normaler Flaggenanzahl
}
else
{
    GVAR(PointsPerSec) = 0.005952380952381;  // 50 Punkte in 140 Min wenn um nur eine Flagge gespielt wird
};

GVAR(Punktecount) = [
{
    // Logge und übertrage Punktestand, solange Spiel noch läuft
    if ((OPT_GELDZEIT_GAMESTAGE == GAMESTAGE_WAR) and (OPT_GELDZEIT_PLAYTIME - (serverTime - OPT_GELDZEIT_startTime) > 0)) then
    {
        // Falls es einen Dominator gibt -> Erhöhe Punkte +1, ansonsten spätestens alls 60 Sekunden einen Logeintrag
        switch (GVAR(dominator)) do
        {
            case west:
            {
                GVAR(nato_points_f) = GVAR(nato_points_f) + GVAR(PointsPerSec);
                if (round GVAR(nato_points_f) > GVAR(nato_points)) then
                {
                    GVAR(nato_points) = round GVAR(nato_points_f);    // übernahme in bisherige integer-zählweise
                    publicVariable QGVAR(nato_points);
                    GVAR(points_logtime) = serverTime;
                    ["Mission", "State", [GVAR(nato_points), GVAR(csat_points), EGVAR(GELDZEIT,missionName)]] call EFUNC(LOGGING,writelog);
                };
            };

            case east:
            {
                GVAR(csat_points_f) = GVAR(csat_points_f) + GVAR(PointsPerSec);
                if (round GVAR(csat_points_f) > GVAR(csat_points)) then
                {
                    GVAR(csat_points) = round GVAR(csat_points_f);    // übernahme in bisherige integer-zählweise
                    publicVariable QGVAR(csat_points);
                    GVAR(points_logtime) = serverTime;
                    ["Mission", "State", [GVAR(nato_points), GVAR(csat_points), EGVAR(GELDZEIT,missionName)]] call EFUNC(LOGGING,writelog);
                };
            };

            default
            {
                if ((serverTime - GVAR(points_logtime)) >= 60) then // letzter logeintrag > 1 Minute alt? Dann den aktuellen Stand loggen
                {
                    GVAR(points_logtime) = serverTime;
                    ["Mission", "State", [GVAR(nato_points), GVAR(csat_points), EGVAR(GELDZEIT,missionName)]] call EFUNC(LOGGING,writelog);
                };
            };
        };
    };
}, 1] call CFUNC(addPerFrameHandler);
