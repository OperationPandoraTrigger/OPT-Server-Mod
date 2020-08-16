#include "macros.hpp"
#include "CfgCLibLocalisation.hpp"
class CfgPatches {
    class PREFIX {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.70;
        author = "OPT";
        authors[] = {"Raven"};
        authorUrl = "";
        version = VERSION;
        versionStr = QUOTE(VERSION);
        versionAr[] = {VERSION_AR};
        requiredAddons[] = {"CLib"};
    };
};

#include "modules.hpp"
