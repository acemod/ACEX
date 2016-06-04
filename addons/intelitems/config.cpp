#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {QGVAR(DocumentObject), QGVAR(PhotoObject), QGVAR(NotepadObject)};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        authors[] = {"PabstMirror"};
        author = ACECSTRING(common,ACETeam);
        url = ACECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "UI.hpp"

class CfgVehicleClasses {
    class ADDON {
        displayName = CSTRING(VehicleClass_displayName);
    };
};
