#include "macros.hpp"

["missionStarted", {
    // Create markers for all players already here in case of JIP
    DUMP("Adding initial unit icons...");
    allPlayers apply {
        DUMP(_x);
        DUMP([_x] call FUNC(isUnitVisible));
        if (CLib_Player != _x && [_x] call FUNC(isUnitVisible) ) then {
            [_x] call FUNC(addUnitToGPS);
            DUMP((CGVAR(MapGraphics_MapGraphicsGroup) call CFUNC(allVariables)) select {(_x find toLower QGVAR(IconId)) == 0});
        };
    };

    // TODO: Is there a better way to deal with artillery computers?
    // For now, we use perFrame with a 1sec delay. This shouldn't be too painful for clients.
    [{

		//OPT Karten-Dialog
		if (!(isNull ((findDisplay 444001) displayCtrl 10007))) then
		{
			((findDisplay 444001) displayCtrl 10007) call CFUNC(registerMapControl);
		};	

		//OPT Karten-Dialog Mini GPS
		if (!(isNull (uiNamespace getVariable ["opt_ui_gps_minimap", controlNull]))) then
		{
			((uiNamespace getVariable "opt_ui_gps_minimap") displayCtrl 916) call CFUNC(registerMapControl);
		};
		
		//BIS Artillery Dialog
		if (!(isNull ((findDisplay -1) displayCtrl 500))) then
		{
			((findDisplay -1) displayCtrl 500) call CFUNC(registerMapControl);
		};	
		
		//BIS UAV Dialog 
		if (!(isNull ((findDisplay 160) displayCtrl 51))) then
		{
			((findDisplay 160) displayCtrl 51) call CFUNC(registerMapControl);
		};	

        //BIS MINI GPS
		if (!(isNull (uiNamespace getVariable ["RscCustomInfoMiniMap", controlNull]))) then
		{
			((uiNamespace getVariable "RscCustomInfoMiniMap") displayCtrl 101) call CFUNC(registerMapControl);
		};


    }, 1] call CFUNC(addPerFrameHandler);

	// MiniGPS Steuerung Init
	[] call FUNC(miniGPS);

	// Kontinuierlicher Neustart des GPS System, Löschung alle Marker und Neuerstellung
	[{

		// When BuildFlag != Version, the cache should be rebuilt automatically.
		// The cache is what is actually drawn.
		// The MapGraphicsGroup is what is currently registered to be drawn
		// The MapGraphicsMapControls contain all controls where graphics should be drawn on
		DUMP(clib_MapGraphics_MapGraphicsCacheBuildFlag);
		DUMP(clib_MapGraphics_MapGraphicsCacheVersion);
		DUMP(clib_MapGraphics_MapGraphicsCache);
		DUMP(uinamespace getVariable "clib_mapgraphics_MapGraphicsMapControls");
		DUMP(clib_MapGraphics_MapGraphicsGroup call clib_fnc_allVariables);

		// alle Marker Löschen der Einheiten
		allPlayers apply 
		{
			[_x] call FUNC(removeUnitFromGPS);
		};

		// Marker neu erstellen für alle
		allPlayers apply 
		{
			[_x] call FUNC(addUnitToGPS);
		};	

    }, 60] call CFUNC(addPerFrameHandler);

}] call CFUNC(addEventhandler);
