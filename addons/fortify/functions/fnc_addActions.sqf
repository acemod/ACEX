/*
 * Author: Kingsley
 * Adds the child actions.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [player] call acex_fortify_fnc_addActions
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_player"];

private _side = side group _player;
private _objects = missionNamespace getVariable [format [QGVAR(Objects_%1), _side], []];
private _actions = [];

{
    _x params ["_classname"];

    private _action = [
        _classname,
        getText (configFile >> "CfgVehicles" >> _classname >> "displayName"),
        "",
        {_this call FUNC(deployObject)},
        {
            params ["", "_player", "_params"];
            private _cost = _params call FUNC(getCost);
            private _budget = [side group _player] call FUNC(getBudget);
            (_budget == -1 || _budget >= _cost)
        },
        {},
        [_side, _classname]
    ] call ACEFUNC(interact_menu,createAction);

    _actions pushBack [_action, [], _player];
} forEach _objects;

_actions
