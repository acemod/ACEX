// COMPONENT should be defined in the script_component.hpp and included BEFORE this hpp

#define MAINPREFIX z
#define PREFIX acex

#define MAJOR 3
#define MINOR 1
#define PATCHLVL 1
#define BUILD 3

#define VERSION MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD

// MINIMAL required version for the Mod. Components can specify others..
#define REQUIRED_VERSION 1.64
#define REQUIRED_ACE_VERSION {3,9,0}

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(ACEX - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(ACEX - COMPONENT)
#endif
