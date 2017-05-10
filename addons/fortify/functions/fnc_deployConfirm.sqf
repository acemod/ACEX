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
private _cost = [_side, typeOf _object] call FUNC(getCost);

private _action = [
    QGVAR(removeObject),
    "Remove Object",
    "",
    {deleteVehicle (_this select 0)},
    {GVAR(fortificationMode)},
    {},
    [_unit, _object]
] call ACEFUNC(interact_menu,createAction);

[_object, 0, [], _action] call ACEFUNC(interact_menu,addActionToObject);

private _budget = [_side] call FUNC(getBudget);

if (_budget != -1) then {
    missionNamespace setVariable [format ["ACEX_Fortify_Budget_%1", _side], _budget - _cost, true];
    format ["BUDGET $%1", _budget - _cost] remoteExecCall ["hint", _side];
};

[GVAR(deployPFH)] call CBA_fnc_removePerFrameHandler;
GVAR(deployPFH) = -1;

_unit setVariable [QGVAR(deployedObject), nil];
_unit setVariable [QGVAR(isDeploying), false];

call ACEFUNC(interaction,hideMouseHint);

[_unit, "DefaultAction", _unit getVariable [QGVAR(Confirm), -1]] call ACEFUNC(common,removeActionEventHandler);
