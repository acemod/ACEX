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
TRACE_1("HandleDisconnect",_this);

// Exit if not HC
if !(_object in GVAR(headlessClients)) exitWith {
    TRACE_2("Object not in HC list",_object,GVAR(headlessClients));
    // End mission when no players present
    if (GVAR(EndMission) != 0 && {!GVAR(endMissionCheckDelayed)}) then {
        // Delay check until 2.5 minutes into the mission - wait for allPlayers to sync
        if (CBA_missionTime < 150) then {
            TRACE_1("Mission start delay",CBA_missionTime);
            GVAR(endMissionCheckDelayed) = true;
            [{
                call FUNC(endMissionNoPlayers);
            }, [], 150 - CBA_missionTime] call CBA_fnc_waitAndExecute;
        } else {
            // End instantly or after delay
            if (GVAR(EndMission) == 1) then {
                TRACE_2("Instant end",GVAR(endMission),CBA_missionTime);
                call FUNC(endMissionNoPlayers);
            } else {
                TRACE_2("Delayed 60s end",GVAR(endMission),CBA_missionTime);
                GVAR(endMissionCheckDelayed) = true;
                [FUNC(endMissionNoPlayers), [], 60] call CBA_fnc_waitAndExecute;
            };
        };
    };
    false
};

//Exit if AI distribution is disabled
if (!GVAR(enabled)) exitWith {true};

// Remove HC
GVAR(headlessClients) deleteAt (GVAR(headlessClients) find _object);

if (GVAR(Log)) then {
    INFO_1("Removed HC: %1",_object);
};

// Rebalance
[true] call FUNC(rebalance);

// Prevent transferring of HC to server
false
