#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"acex_main", "ace_interact_menu"};
        author = ACECSTRING(common,ACETeam);
        authors[]= {"mharis001", "Glowbal", "PabstMirror"};
        url = ACECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgSounds.hpp"
#include "RscTitles.hpp"
#include "CfgUIGrids.hpp"
