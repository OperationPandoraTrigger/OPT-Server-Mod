/**
* Description:
* Steuerung des Mini GPS Dialogs
* 
* Author:
* Lord-MDB
*
* Arguments:
*
* Return Value:
*
* Server Only:
* no
* 
* Global:
* No
* 
* API:
* No
* 
* Example:
*/


#include "macros.hpp"

GVAR(MiniMapCount) = 0;
GVAR(MiniMapCountOld) = 0;

//Init Titel für setzen uiNamespace
titleRsc ["opt_gps_minimap","plain"];
titleFadeOut 0;

//Taste für ein/ausblenden des OPT Mini GPS
if (hasInterface) then 
{
    [
        "OPT", 
        "OPT Mini GPS Karte", 
        ["OPT Mini GPS ein/ausblenden", "ein/ausblenden des OPT Mini GPS"], 
        {
        GVAR(MiniMapCount) = GVAR(MiniMapCount)+1;
        }, 
        {}, 
        [
            DIK_F3, 
            [false, false, false] // [shift, ctrl, alt]
        ]
    ] call CBA_fnc_addKeybind;

};

// Steuerung des MiniMap Controls
[{
	if (GVAR(MiniMapCount) != GVAR(MiniMapCountOld)) then
	{
		if (isNull (uiNamespace getVariable "opt_ui_gps_minimap")) then
		{
			titleRsc ["opt_gps_minimap","plain"];
		}
		else
		{
			titleFadeOut 0;
		};

		GVAR(MiniMapCountOld) = GVAR(MiniMapCount);	
	};

	//OPT Karten-Dialog Mini GPS offen
	if (!(isNull (uiNamespace getVariable "opt_ui_gps_minimap"))) then
	{
		private _speedPlayer = abs speed Player;
		private _mapFocus = getpos Player;
		private _mapzoom = 0.05+(_speedplayer/1000); 

		(uiNamespace getVariable "opt_ui_gps_minimap" displayCtrl 916) ctrlMapAnimAdd [0,_mapzoom, _mapFocus]; 
    	ctrlMapAnimCommit (uiNamespace getVariable "opt_ui_gps_minimap" displayCtrl 916) ; 
    	(uiNamespace getVariable "opt_ui_gps_minimap" displayCtrl 916)  ctrlCommit 0;
	};
		
}, 1] call CFUNC(addPerFrameHandler);
