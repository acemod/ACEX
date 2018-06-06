/*
 * Author: mharis001, Glowbal, PabstMirror
 * Refills an item from given water source. Old item is removed, replacement item (from config) is added.
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
 * [_source, _player, "ACE_WaterBottle_empty"] call acex_field_rations_fnc_refillItem
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_source", "_player", "_item"];
TRACE_3("Item refill started",_source,_player,_item);

// Get refill time (handle undefined)
private _refillTime = getNumber (configFile >> "CfgWeapons" >> _item >> QGVAR(refillTime));
if (_refillTime == 0) then {
    _refillTime = DEFAULT_REFILL_TIME;
    LOG_1("Refill time not defined for %1 (using default)",_item);
};

// Create progress bar
[
    _refillTime,
    [_source, _player, _item],
    {
        (_this select 0) params ["_source", "_player", "_item"];
        LOG("Item refill successful");

        // Get relevant config values
        private _config = configFile >> "CfgWeapons" >> _item;
        private _refillItem = getText (_config >> QGVAR(refillItem));
        private _refillAmount = getNumber (_config >> QGVAR(refillAmount));
        if (_refillAmount <= 0) then {WARNING_2("Bad refill amount (%1) for %2",_refillAmount,_item)};

        // Replace old item with refilled one
        _player removeItem _item;
        [_player, _refillItem] call ACEFUNC(common,addToInventory);

        // Update remaining water in source
        private _waterInSource = _source call FUNC(getRemainingWater);
        if (_waterInSource != REFILL_WATER_INFINITE && {_refillAmount > 0}) then {
            _waterInSource = (_waterInSource - _refillAmount) max 0;
            [_source, _waterInSource] call FUNC(setRemainingWater);
        };

        // Display hint
        private _picture = getText (configFile >> "CfgWeapons" >> _refillItem >> "picture");
        [LSTRING(ItemRefilled), _picture] call ACEFUNC(common,displayTextPicture);
    },
    {LOG("Item refill failed")},
    localize LSTRING(Refilling),
    {(_this select 0) call FUNC(canRefillItem)}
] call ACEFUNC(common,progressBar);
