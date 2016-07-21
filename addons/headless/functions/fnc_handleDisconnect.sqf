/*
 * Author: Jonpas
 * Removes Headless Client from use.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Transfer To Server <BOOL>
 *
 * Example:
 * [unit] call acex_headless_fnc_handleDisconnect;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object"];

// Exit if not HC
if !(_object in GVAR(headlessClients)) exitWith {
    // End mission when no players present
    if (GVAR(EndMission) && {!GVAR(endMissionCheckDelayed)}) then {
        // Delay check until 2.5 minutes into the mission - wait for allPlayers to sync
        if (CBA_missionTime < 150) then {
            GVAR(endMissionCheckDelayed) = true;
            [{
                call FUNC(endMissionNoPlayers);
            }, [], 150 - CBA_missionTime] call CBA_fnc_waitAndExecute;
        } else {
            call FUNC(endMissionNoPlayers);
        };
    };
    false
};

// Remove HC
GVAR(headlessClients) deleteAt (GVAR(headlessClients) find _object);

if (GVAR(Log)) then {
    ACE_LOGINFO_1("Removed HC: %1",_object);
};

// Rebalance
[true] call FUNC(rebalance);

// Prevent transferring of HC to server
false
