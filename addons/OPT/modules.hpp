// include the required addons directly from CLib
#include "\tc\CLib\addons\CLib\ModuleMacros.hpp"

class CfgCLibModules 
{
    class PREFIX 
	{
        path = "opt\opt\addons\opt";
		
		dependency[] = {};
				
		MODULE(tracker) 
		{

			dependency[] = {"CLib/PerFrame", "Clib/Events"};
			
			FNC(clientInit);
			APIFNC(addMarker);	
			APIFNC(setMarkerText);
			APIFNC(setMarkerIcon);	
			APIFNC(setMarkerColor);	
			APIFNC(setMarkerHover);	
			
		};
		
    };
};