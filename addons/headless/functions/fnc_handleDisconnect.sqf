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
        private _delay = 0;
        if (CBA_missionTime < 150000) then {
            _delay = (150000 - CBA_missionTime) / 100;
        };

        GVAR(endMissionCheckDelayed) = true;
        [{
            // Double check after allPlayers sync has completed
            if (call CBA_fnc_players > 0) exitWith {
                GVAR(endMissionCheckDelayed) = false;
            };

            // End mission
            [] call BIS_fnc_endMissionServer;
            if (GVAR(Log)) then {
                ACE_LOGINFO("Ended Mission on all players leaving");
            };
        }, [], _delay] call CBA_fnc_waitAndExecute;
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
