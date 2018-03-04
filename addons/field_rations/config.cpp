#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {QGVAR(module), GVAR(box)};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interact_menu"};
        authors[] = {"Glowbal", "PabstMirror"};
        author = ACECSTRING(common,ACETeam);
        url = ACECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgSounds.hpp"
#include "hud.hpp"
