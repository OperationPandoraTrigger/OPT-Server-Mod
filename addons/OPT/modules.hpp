// include the required addons directly from CLib
#include "\tc\CLib\addons\CLib\ModuleMacros.hpp"

class CfgCLibModules {
    class PREFIX {
        path = "OPT\OPT\addons\OPT";
		
		dependency[] = {};
		
        MODULE(GPS) {
            dependency[] = {"CLib/PerFrame", "Clib/Events", "Clib/StateMachine", "Clib/MapGraphics"};
            FNC(clientInit);
            FNC(addUnitToGPS);
            //FNC(addGroupToGPS);
            //FNC(addVehicleToGPS);
            FNC(isUnitVisible);
            FNC(isVehicleVisible);
            FNC(isUnitLeader);
            FNC(initCBASettings);
        };
		MODULE(SHOP) 
		{
            dependency[] = {"CLib/PerFrame", "Clib/Events"};
            FNC(clientInit);  
			FNC(config);
            FNC(einlesendialog)	
        };
    };
};
