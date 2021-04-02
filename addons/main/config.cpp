#include "macros.hpp"
#include "CfgCLibLocalisation.hpp"
class CfgPatches {
    class PREFIX {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.70;
        author = "OPT";
        authors[] = {"Raven", "Lord", "form"};
        authorUrl = "https://opt4.net";
        version = VERSION;
        versionStr = QUOTE(VERSION);
        versionAr[] = {VERSION_AR};
        requiredAddons[] = {"CLib"};
    };
};

#include "modules.hpp"
