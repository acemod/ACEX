/*
 * Author: Kingsley
 * Handles the object direction.
 *
 * Arguments:
 * 0: Scroll <NUMERIC>
 *
 * Return Value:
 * Bool
 *
 * Example:
 * TODO
 *
 * Public: No
 */

#include "script_component.hpp"

if (GVAR(deployPFH) == -1) exitWith {false};

params ["_scroll"];

GVAR(deployDirection) = GVAR(deployDirection) + (_scroll * 5);

true
