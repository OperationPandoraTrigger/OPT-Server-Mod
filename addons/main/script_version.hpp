// Define version information of this mod
#define MAJOR 1
#define MINOR 9
#define PATCHLVL 1
#define BUILD 25

#ifdef VERSION
    #undef VERSION
#endif
#ifdef VERSION_AR
    #undef VERSION_AR
#endif

#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD
#define VERSION MAJOR.MINOR.PATCHLVL.BUILD
