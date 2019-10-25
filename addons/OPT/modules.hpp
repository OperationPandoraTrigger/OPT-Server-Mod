// include the required addons directly from CLib
#include "\tc\CLib\addons\CLib\ModuleMacros.hpp"

class CfgCLibModules {
    class PREFIX {
        path = "OPT\OPT\addons\OPT";
		
		dependency[] = {};
		
        MODULE(GPS) {
            dependency[] = {"CLib/PerFrame", "Clib/Events", "Clib/StateMachine", "Clib/MapGraphics", "Clib/RemoteExecution"};
            FNC(clientInit);
            FNC(serverInit);
            FNC(addUnitToGPS);
            FNC(removeUnitFromGPS);
            //FNC(addGroupToGPS);
            //FNC(addVehicleToGPS);
            FNC(isUnitVisible);
            FNC(isVehicleVisible);
            FNC(isUnitLeader);
            FNC(clientinitCBASettings);
            FNC(clientinitEH);
            FNC(getIconID);
            FNC(updateUnitIcon);
            FNC(updateVehicleEH);
        };
    };
};
