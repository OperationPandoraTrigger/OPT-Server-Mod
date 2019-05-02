#define PREFIX OPT
#define PATH OPT
#define MOD OPT

// Define version information of this mod
#define MAJOR 0
#define MINOR 1
#define PATCHLVL 0
#define BUILD 0

#ifdef VERSION
    #undef VERSION
#endif
#ifdef VERSION_AR
    #undef VERSION_AR
#endif

#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD
#define VERSION MAJOR.MINOR.PATCHLVL.BUILD


// Do not release with this setting enabled!
#include "isDev.hpp"
// #define DEBUGFULL // Enable all debug methods
// #define ENABLEPERFORMANCECOUNTER // Enable performance counter for function calls
// #define ENABLEFUNCTIONTRACE // Enable SQF based function tracer


#define DISABLECOMPRESSION

// include the default CLib-macros (providing GVAR and similar)
// Found here: https://github.com/TaktiCool/CLib/blob/master/addons/CLib/macros.hpp
#include "\tc\CLib\addons\CLib\macros.hpp"
