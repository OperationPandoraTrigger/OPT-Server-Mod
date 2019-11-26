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
            FNC(getUnitIconID);
            FNC(updateUnitIcon);
        };
		MODULE(SHOP) 
		{
            dependency[] = {"CLib/PerFrame", "Clib/Events"};
            FNC(clientInit);  
			FNC(config);
            FNC(einlesenInShopDialog);	
            FNC(fillLB);
            FNC(getvehicleinfo);
            FNC(getprice);
            FNC(order);
            FNC(loadout);
            FNC(arm);
            FNC(filter);
            FNC(einlesenInKonfigDialog);
            FNC(auslesenMagazine);
            FNC(geldVorhandeneBewaffnung);
            FNC(dynamischerDatensatz);
            FNC(deletevehicle);
        };
    };
};
