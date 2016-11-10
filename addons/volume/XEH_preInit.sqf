#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(isLowered) = false;
GVAR(initialGameVolume) = soundVolume;
GVAR(initialMusicVolume) = musicVolume;

ADDON = true;
