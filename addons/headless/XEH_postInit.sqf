#include "script_component.hpp"

// Exit on player clients that are not hosts
if (hasInterface && !isServer) exitWith {};

["SettingsInitialized", {
    if (isServer) then {
        // Add disconnect EH if HC transferring enabled
        if (GVAR(Enabled)) then {
            addMissionEventHandler ["HandleDisconnect", {_this call FUNC(handleDisconnect)}];
        };
    } else {
        // Register HC (this part happens on HC only)
        ["ACE_HeadlessClientJoined", [player]] call ace_common_fnc_globalEvent;
    };
}] call ace_common_fnc_addEventHandler;
