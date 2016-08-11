#define COMPONENT killtracker
#define COMPONENT_BEAUTIFIED KillTracker
#include "\z\acex\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_KILLTRACKER
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_KILLTRACKER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_KILLTRACKER
#endif

#include "\z\acex\addons\main\script_macros.hpp"
