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

//Internal "Type" codes:
#define TYPE_DOCUMENT 0
#define TYPE_PHOTO 1
#define TYPE_NOTEPAD 2

//IDCS:
#define IDC_CG 724340
#define IDC_BORDER 724341
#define IDC_PAPERBACKGROUND 724342
#define IDC_CONTENTPICTURE 724343
#define IDC_CONTENTEDIT 724344
#define IDC_CONTENTTEXT 724345

#define IDC_TOPBAR 724350
#define IDC_CLOSEBUTTON 724351

#define IDC_ZEUSTITLE 26468
#define IDC_ZEUSVALUE 26469
