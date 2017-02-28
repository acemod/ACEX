/*
 * Author: Glowbal, PabstMirror
 * Gets all the children that you can eat.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Consumable Type ("eat", "drink", or "" for both) <STRING>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [player, ''] call acex_field_rations_fnc_getConsumableChildren
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_typeOfConsumble"];

private _actions = [];
private _consumableItems = [];
{
    private _cfg = configFile >> "CfgWeapons" >> _x;
    if ((isClass _cfg) && {!(_x in _consumableItems)}) then {
        private _showItem = switch (true) do {
            case (_typeOfConsumble == "drink"): {getNumber (_cfg >> QGVAR(isDrinkable)) > 0};
            case (_typeOfConsumble == "eat"): {getNumber (_cfg >> QGVAR(isEatable)) > 0};
            default {(getNumber (_cfg >> QGVAR(isDrinkable)) > 0) || {getNumber (_cfg >> QGVAR(isEatable)) > 0}};
        };
        if (_showItem) then {
            _consumableItems pushBack _x;

            private _displayName = getText (_cfg >> "displayName");
            private _picture = getText (_cfg >> "picture");

            private _action = [_x, _displayName, _picture, LINKFUNC(actionConsumeItem), LINKFUNC(canConsumeItem), {}, _x] call ACEFUNC(interact_menu,createAction);
            _actions pushBack [_action, [], _player];
        };
    };
} forEach (items _player);

_actions
