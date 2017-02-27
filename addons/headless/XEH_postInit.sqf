#include "script_component.hpp"

// Exit on player clients that are not hosts
if (hasInterface && !isServer) exitWith {};

["ace_settingsInitialized", {
    if (isServer) then {
        // Add disconnect EH if end mission is enabled
        if (GVAR(EndMission) != 0) then {
            addMissionEventHandler ["HandleDisconnect", {_this call FUNC(handleDisconnect)}];
        };
    } else {
        // Register HC (this part happens on HC only)
        [QGVAR(headlessClientJoined), [player]] call CBA_fnc_globalEvent;
    };
}] call CBA_fnc_addEventHandler;
