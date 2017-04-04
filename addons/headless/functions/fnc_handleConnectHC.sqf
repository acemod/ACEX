/*
 * Author: Jonpas
 * Registers connected Headless Client for use.
 *
 * Arguments:
 * 0: Headless Client <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [headlessClient] call acex_headless_fnc_handleConnectHC;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_headlessClient"];

// Exit if HC already registered
// No need to check if distribution or end mission enabled, as if disabled this will never run
if (_headlessClient in GVAR(headlessClients)) exitWith {};

// Register for use
GVAR(headlessClients) pushBack _headlessClient;

if (GVAR(log)) then {
    INFO_1("Registered HC: %1",_headlessClient);
};

// Rebalance
[true] call FUNC(rebalance);
