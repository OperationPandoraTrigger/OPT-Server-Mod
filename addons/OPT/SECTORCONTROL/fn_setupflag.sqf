/**
* Description:
* initialize all flag poles with optionall marker and add action menu for playersNumber
* 
* Author:
* Lord-MDB
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
* [] call func(setupFlag);
*/

#include "macros.hpp"

/* BY JAMES */
// Variablen opt_csat_flags und opt_nato_flags / opt_csat_flags und opt_guer_flags werden durch die HL & PL von NATO und CSAT / AAF und CSAT in der Warmup-Phase am Kartenboard ausgewaehlt
// siehe mission\functions\fnc_chooseFlag für Details

// fallback if no flag was chosen -> random war!
private _all_flags = allMissionObjects "FlagPole_F";
private _all_nato_flags = _all_flags select {_x getVariable "start_owner" == west};
private _all_csat_flags = _all_flags select {_x getVariable "start_owner" == east};
private _all_aaf_flags = _all_flags select {_x getVariable "start_owner" == independent};

private _maxTries = 100;
while {(count GVAR(nato_flags) < round GVAR(flagCountNATO)) && _maxTries > 0} do
{
    GVAR(nato_flags) pushBackUnique selectRandom _all_nato_flags;
    _maxTries = _maxTries - 1;
};
publicVariable QGVAR(nato_flags);

private _maxTries = 100;
while {(count GVAR(csat_flags) < round GVAR(flagCountCSAT)) && _maxTries > 0} do
{
    GVAR(csat_flags) pushBackUnique selectRandom _all_csat_flags;
    _maxTries = _maxTries - 1;
};
publicVariable QGVAR(csat_flags);

while {(count GVAR(aaf_flags) < round GVAR(flagCountAAF)) && _maxTries > 0} do
{
    GVAR(aaf_flags) pushBackUnique selectRandom _all_aaf_flags;
    _maxTries = _maxTries - 1;
};
publicVariable QGVAR(aaf_flags);

// Delete all Flagmarkers set during Waffenruhe
remoteExecCall [QFUNC(deleteMarkers)];

/*
Fuer jede Flagge in einem Sektor: 
Marker für Flag falls Marker an
Marker für Minensperre falls Minensperre an
unverwundbar, Logistik-Script aus sowie Actionmeneintrag fuer Spieler
*/
{
    private _flag = _x;

    // erzeuge fuer jede gefundene Flagge einen Marker auf der Karte
    if (GVAR(flagMarkerOn)) then 
    {
        private _markerName = format["MapMarker_%1_%2", _forEachIndex, _flag];
        private _marker = createMarker [_markerName, getPos _flag];

        if (GVAR(csat_flags) find _x >= 0) then 
		{
            _marker setMarkerType "flag_CSAT";
        }; 
		if (GVAR(nato_flags) find _x >= 0) then 
		{
            _marker setMarkerType "flag_NATO";
        }; 
		if (GVAR(aaf_flags) find _x >= 0) then 
		{
            _marker setMarkerType "flag_AAF";
        }; 
		
        _flag setVariable [QGVAR(flagMarker), _marker, true];
    };

    // mark free mine zone around flag
    if (GVAR(flagFreeMineZoneMarkerOn)) then 
	{
        private _markerName = format["MineZoneMarker_%1_%2", _forEachIndex, _flag];
        private _marker = createMarker [_markerName, getPos _flag];
        _marker setMarkerShape "ELLIPSE";
        _marker setMarkerBrush "Solid";
        _marker setMarkerColor "ColorRed";
        _marker setMarkerAlpha 0.5;
        _marker setMarkerSize [GVAR(flagFreeMineZoneRadius), GVAR(flagFreeMineZoneRadius)];
        _flag setVariable [QGVAR(mineMarker), _marker, true];
    };
    
    [
        _flag,
        [
            "<t color='#FF0000'>Flagge ziehen</t>",                      // Anzeigetext
            {[_this select 0, _this select 1] call FUNC(captureFlag);},  // Skript
            [],                                                          // Parameter fr Skript
            999,                                                         // priority
            true,                                                        // showWindow
            true,                                                        // hideOnUse 
            "",                                                          // shortcut
            "(vehicle player == player and OPT_GELDZEIT_Spielzeitstart and ((OPT_GELDZEIT_PLAYTIME - (serverTime - OPT_GELDZEIT_startTime)) > 0) and (playerside != _target getVariable 'owner'))",                              
            GVAR(flagDistanceToPlayer)                                   // radius
        ]
    ] remoteExecCall ["addAction", 0, true];
   
    _flag allowDamage false;  // Flagge kann nicht beschaedigt werden
} foreach GVAR(csat_flags) + GVAR(nato_flags) + GVAR(aaf_flags);
