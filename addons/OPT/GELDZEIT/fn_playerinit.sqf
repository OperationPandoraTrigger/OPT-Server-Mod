/**
* Description:
* Setzen einiger Standartwerte für die Mission
*
* Author:
* Lord-MDB
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
* [] call FUNC(playerinit);
*/
#include "macros.hpp"

// new command since 1.52 - to disable the player raycasts in PvP cause not needed functionality but a lot of cpu calcuation
disableRemoteSensors true;
setTerrainGrid 3.125;
enableEnvironment true;
enableRadio false;
//0 fadeRadio 0;	<-- produce the mysterie bug ;-P
player disableConversation true;
enableSentences false;
oldSubs = showSubtitles false;
enableSaving [false, false];
enableTeamswitch false;

//Testweise bis Hud da ist.

DFUNC(spielinfo) = 
{
	private _timestamp = [serverTime - OPT_GELDZEIT_startTime] call CBA_fnc_formatElapsedTime;						
	Hint format ["Spielzeit: %1 \n\n Punkte :AAF %2 | CSAT %3",_timestamp,OPT_SECTORCONTROL_AAF_points,OPT_SECTORCONTROL_csat_points];	
};


				//Konfigdialog öffnen
				/*
				* https://cbateam.github.io/CBA_A3/docs/files/keybinding/fnc_addKeybind-sqf.html
				*/
				[
					"OPT", 
					"OPT Punkte/Zeit Anzeigen", 
					["Punkte/Zeit Anzeigen", "Gibt die Punkte und Zeit aus."], 
					{
                        [] call FUNC(spielinfo)        
						
					}, 
					{}, 
					[
						DIK_F3, 
						[false, false, false] // [shift, ctrl, alt]
					]
				] call CBA_fnc_addKeybind;




