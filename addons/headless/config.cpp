#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"acex_main"};
        author = ACECSTRING(common,ACETeam);
        authors[]= {"Jonpas"};
        url = ACECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgEden.hpp"

class ACE_newEvents {
    ACE_HeadlessClientJoined = QGVAR(headlessClientJoined);
};
