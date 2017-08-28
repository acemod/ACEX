/*
 * Author: Kingsley
 * Parses the given text and returns a side.
 *
 * Arguments:
 * 0: Text <STRING>
 *
 * Return Value:
 * Side <SIDE>
 *
 * Example:
 * ["blufor"] call acex_fortify_fnc_parseSide;
 * ["west"] call acex_fortify_fnc_parseSide;
 * ["b"] call acex_fortify_fnc_parseSide;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_side"];
TRACE_1("parseSide",_side);

if (_side isEqualType sideUnknown) exitWith {_side};

private _char = _side select [0, 1];

((([
    ["b", west],
    ["o", east],
    ["i", resistance],
    ["w", west],
    ["e", east],
    ["r", resistance]
] select {
    toLower _char == (_x select 0)
}) param [0, []]) param [1, sideUnknown])
