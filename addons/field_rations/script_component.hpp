#define COMPONENT field_rations
#include "\z\ace\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL

#ifdef DEBUG_ENABLED_FIELD_RATIONS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_FIELD_RATIONS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_FIELD_RATIONS
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define DEFAULT_ALPHA_LEVEL 0.4
#define TIME_

#define WATER_SOURCES [\
    ["Land_Barrel_water"],\
    ["Land_BarrelWater_F"],\
    ["Land_stand_waterl_EP1"],\
    ["Land_Reservoir_EP1"],\
    ["Land_Misc_Well_C_EP1"],\
    ["Land_Misc_Well_L_EP1"]]
