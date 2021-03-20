/**
* Description:
* GPS Steuerung für Spieler
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
* [] call FUNC(gps);
*/

#include "macros.hpp";

//Erfassung der Einheiten beim Start
GVAR(unitnumber) = (count units Side player) + 10;
GVAR(unitsToMark) = [];

//Marker erstellen für die Spieler
GVAR(markerPool) = [];

for "_i" from 1 to GVAR(unitnumber) do
{
    GVAR(markerPool) pushBack ([PLAYERSIDE, _i] call FUNC(createUnitMarker));
}; 

// create special local player marker
GVAR(markerplayer) = [] call FUNC(createPlayerMarker);

[{
	private _unitsToMark = [];
    {
        if (side _x == playerSide) then 
        {
            _unitsToMark pushBack _x;
        };
    } foreach allUnits; 

    GVAR(markerPool) apply
    {
        _x setMarkerTextLocal "";
        _x setMarkerPosLocal [0,0];             
    };

	// update player marker
    GVAR(markerplayer) setMarkerPosLocal (getPosATLVisual (vehicle player));   

	if ((count _unitsToMark) > 0) then 
	{
        for "_i" from 0 to (count _unitsToMark - 1) do 
		{   
			private _obj = objNull;
            private _marker = "";
            _obj = _unitsToMark select _i;
            _marker = GVAR(markerPool) select _i;
			_marker setMarkerAlphaLocal 0.6;      

            if (alive _obj) then 
			{
                private _name = NAME _obj;

                // update unit marker
                _marker setMarkerPosLocal (getPosATLVisual (vehicle _obj));
                _marker setMarkerDirLocal (getDirVisual (vehicle _obj));

                // vehicle info
                if (vehicle _obj != _obj) then 
				{
                    private _vec_name = getText (configFile >> "cfgVehicles" >> typeOf (vehicle _obj) >> "displayName");

                    // Spezialfall Drohne
                    if ((vehicle _obj) in allUnitsUAV) then 
					{
                        private _operator = (UAVControl vehicle _obj) select 0;

                        // UAV Operator ja/nein
                        if (!isNull _operator) then 
						{
                            _marker setMarkerTextLocal format["%1 (%2)", _vec_name, NAME _operator];
                        } 
						else 
						{
                            _marker setMarkerTextLocal format["%1 (---)", _vec_name];
                        };
                    } 
					else 
					{
                        _marker setMarkerTextLocal format["%1 (%2)", _vec_name, _name];
                    };
                } 
				else 
				{
                    if (isPlayer _obj) then 
					{
                        _marker setMarkerTextLocal _name;
                        
                        if ((lifeState _obj isEqualTo "INCAPACITATED") or (_obj getVariable "OPT_isUnconscious" == 1)) then 
					    {
                            _marker setMarkerTextLocal "";
                            _marker setMarkerPosLocal [0,0];
                            _marker setMarkerAlphaLocal 1;						
                        } 
                        else 
					    {                     
                            _marker setMarkerTextLocal _name;	
                        };					
                    } 
					else 
					{
                        _marker setMarkerTextLocal "";
                        _marker setMarkerPosLocal [0,0];
                        _marker setMarkerAlphaLocal 1;
                    };
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
