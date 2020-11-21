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

#define TRANSITION_INTERVAL 10	// interval in seconds for framehandler to refresh weather transitions
TRANSITION_INDEX = 0;

["missionStarted", {
	// update mission time
	private _newdate = missionStart select [0,3];
	_newdate append [round OPT_WEATHERTIME_timeslider_hours, round OPT_WEATHERTIME_timeslider_minutes];
	[_newdate] remoteExec ["setDate"];
	[[], {setDate _newdate}] remoteExec ["call",0,"JIP_id_setDate"];

	// update weather conditions (time skip to get clouds in sync)
	skipTime -24;
	86400 setOvercast OPT_WEATHERTIME_weather_overcast_start;
	forceWeatherChange;
	skipTime 24;
	0 setRain OPT_WEATHERTIME_weather_rain_start;
	0 setFog OPT_WEATHERTIME_weather_fog_start;
	forceWeatherChange;

	// TODO: 
	// fogValue: Number - normal fog value that represents fog density at fogBase level. Range 0..1
	// fogDecay: Number - decay of fog density with altitude. Range -1..1
	// fogBase: Number - base altitude (ASL) of fog (in meters). Range -5000..5000
}] call CFUNC(addEventhandler);

// update weather transisions every TRANSITION_INTERVAL seconds. arma allows only one transition at the same time - so we do it one after another.
[{
	private _timeElapsed = serverTime - OPT_GELDZEIT_startTime;
	private _missionProgress = _timeElapsed / OPT_GELDZEIT_PLAYTIME;
	switch (TRANSITION_INDEX) do
	{
		case 0:
		{
			(TRANSITION_INTERVAL * 0.9) setOvercast (OPT_WEATHERTIME_weather_overcast_end - OPT_WEATHERTIME_weather_overcast_start) * _missionProgress + OPT_WEATHERTIME_weather_overcast_start;
			simulWeatherSync;
			TRANSITION_INDEX = 1;
		};

		case 1:
		{
			(TRANSITION_INTERVAL * 0.9) setRain (OPT_WEATHERTIME_weather_rain_end - OPT_WEATHERTIME_weather_rain_start) * _missionProgress + OPT_WEATHERTIME_weather_rain_start;
			simulWeatherSync;
			TRANSITION_INDEX = 2;
		};

		case 2:
		{
			(TRANSITION_INTERVAL * 0.9) setFog (OPT_WEATHERTIME_weather_fog_end - OPT_WEATHERTIME_weather_fog_start) * _missionProgress + OPT_WEATHERTIME_weather_fog_start;
			simulWeatherSync;
			TRANSITION_INDEX = 0;
		};

		default
		{
			TRANSITION_INDEX = 0;
			["default"] remoteExec ["systemChat"];
		};
	}
}, TRANSITION_INTERVAL, _this] call CFUNC(addPerFrameHandler);
