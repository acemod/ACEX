#define COMPONENT quickmount
#define COMPONENT_BEAUTIFIED QuickMount
#include "\z\acex\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_QUICKMOUNT
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_QUICKMOUNT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_QUICKMOUNT
#endif

#include "\z\acex\addons\main\script_macros.hpp"

#define DEFAULT_DISTANCE 3
#define DEFAULT_SPEED 18
#define DEFAULT_PRIORITY 0