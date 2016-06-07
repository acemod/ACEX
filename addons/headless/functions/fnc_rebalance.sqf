/*
 * Author: Jonpas
 * Rebalance AI groups accross HCs.
 *
 * Arguments:
 * 0: Force <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false] call acex_headless_fnc_rebalance;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_force"];

TRACE_3("Rebalance",GVAR(inRebalance),GVAR(headlessClients),_force);

// Exit if waiting for rebalance or no HCs present
if (GVAR(inRebalance) || {GVAR(headlessClients) isEqualTo []}) exitWith {};

// Transfer after rebalance delay
[FUNC(transferGroups), [_force], GVAR(Delay)] call CBA_fnc_waitAndExecute;

// Currently in rebalance flag
GVAR(inRebalance) = true;
