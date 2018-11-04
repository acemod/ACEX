/*
 * Author: mharis001
 * Returns children actions for refillable items in player's inventory for given water source.
 *
 * Arguments:
 * 0: Water source <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [_source, _player] call acex_field_rations_fnc_getRefillChildren
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_source", "_player"];

// Exit if disabled or source has no water
private _water = _source call FUNC(getRemainingWater);
if (_water == 0 || {_water == REFILL_WATER_DISABLED}) exitWith {[]};

private _actions = [];
{
    private _config = configFile >> "CfgWeapons" >> _x;
    if (getText (_config >> QGVAR(refillItem)) != "" && {_water == REFILL_WATER_INFINITE || {getNumber (_config >> QGVAR(refillAmount)) <= _water}}) then {
        private _displayName = format ["%1: %2", localize LSTRING(Refill), getText (_config >> "displayName")];
        private _picture = getText (_config >> "picture");
        private _action = [_x, _displayName, _picture, FUNC(refillItem), FUNC(canRefillItem), {}, _x] call ACEFUNC(interact_menu,createAction);
        _actions pushBack [_action, [], _source];
    };
} forEach ([_player] call CBA_fnc_uniqueUnitItems);

_actions
