#include "script_component.hpp"

["ace_settingsInitialized", {
    // Request rebalance on any unit spawn
    if (GVAR(enabled)) then {
        ["AllVehicles", "init", FUNC(handleSpawn), nil, nil, true] call CBA_fnc_addClassEventHandler;
    };

    // Register and remove HCs if not client that is not server and distribution or end mission enabled
    if ((!hasInterface || isServer) && {GVAR(enabled) || GVAR(endMission) != 0}) then {
        if (isServer) then {
            // Add disconnect EH
            addMissionEventHandler ["HandleDisconnect", {call FUNC(handleDisconnect)}];
        } else {
            // Register HC (this part happens on HC only)
            [QGVAR(headlessClientJoined), [player]] call CBA_fnc_globalEvent;
        };
    };
}] call CBA_fnc_addEventHandler;
