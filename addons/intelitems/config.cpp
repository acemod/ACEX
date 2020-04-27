#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QGVAR(notepad),
            QGVAR(document),
            QGVAR(photo)
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interact_menu", "ace_zeus"};
        author = ACECSTRING(common,ACETeam);
        authors[] = {"PabstMirror", "mharis001"};
        url = ACECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgEditorSubcategories.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "gui.hpp"
