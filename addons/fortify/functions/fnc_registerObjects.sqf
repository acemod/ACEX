/*
 * Author: Kingsley
 * Registers the given objects in the given side's player interaction menu.
 * Players on that side must have the pickaxe item in their inventory to access the menu.
 * Classnames must be in the format [<classname>, <cost>]
 * MUST BE CALLED ON SERVER!
 *
 * Arguments:
 * 0: Side <SIDE>
 * 1: Budget <NUMBER>
 * 2: Object Classnames <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [west, 5000, [["Sandbag", 5], ["Bunker", 50]]] call acex_fortify_fnc_registerObjects
 *
 * Public: Yes
 */

#include "script_component.hpp"

if (!isServer) exitWith {};

params [["_side", sideUnknown, [sideUnknown]], ["_budget", -1, [0]], ["_objects", [], [[]]]];
TRACE_3("registerObjects",_side,_budget,_objects);

missionNamespace setVariable [format [QGVAR(Budget_%1), _side], _budget, true];
missionNamespace setVariable [format [QGVAR(Objects_%1), _side], _objects, true];
