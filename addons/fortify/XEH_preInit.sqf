#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(mode) = true;

GVAR(keyShift) = false;
GVAR(keyCtrl) = false;
GVAR(keyAlt) = false;

GVAR(objectRotationX) = 0;
GVAR(objectRotationY) = 0;
GVAR(objectRotationZ) = 0;

ADDON = true;
