/*
 * Author: mharis001
 * Returns children actions for refillable items in player's inventory.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [_target, _player] call acex_field_rations_fnc_getRefillChildren
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_player"];

private _actions = [];
{
    private _config = configFile >> "CfgWeapons" >> _x;

    if (getText (_config >> QGVAR(onRefill)) != "") then {
        private _displayName = getText (_config >> "displayName");
        private _picture = getText (_config >> "picture");
        private _actionText = format ["%1 %2", localize LSTRING(Refill), _displayName];
        private _action = [_x, _actionText, _picture, LINKFUNC(refillItem), LINKFUNC(canRefillItem), {}, _x] call ACEFUNC(interact_menu,createAction);
        _actions pushBack [_action, [], _target];
    };
} forEach ([_player, false] call CBA_fnc_uniqueUnitItems);

_actions
