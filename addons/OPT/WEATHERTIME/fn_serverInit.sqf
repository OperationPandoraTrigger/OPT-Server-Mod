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
* No
* 
* API:
* No
* 
* Example:
* [] call FUNC(serverInit);
*/

#include "macros.hpp"

if (isServer) then
{
    waitUntil {time > 0};
    _private newdate = missionStart select [0,3] append timeslider_hours append timeslider_minutes;
    [_newdate] remoteExec ["setDate"];
    [[], {setDate _newdate}] remoteExec ["call",0,"JIP_id_setDate"];

    // update weather conditions (time skip to get clouds in sync)
    skipTime -24;
    86400 setOvercast weather_overcast;
    86400 setRain weather_rain;
    86400 setFog weather_fog;
    forceWeatherChange;
    skipTime 24;

    // make sure the values stay as desired - long transision to the same value
    999999 setOvercast weather_overcast;
    999999 setRain weather_rain;
    999999 setFog weather_fog;
};

// TODO: 
// fogValue: Number - normal fog value that represents fog density at fogBase level. Range 0..1
// fogDecay: Number - decay of fog density with altitude. Range -1..1
// fogBase: Number - base altitude (ASL) of fog (in meters). Range -5000..5000
