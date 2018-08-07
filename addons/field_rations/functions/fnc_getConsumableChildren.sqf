/*
 * Author: mharis001, Glowbal, PabstMirror
 * Returns children actions for consumable items in player's inventory.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [_player] call acex_field_rations_fnc_getConsumableChildren
 *
 * Public: No
 */
#include "script_component.hpp"

[_this, {
    params ["_player"];
    TRACE_1("Creating consumable item actions",_player);

    private _cfgWeapons = configFile >> "CfgWeapons";
    private _actions = [];

    {
        private _config = _cfgWeapons >> _x;
        if (getNumber (_config >> QGVAR(isDrinkable)) > 0 || {getNumber (_config >> QGVAR(isEatable)) > 0}) then {
            private _displayName = getText (_config >> "displayName");
            private _picture = getText (_config >> "picture");

            private _action = [_x, _displayName, _picture, FUNC(consumeItem), FUNC(canConsumeItem), {}, _x] call ACEFUNC(interact_menu,createAction);
            _actions pushBack [_action, [], _player];
        };
    } forEach ([_player, false, true, true, true, false] call CBA_fnc_uniqueUnitItems);

    _actions
}, ACE_player, QGVAR(consumableActions), 3600, "cba_events_loadoutEvent"] call ACEFUNC(common,cachedCall);
