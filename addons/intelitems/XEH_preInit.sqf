#include "script_component.hpp"

ADDON = false;

if (isServer) then {
    GVAR(intelCount) = 0; //Master Count - only on server and needed before postInit
};

#include "XEH_PREP.hpp"

ADDON = true;
