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

GVAR(officer) = [
    "OPT_NATO_Offizier_T",
    "OPT_CSAT_Offizier_T",
	"OPT_NATO_Offizier",
	"OPT_CSAT_Offizier",
	"I_officer_F"
];

// default GPS mode: all squad units are visible
// Auf Wunsch der Comm solle alle alle sehen können, Normal Modus ist GVAR(mode) = 1;
GVAR(mode) = 2;

// GPS mode: all units are visible in mode 2
if (typeOf player in GVAR(officer)) then 
{
    GVAR(mode) = 2;

};

//Erfassung der Einheiten beim Start
GVAR(unitsToMark) = [];
GVAR(unitsToMark) = [] call FUNC(selectUnits);

//Marker erstellen für die Spieler
GVAR(markerPool) = [];

for "_i" from 1 to (count GVAR(unitsToMark))  do 
	{
    	GVAR(markerPool) pushBack ([PLAYERSIDE, _i] call FUNC(createUnitMarker));
	}; 

// create special local player marker
GVAR(markerplayer) = [];
GVAR(markerplayer) = [] call FUNC(createPlayerMarker);

//
[{
	private _markerplayer = [];
	private _unitsToMark = [];

	//Erneuerung der Spielererfassung
	_unitsToMark = [] call FUNC(selectUnits);

	//Vergleich ob mehr Spieler da sind als Marker vonhanden
	//bei mehr Spieler als Marker vorhanden sind, neue Marker erstellen
	if ((count _unitsToMark) > (count GVAR(unitsToMark))) then 
	{ 
		private _neuemarker = 0;
		_neuemarker = (count _unitsToMark) - (count GVAR(unitsToMark));

		for "_i" from 1 to (_neuemarker)  do 
		{
			GVAR(markerPool) pushBack ([PLAYERSIDE, ((count GVAR(unitsToMark))+_i)] call FUNC(createUnitMarker));
		};  

		GVAR(unitsToMark) = _unitsToMark;
	}; 

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
                        
                        if (lifeState _obj isEqualTo "INCAPACITATED") then 
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