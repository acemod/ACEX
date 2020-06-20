#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ACEX", QGVAR(toggle), [LLSTRING(KeybindName), LLSTRING(KeybindDescription)], "", {
    if (!GVAR(enabled)) exitWith {
        if (GVAR(isLowered)) then {
            call FUNC(restoreVolume);
        };
    };

    if (GVAR(isLowered)) then {
        call FUNC(restoreVolume);
    } else {
        call FUNC(lowerVolume);
    };

    false
}] call CBA_fnc_addKeybind;

["vehicle", {
    params ["_unit"];

    if (!GVAR(lowerInVehicles)) exitWith {};

    if (vehicle _unit != _unit) then {
        call FUNC(lowerVolume);
    } else {
        call FUNC(restoreVolume);
    };
}] call CBA_fnc_addPlayerEventHandler;

// Self-calling reminder
[FUNC(remind), [], REMINDER_DELAY] call CBA_fnc_waitAndExecute;

// Restore volume on respawn
ace_player addEventHandler ["Respawn", FUNC(restoreVolume)];
