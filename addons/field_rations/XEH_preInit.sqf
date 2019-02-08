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
GVAR(waterSourceP3Ds) = [];

// List of refill action offsets corresponding to the p3ds in the array above
GVAR(waterSourceOffsets) = [];

// Fill water source arrays from CfgVehicles
{
    private _split = (getText (_x >> "model")) splitString "\";
    private _string = toLower (_split select ((count _split) - 1));
    _string = if ((_string find ".p3d") == -1) then {
        _string + ".p3d"
    } else {
        _string
    };

    private _index = GVAR(waterSourceP3Ds) pushBackUnique _string;
    if (_index != -1) then {
        GVAR(waterSourceOffsets) pushBack ([_x >> QGVAR(offset), "ARRAY", [0, 0, 0]] call CBA_fnc_getConfigEntry);
    };
} forEach (QUOTE(isNumber (_x >> 'GVAR(waterSupply)')) configClasses (configFile >> "CfgVehicles"));

ADDON = true;
