/*
 * Author: Kingsley
 * Confirms the deployment.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Fority Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, wall] call acex_fortify_fnc_deployConfirm
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_object"];
TRACE_2("deployConfirm",_unit,_object);

private _side = side group _unit;
private _cost = [_side, typeOf _object] call FUNC(getCost);

_object enableCollisionWith _unit;

[QGVAR(addActionToObject), [_side, _object]] call CBA_fnc_globalEventJIP;

[_side, -_cost] call FUNC(updateBudget);

if (cba_events_control) then {
    // Re-run if ctrl key held
    [_unit, _unit, [_side, typeOf _object, [GVAR(objectRotationX), GVAR(objectRotationY), GVAR(objectRotationZ)]]] call FUNC(deployObject);
};
