#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"acex_main", "ace_interaction"};
        author = ACECSTRING(common,ACETeam);
        authors[] = {"Jonpas"};
        url = ACECSTRING(main,URL);
        VERSION_CONFIG;
    };

    // backwards compatability
    class ACE_Sitting {
        name = COMPONENT_NAME;
        ACE_isOptional = 1; // skip checkFiles
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"acex_main", "ace_interaction"};
        author = ACECSTRING(common,ACETeam);
        authors[] = {"Jonpas"};
        url = ACECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMoves.hpp"
#include "CfgVehicles.hpp"
