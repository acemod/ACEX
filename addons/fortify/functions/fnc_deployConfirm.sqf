/*
 * Author: Kingsley
 * Confirms the deployment.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Fortify Object <OBJECT>
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
[_side, -_cost] call FUNC(updateBudget);

private _typeOf = typeOf _object;
private _posASL = getPosASL _object;
private _vectorUp = vectorUp _object;
private _vectorDir = vectorDir _object;

deleteVehicle _object;

private _newObject = _typeOf createVehicle _posASL;
_newObject setPosASL _posASL;
_newObject setVectorDirAndUp [_vectorDir, _vectorUp];

[QGVAR(addActionToObject_server), [_side, _newObject]] call CBA_fnc_serverEvent;


if (cba_events_control) then {
    // Re-run if ctrl key held
    [_unit, _unit, [_side, _typeOf, [GVAR(objectRotationX), GVAR(objectRotationY), GVAR(objectRotationZ)]]] call FUNC(deployObject);
};
