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
 * [] call acex_headless_fnc_endMissionNoPlayers;
 *
 * Public: No
 */
#include "script_component.hpp"

// Exit if players connected
if !(call CBA_fnc_players isEqualTo []) exitWith {
    GVAR(endMissionCheckDelayed) = false;
    TRACE_1("Players are present",count (call CBA_fnc_players));
};

// End mission
[] call BIS_fnc_endMissionServer;
if (GVAR(Log)) then {
    INFO("Ended Mission on all players leaving.");
};
