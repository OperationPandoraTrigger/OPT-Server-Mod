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

GVAR(markerPoolisUnconscious) = [];
GVAR(unitnumberUnconscious) = (count units Side player) + 10;

for "_i" from 1 to (GVAR(unitnumberUnconscious)) do
{
    GVAR(markerPoolisUnconscious) pushBack ([PLAYERSIDE, _i] call FUNC(createunitmarker_Unconscious));
};  

//Seitenabfrage des Spieler per config
//Bei ACE Medic wird Spieler zu CIV seite bei Side Abfrage
//_sidesoldat =getnumber (configFile >> "CfgVehicles" >> (typeof player) >> "side"); 
// 0=East, 1=West, 2=independent

[{
    private _unitsToMarkisUnconscious = [];
    private _Sideidunit = 0;
    private _Sideidplayer = 0;

    {
        _Sideidunit = getnumber (configFile >> "CfgVehicles" >> (typeof _x) >> "side");
        _sideidplayer = playerSide call BIS_fnc_sideID;   

        if ((_Sideidunit == _sideidplayer) and ((lifeState _x isEqualTo "INCAPACITATED") or (_x getVariable "OPT_isUnconscious" == 1))) then 
        {
            _unitsToMarkisUnconscious pushBack _x;
        };
    } foreach playableUnits;   

    GVAR(markerPoolisUnconscious) apply
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
            _marker = GVAR(markerPoolisUnconscious) select _i;
            _marker setMarkerAlphaLocal 0.6;      

            private _name = NAME _obj;

            // update unit marker
            _marker setMarkerPosLocal (getPosATLVisual (vehicle _obj));
            _marker setMarkerDirLocal (getDirVisual (vehicle _obj));

            _marker setMarkerTextLocal format [MLOC(PLAYER_INJURED),_name];
        };
    };      
}, 1, _this] call CFUNC(addPerFrameHandler);
