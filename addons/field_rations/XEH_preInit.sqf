#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

// Init arrays of status modifiers
GVAR(thirstModifiers) = [];
GVAR(hungerModifiers) = [];

// List of p3d water sources (case sensitive) for objects that report `typeOf == ""`
GVAR(waterSourceP3ds) = [
    "misc_wellpump.p3d" // (11899,9150,0] on chenarus
];

ADDON = true;
