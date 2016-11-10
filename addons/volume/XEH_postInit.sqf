#include "script_component.hpp"

["ACEX", QGVAR(actionID), [localize LSTRING(KeybindName), localize LSTRING(KeybindDescription)], "", {
    if (!GVAR(enabled)) exitWith {
        if (GVAR(isLowered)) then {
            [] call FUNC(restoreVolume);
        };
    };

    if (GVAR(isLowered)) then {
        [] call FUNC(restoreVolume);
    } else {
        [] call FUNC(lowerVolume);
    };

    false
}] call CBA_fnc_addKeybind;

["vehicle", {
    params ["_unit"];

    if (!GVAR(lowerInVehicles)) exitWith {};

    if (vehicle _unit != _unit) then {
        [] call FUNC(lowerVolume);
    } else {
        [] call FUNC(restoreVolume);
    };
}] call CBA_fnc_addPlayerEventHandler;
