/*
 * Author: Jonpas
 * Handles AI spawn and requests a rebalance if applicable.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call acex_headless_fnc_handleSpawn;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object"];
TRACE_1("Spawn",_object);

// Exit if HC transferring disabled or object not a unit (including unit inside vehicle) or is player
if (!(_object in allUnits) || {isPlayer _object}) exitWith {};

// Rebalance
[false] call FUNC(rebalance);
