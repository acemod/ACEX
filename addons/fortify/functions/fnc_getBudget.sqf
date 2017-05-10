/*
 * Author: Kingsley
 * Gets the budget for the given side.
 *
 * Arguments:
 * 0: Side <SIDE>
 *
 * Return Value:
 * Budget <NUMERIC>
 *
 * Example:
 * TODO
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_side"];

(missionNamespace getVariable [format ["ACEX_Fortify_Budget_%1", _side], -1])
