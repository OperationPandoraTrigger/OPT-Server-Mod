// include the required addons directly from CLib
#include "\tc\CLib\addons\CLib\ModuleMacros.hpp"

class CfgCLibModules {
    class PREFIX {
        path = "OPT\OPT\addons\OPT";
		
		dependency[] = {};

        MODULE(Beam) 
		{

			dependency[] = {"CLib/PerFrame", "Clib/Events"};
			
			FNC(clientInit);
			APIFNC(getPoints);
			APIFNC(openDialog);
			APIFNC(selectBeam);
			// APIFNC(addBeam);
		};
		
    };
};