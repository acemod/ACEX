#define COMPONENT field_rations
#define COMPONENT_BEAUTIFIED Field Rations
#include "\z\acex\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
#define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_FIELD_RATIONS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_FIELD_RATIONS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_FIELD_RATIONS
#endif

#include "\z\acex\addons\main\script_macros.hpp"

#define MP_SYNC_INTERVAL 60

#define REFILL_WATER_INFINITE -10
#define REFILL_WATER_DISABLED -1
#define DEFAULT_REFILL_TIME 5
#define CHECK_WATER_TIME 1

#define IDC_THIRST 568421
#define IDC_HUNGER 568422
