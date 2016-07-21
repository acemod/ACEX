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
if (call CBA_fnc_players > 0) exitWith {
    GVAR(endMissionCheckDelayed) = false;
};

// End mission
[] call BIS_fnc_endMissionServer;
if (GVAR(Log)) then {
    ACE_LOGINFO("Ended Mission on all players leaving");
};
