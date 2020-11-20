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

["missionStarted", {
	// update mission time
	private _newdate = missionStart select [0,3];
	_newdate append [round OPT_WEATHERTIME_timeslider_hours, round OPT_WEATHERTIME_timeslider_minutes];
	[_newdate] remoteExec ["setDate"];
	[[], {setDate _newdate}] remoteExec ["call",0,"JIP_id_setDate"];

	// update weather conditions (time skip to get clouds in sync)
	skipTime -24;
	86400 setOvercast OPT_WEATHERTIME_weather_overcast;
	forceWeatherChange;
	skipTime 24;
	0 setRain OPT_WEATHERTIME_weather_rain;
	0 setFog OPT_WEATHERTIME_weather_fog;
	forceWeatherChange;

	// make sure overcast stays as desired - long transision to the same value
	999999 setOvercast OPT_WEATHERTIME_weather_overcast;

	// TODO: 
	// fogValue: Number - normal fog value that represents fog density at fogBase level. Range 0..1
	// fogDecay: Number - decay of fog density with altitude. Range -1..1
	// fogBase: Number - base altitude (ASL) of fog (in meters). Range -5000..5000
}] call CFUNC(addEventhandler);
