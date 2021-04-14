#include "\tc\CLib\addons\CLib\ModuleMacros.hpp"

class CfgCLibModules
{
    class PREFIX
    {
        path = "opt\opt_server\addons\main";
        dependency[] = {};

        MODULE(GPS) 
        {
            dependency[] = {"CLib/PerFrame", "Clib/Events", "Clib/StateMachine", "Clib/MapGraphics", "Clib/RemoteExecution"};
            FNC(initCBASettings);
            FNC(init);
            FNC(clientInit);
            FNC(gps);
        };

        MODULE(SHOP) 
        {
            dependency[] = {"CLib/PerFrame", "Clib/Events"};
            FNC(clientInit);
            FNC(initCBASettings);
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
            FNC(typfestellung);
            FNC(einlesenInVerkaufDialog);
            FNC(handledeadvehicle);
            FNC(clientInitcbaclassevents);
            FNC(flipcheck);
            FNC(unflip);
            FNC(writekill);
            FNC(writetransportdistance);
            FNC(serverInit);
            FNC(hardcap_send);
            FNC(hardcap_check);
            FNC(create);
            FNC(Init);
        };

        MODULE(REVIVE) 
        {
            dependency[] = {"CLib/PerFrame", "Clib/Events", "Clib/StateMachine", "Clib/MapGraphics", "Clib/RemoteExecution"};
            FNC(clientInit);
            FNC(initCBASettings);
            FNC(clientinitEH);
            FNC(revivelog);
            FNC(dialog);
            FNC(keyunbind);
            FNC(checkdragging);
            FNC(drag);
            FNC(handleaction);
            FNC(checkplaymove);
            FNC(release);
            FNC(clientInitcbaclassevents);
        };

        MODULE(GELDZEIT) 
        {
            dependency[] = {"CLib/PerFrame", "Clib/Events", "Clib/StateMachine", "Clib/MapGraphics", "Clib/RemoteExecution"};
            FNC(clientInit);
            FNC(initCBASettings);
            FNC(serverInit);
            FNC(ende);
            FNC(frezztime);
            FNC(playerinit);
            FNC(renderbudget);
            FNC(updatebudget);
            FNC(writeplayerlist);
            FNC(updateplayerlist);
            FNC(earplugs);
            FNC(briefing);
            FNC(Zeus);
            FNC(init);
            FNC(beam);
        };

        MODULE(SECTORCONTROL) 
        {
            dependency[] = {"CLib/PerFrame", "Clib/Events", "Clib/StateMachine", "Clib/MapGraphics", "Clib/RemoteExecution"};
            FNC(clientInit);
            FNC(initCBASettings);
            FNC(serverInit);
            FNC(setupflag);
            FNC(setflagowner);
            FNC(deletemarkers);
            FNC(writeflagcaptured);
            FNC(calcdominator);
            FNC(captureflagcondition);
            FNC(clientinitplayereh);
            FNC(addflagmenu);
            FNC(chooseflag);
            FNC(setupflagpositions);
            FNC(setupflagpoles);
            FNC(Punkte);
            FNC(captureflag);
            FNC(teleport);
            FNC(drawline);
            FNC(drawsectormarkers);
            FNC(deletesectormarkers);
        };

        MODULE(FIELDREPAIR) 
        {
            dependency[] = {"CLib/PerFrame", "Clib/Events", "Clib/StateMachine", "Clib/MapGraphics", "Clib/RemoteExecution"};
            FNC(clientInit);
            FNC(initcbasettings);
            FNC(clientInitcbaclassevents);
            FNC(needrepair);
            FNC(repairvehicle);
            FNC(refuelVehicle);
            FNC(vehicleNoFuel);
            FNC(heavyrepair);
            FNC(fullrepair);
            FNC(setminfuel);
            FNC(vehicledamaged);
            FNC(partrepair);
            FNC(vehicleDamagedLight);
            FNC(getpartsrepairtime);
            FNC(Init);
            FNC(checkRepairs);
        };

        MODULE(HUD) 
        {
            dependency[] = {"CLib/PerFrame", "Clib/Events", "Clib/StateMachine", "Clib/MapGraphics", "Clib/RemoteExecution"};
            FNC(clientInit);
            FNC(updatehud);
        };

        MODULE(CARGO) 
        {
            dependency[] = {"CLib/PerFrame", "Clib/Events", "Clib/StateMachine", "Clib/MapGraphics", "Clib/RemoteExecution"};
            FNC(clientInit);
            FNC(Init);
            FNC(cargoinit);
            FNC(deactivatecargo);
            FNC(deactivatedragging);
            FNC(dragginginit);
            FNC(cbaclassevents);
            FNC(setupcargospaceandsize);
        };

        MODULE(RULES) 
        {
            dependency[] = {"CLib/PerFrame", "Clib/Events", "Clib/StateMachine", "Clib/MapGraphics", "Clib/RemoteExecution"};
            FNC(clientInit);
            FNC(setup_classnames);
            FNC(weaponcheck);
            FNC(uav);
        };

        MODULE(LOGGING)
        {
            FNC(writelog);
        };

        MODULE(WEATHERTIME)
        {
            FNC(initCBASettings);
            FNC(serverInit);
        };
    };
};
