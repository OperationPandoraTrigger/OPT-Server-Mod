/**
* Description:
* Initialisierung Wetter/Zeit nach Mission-Load
*
* Author:
* form
*
* Arguments:
*
* Return Value:
*
* Server Only:
* Yes
*
* Global:
* Yes
*
* API:
* No
*
* Example:
* [] call FUNC(serverInit);
*/
#include "macros.hpp"

#define TRANSITION_INTERVAL 60    // interval in seconds for framehandler to refresh weather transitions

["missionStarted",
{
    // update mission time
    private _newdate = missionStart select [0,3]; // keep current date from "real life"
    _newdate append [round OPT_WEATHERTIME_timeslider_hours, round OPT_WEATHERTIME_timeslider_minutes];
    [_newdate] remoteExec ["setDate"];

    // update weather conditions (time skip to get clouds in sync)
    skipTime -24;
    86400 setOvercast OPT_WEATHERTIME_weather_overcast;
    forceWeatherChange;
    skipTime 24;
    0 setRain OPT_WEATHERTIME_weather_rain_start;
    0 setFog [OPT_WEATHERTIME_weather_fogValue_start, OPT_WEATHERTIME_weather_fogDecay_start, OPT_WEATHERTIME_weather_fogBase_start];
    forceWeatherChange;

    // Es ist Dunkel zwischen 20 - 04 Uhr.
    // Wenn die Mission ab 18 Uhr startet, ist davon auszugehen das es während einer 2h-Schlacht dunkel wird - Also aktivieren wir leuchtende Objekte
    private _simulation = false;
    if (((round OPT_WEATHERTIME_timeslider_hours) >= 18) || ((round OPT_WEATHERTIME_timeslider_hours) <= 4)) then
    {
        _simulation = true;
    };

    private _nightTypes = ["Land_LampShabby_F"];
    {
        private _objs = allMissionObjects _x;
        {
            _x enableSimulation _simulation;
        } forEach _objs;
    } forEach _nightTypes;
}] call CFUNC(addEventhandler);

// update rain and fog transisions every TRANSITION_INTERVAL seconds
[{
    private _timeElapsed = serverTime - OPT_GELDZEIT_startTime;
    private _missionProgress = _timeElapsed / OPT_GELDZEIT_PLAYTIME;

    // calculate linear transition state from start to end based on mission progress
    private _rain = (OPT_WEATHERTIME_weather_rain_end - OPT_WEATHERTIME_weather_rain_start) * _missionProgress + OPT_WEATHERTIME_weather_rain_start;
    private _fogValue = (OPT_WEATHERTIME_weather_fogValue_end - OPT_WEATHERTIME_weather_fogValue_start) * _missionProgress + OPT_WEATHERTIME_weather_fogValue_start;
    private _fogDecay = (OPT_WEATHERTIME_weather_fogDecay_end - OPT_WEATHERTIME_weather_fogDecay_start) * _missionProgress + OPT_WEATHERTIME_weather_fogDecay_start;
    private _fogBase = (OPT_WEATHERTIME_weather_fogBase_end - OPT_WEATHERTIME_weather_fogBase_start) * _missionProgress + OPT_WEATHERTIME_weather_fogBase_start;

    // update weather
    (TRANSITION_INTERVAL * 0.9) setRain _rain;
    (TRANSITION_INTERVAL * 0.9) setFog [_fogValue, _fogDecay, _fogBase];
    simulWeatherSync;
}, TRANSITION_INTERVAL, _this] call CFUNC(addPerFrameHandler);
