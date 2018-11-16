/*
 * Author: mharis001, Glowbal, PabstMirror
 * Refills an item from given water source.
 *
 * Arguments:
 * 0: Water source <OBJECT>
 * 1: Player <OBJECT>
 * 2: Item classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_source, _player, "ACE_WaterBottle_Empty"] call acex_field_rations_fnc_refillItem
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_source", "_player", "_item"];
TRACE_3("Item refill started",_source,_player,_item);

private _config = configFile >> "CfgWeapons" >> _item;

// Get config values for refill
private _refillItem = getText (_config >> QGVAR(refillItem));
private _refillAmount = getNumber (_config >> QGVAR(refillAmount));
private _refillTime = getNumber (_config >> QGVAR(refillTime));

private _fnc_onSuccess = {
    params ["_args"];
    _args params ["_source", "_player", "_item", "_refillItem", "_refillAmount"];
    TRACE_1("Refill item successful",_args);

    // Replace item with refilled one
    _player removeItem _item;
    [_player, _refillItem] call ACEFUNC(common,addToInventory);

    // Update remaining water in source
    private _waterInSource = _source call FUNC(getRemainingWater);
    if (_waterInSource != REFILL_WATER_INFINITE) then {
        _waterInSource = (_waterInSource - _refillAmount) max 0;
        [_source, _waterInSource] call FUNC(setRemainingWater);
    };

    // Show refilled item hint
    private _picture = getText (configFile >> "CfgWeapons" >> _refillItem >> "picture");
    [LSTRING(ItemRefilled), _picture] call ACEFUNC(common,displayTextPicture);
};

private _fnc_onFailure = {
    TRACE_1("Refill item failed",_this);
};

private _fnc_condition = {
    params ["_args"];
    _args call FUNC(canRefillItem);
};

[
    _refillTime,
    [
        _source,
        _player,
        _item,
        _refillItem,
        _refillAmount
    ],
    _fnc_onSuccess,
    _fnc_onFailure,
    localize LSTRING(Refilling),
    _fnc_condition
] call ACEFUNC(common,progressBar);
