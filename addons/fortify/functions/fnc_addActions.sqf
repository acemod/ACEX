/*
 * Author: Kingsley
 * Adds the child actions.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 * 2: Params <ARRAY>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * TODO
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_target", "_player", "_params"];

private _side = side group _player;
private _objects = missionNamespace getVariable [format ["ACEX_Fortify_Objects_%1", _side], []];
private _actions = [];

{
    _x params ["_classname", "_cost"];

    private _action = [
        _classname,
        getText (configFile >> "CfgVehicles" >> _classname >> "displayName"),
        "",
        {_this call FUNC(deployObject)},
        {
            params ["_target", "_player", "_params"];
            private _cost = _params call FUNC(getCost);
            private _budget = [side group _unit] call FUNC(getBudget);
            (_budget == -1 || _budget >= _cost)
        },
        {},
        [_side, _classname]
    ] call ACEFUNC(interact_menu,createAction);

    _actions pushBack [_action, [], _target];
} forEach _objects;

_actions
