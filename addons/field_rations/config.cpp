#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_field_rations_module"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interact_menu"};
        author[] = {"Glowbal", "PabstMirror"};
        authorUrl = "https://github.com/acemod/ACE3";
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgSounds.hpp"
#include "hud.hpp"
