/*
 * Author: Kingsley
 * Updates the given sides budget.
 *
 * Arguments:
 * 0: Side <SIDE>
 * 1: Change (0) <NUMBER>
 * 2: Display hint (true) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [west, -250, false] call acex_fortify_fnc_updateBudget;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_side", sideUnknown, [sideUnknown]], ["_change", 0, [0]], ["_hint", true, [true]]];
TRACE_3("updateBudget",_side,_change,_hint);

if (_side isEqualTo sideUnknown) exitWith {ERROR("Unknown side");};

private _budget = [_side] call FUNC(getBudget);
private _newBudget = _budget + _change;

if (_budget != -1) then {
    missionNamespace setVariable [format [QGVAR(Budget_%1), _side], _newBudget, true];

    if (_hint) then {
        [QGVAR(sideBudgetHint), [_side]] call CBA_fnc_globalEvent;
    };
};
