#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {QGVAR(DocumentObject), QGVAR(PhotoObject), QGVAR(NotepadObject)};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"PabstMirror"};
        authorUrl = "https://github.com/PabstMirror/";
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
