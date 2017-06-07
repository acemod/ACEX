/*
 * Author: Kingsley
 * Confirms the deployment.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * TODO
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

private _side = side group _unit;
private _object = _unit getVariable [QGVAR(deployedObject), objNull];
private _budget = [_side] call FUNC(getBudget);
private _cost = [_side, typeOf _object] call FUNC(getCost);
private _text = [format ["Remove Object +$%1", _cost], "Remove Object"] select (_budget == -1);

_object enableCollisionWith _unit;

_object setVariable [QGVAR(object), true, true];

// Remove object action
[QGVAR(addActionToObject), [_side, _object, ([
    QGVAR(removeObject),
    _text,
    "",
    {
        params ["_target", "_player", "_params"];
        deleteVehicle _target;
        _params call FUNC(updateBudget);
    },
    {GVAR(mode)},
    {},
    [_side, _cost]
] call ACEFUNC(interact_menu,createAction))]] call CBA_fnc_globalEventJIP;

[_side, -_cost] call FUNC(updateBudget);

_unit setVariable [QGVAR(deployedObject), nil, true];
_unit setVariable [QGVAR(isDeploying), false, true];

[GVAR(deployPFH)] call CBA_fnc_removePerFrameHandler;
GVAR(deployPFH) = -1;

call ACEFUNC(interaction,hideMouseHint);
[_unit, "DefaultAction", _unit getVariable [QGVAR(Confirm), -1]] call ACEFUNC(common,removeActionEventHandler);

if (GVAR(keyCtrl)) then {
    // Re-run if ctrl key held
    [
        objNull,
        _unit,
        [_side, typeOf _object, [
            GVAR(objectRotationX),
            GVAR(objectRotationY),
            GVAR(objectRotationZ)
        ]]
    ] call FUNC(deployObject);
};
