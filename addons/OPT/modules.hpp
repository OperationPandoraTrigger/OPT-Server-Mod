// include the required addons directly from CLib
#include "\tc\CLib\addons\CLib\ModuleMacros.hpp"

class CfgCLibModules 
{
    class PREFIX 
	{
        path = "OPT\OPT\addons\OPT";
		
		dependency[] = {};
		
		MODULE(ltm) 
		{

			dependency[] = {"CLib/PerFrame", "Clib/Events"};
			
			FNC(clientInit);
		};
		
    };
};