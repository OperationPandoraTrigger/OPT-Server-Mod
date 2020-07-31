/**
* Description:
* GPS Steuerung für Spieler die Verwundet sind
* 
* Author:
* [GNC]Lord-MDB
*
* Arguments:
*
* Return Value:
*
* Server Only:
* No
* 
* Global:
* No
* 
* API:
* No
* 
* Example:
* [] call FUNC(gps_Unconscious);
*/

#include "macros.hpp";

GVAR(_unitsToMarkisUnconsciousold) = [];

[{
	private _unitsToMarkisUnconscious = [];

    {
        if ((side _x == playerSide) and (_x getVariable "ACE_isUnconscious")) then 
        {
            _unitsToMarkisUnconscious pushBack _x;

        };
    } foreach allUnits;   

	//Vergleich ob mehr Spieler da sind als Marker vonhanden
	//bei mehr Spieler als Marker vorhanden sind, neue Marker erstellen
	if ((count _unitsToMarkisUnconscious) > (count GVAR(_unitsToMarkisUnconsciousold))) then 
	{ 
		private _neuemarker = 0;
		_neuemarker = (count _unitsToMarkisUnconscious) - (count GVAR(_unitsToMarkisUnconsciousold));

		for "_i" from 1 to (_neuemarker)  do 
		{
			_markerPool pushBack ([PLAYERSIDE, ((count _unitsToMarkisUnconscious)+_i)] call FUNC(createunitmarker_Unconscious));
		};  

		GVAR(_unitsToMarkisUnconsciousold) = _unitsToMarkisUnconscious;
	}; 

	_markerPool apply
    {
        _x setMarkerTextLocal "";
        _x setMarkerPosLocal [0,0];             
    };

	if ((count _unitsToMarkisUnconscious) > 0) then 
	{
        for "_i" from 0 to (count _unitsToMarkisUnconscious - 1) do 
		{   
			private _obj = objNull;
            private _marker = "";
            _obj = _unitsToMarkisUnconscious select _i;
            _marker = _markerPool select _i;
			_marker setMarkerAlphaLocal 0.6;      

            if (_obj getVariable "ACE_isUnconscious") then 
			{
                private _name = NAME _obj;

                // update unit marker
                _marker setMarkerPosLocal (getPosATLVisual (vehicle _obj));
                _marker setMarkerDirLocal (getDirVisual (vehicle _obj));

                // Ist Spieler stabilisiert
                if (player getVariable ["OPT_isStabilized", 1] == 1)  then 
				{
					_marker setMarkerTextLocal format ["%1 stabilisiert",_name];	
                } 
				else 
				{
					_marker setMarkerTextLocal format ["%1 verwundet",_name];
                };
            } 
			else 
			{
                _marker setMarkerTextLocal "";
                _marker setMarkerPosLocal [0,0];
                _marker setMarkerAlphaLocal 1;

            };
        };
    };      

}, 1, _this] call CFUNC(addPerFrameHandler);

