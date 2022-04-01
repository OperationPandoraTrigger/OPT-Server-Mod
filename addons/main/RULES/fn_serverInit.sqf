/**
* Description:
* Initialisierung Rules System (Serverside)
*
* Author:
* form
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
* [] call FUNC(serverInit);
*/
#include "macros.hpp"

// Wie oft (in Sekunden) wird die Position geprüft
#define INTERVAL_DISTANCE_CHECK 15

["missionStarted",
{
    if (!(OPT_SECTORCONTROL_trainingon)) then
    {
        [{
            // Regelmäßig checken ob sich UAVs in einem verbotenen Bereich in der nähe einer feindlichen Basis aufhalten
            {
                private _side = side group _x;
                if (
                    (_side == east && (_x inArea "NATO_T_Zone1" || _x inArea "NATO_T_Zone2")) ||
                    (_side == west && (_x inArea "CSAT_T_Zone1" || _x inArea "CSAT_T_Zone2"))
                ) then
                {
                    private _operator = (UAVControl _x) select 0;
                    if (!isNull _operator) then
                    {
                        ["Cheat", "KillZone", [getPlayerUID _operator, name _operator, _side, position _x, typeOf _x]] call EFUNC(LOGGING,writelog);
                    }
                    else
                    {
                        ["Cheat", "KillZone", [0, "UAV", _side, position _x, typeOf _x]] call EFUNC(LOGGING,writelog);
                    };
                    _x setDamage 1;
                    {hint format ["%1", MLOC(UAV_BASE_DISTANCE)];} remoteExec ["call", -2];
                };
            } forEach allUnitsUAV;
        }, INTERVAL_DISTANCE_CHECK] call CFUNC(addPerFrameHandler);
    };  // if (!(OPT_SECTORCONTROL_trainingon))
}] call CFUNC(addEventhandler);
