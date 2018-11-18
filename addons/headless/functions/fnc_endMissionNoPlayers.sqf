#include "script_component.hpp"
/*
 * Author: Jonpas
 * Ends mission on server if no players are connected.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call acex_headless_fnc_endMissionNoPlayers
 *
 * Public: No
 */

// Exit if no players of virtual curators present
if (call CBA_fnc_players isEqualTo [] && {allCurators isEqualTo []}) exitWith {
    // End mission
    [] call BIS_fnc_endMissionServer;
    if (GVAR(log)) then {
        INFO("Ended Mission on all players leaving.");
    };
};

// Delay mission end otherwise
GVAR(endMissionCheckDelayed) = false;
TRACE_2("Players are present",count (call CBA_fnc_players),count allCurators);

