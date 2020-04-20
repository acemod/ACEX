// COMPONENT should be defined in the script_component.hpp and included BEFORE this hpp

#define MAINPREFIX z
#define PREFIX acex

#include "script_version.hpp"

#define VERSION     MAJOR.MINOR
#define VERSION_STR MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR  MAJOR,MINOR,PATCHLVL,BUILD

#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
#define ENABLE_PERFORMANCE_COUNTERS

// MINIMAL required version for the Mod. Components can specify others..
#define REQUIRED_VERSION 1.96
#define REQUIRED_ACE_VERSION {3,13,0}

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(ACEX - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(ACEX - COMPONENT)
#endif
