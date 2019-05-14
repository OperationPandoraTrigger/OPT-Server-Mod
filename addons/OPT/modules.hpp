// include the required addons directly from CLib
#include "\tc\CLib\addons\CLib\ModuleMacros.hpp"

class CfgCLibModules 
{
    class PREFIX 
	{
        path = "opt\opt\addons\opt";
		
		dependency[] = {};
				
		MODULE(dynmarkerverwaltung) 
		{

			dependency[] = {"CLib/PerFrame", "Clib/Events"};
			
			FNC(clientInit);
			APIFNC(markererstellenNormal);
			APIFNC(markererstellenHover);
			APIFNC(markerloeschen);			
		};
		
    };
};