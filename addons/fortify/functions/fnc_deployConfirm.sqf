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

_object setVariable [QGVAR(object), true, true];

private _action = [
    QGVAR(removeObject),
    _text,
    "",
    {
        params ["_target", "_player", "_params"];
        _params params ["_side", "_cost"];
        deleteVehicle _target;

        private _budget = [_side] call FUNC(getBudget);

        if (_budget != -1) then {
            missionNamespace setVariable [format ["ACEX_Fortify_Budget_%1", _side], _budget + _cost, true];
            format ["BUDGET $%1", _budget + _cost] remoteExecCall ["hint", _side];
        };
    },
    {GVAR(mode)},
    {},
    [_side, _cost]
] call ACEFUNC(interact_menu,createAction);

[_object, 0, [], _action] remoteExecCall [QACEFUNC(interact_menu,addActionToObject), 0, true];

private _budget = [_side] call FUNC(getBudget);

if (_budget != -1) then {
    missionNamespace setVariable [format ["ACEX_Fortify_Budget_%1", _side], _budget - _cost, true];
    format ["BUDGET $%1", _budget - _cost] remoteExecCall ["hint", _side];
};

_unit setVariable [QGVAR(deployedObject), nil, true];
_unit setVariable [QGVAR(isDeploying), false, true];

[GVAR(deployPFH)] call CBA_fnc_removePerFrameHandler;
GVAR(deployPFH) = -1;

call ACEFUNC(interaction,hideMouseHint);
[_unit, "DefaultAction", _unit getVariable [QGVAR(Confirm), -1]] call ACEFUNC(common,removeActionEventHandler);
