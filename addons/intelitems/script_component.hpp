#define COMPONENT intelitems
#include "\z\acex\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
#define CBA_DEBUG_SYNCHRONOUS
#define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_INTELITEMS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_INTELITEMS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_INTELITEMS
#endif

#include "\z\acex\addons\main\script_macros.hpp"

#define TYPE_DOCUMENT 0
#define TYPE_PHOTO 1
#define TYPE_NOTEPAD 2
