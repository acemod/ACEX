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

params ["_player"];

private _fnc_getActions = {
    TRACE_1("Creating consumable item actions",_player);

    private _actions = [];
    private _cfgWeapons = configFile >> "CfgWeapons";

    {
        private _config = _cfgWeapons >> _x;
        if (getNumber (_config >> QGVAR(thirstQuenched)) > 0 || {getNumber (_config >> QGVAR(hungerSatiated)) > 0}) then {
            private _displayName = getText (_config >> "displayName");
            private _picture = getText (_config >> "picture");

            // Exec next frame so closing interaction menu doesn't block progressBar
            private _action = [_x, _displayName, _picture, {[FUNC(consumeItem), _this] call CBA_fnc_execNextFrame}, {true}, {}, _x] call ACEFUNC(interact_menu,createAction);
            _actions pushBack [_action, [], _player];
        };
    } forEach (_player call ACEFUNC(common,uniqueItems));

    _actions
};

[[], _fnc_getActions, _player, QGVAR(consumableActionsCache), 9999, "cba_events_loadoutEvent"] call ACEFUNC(common,cachedCall);
