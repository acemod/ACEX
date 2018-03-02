/*
 * Author: mharis001, Glowbal, PabstMirror
 * Refills an item from given water source. Old item is deleted, replacement item (from config) is added.
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
 * [waterSource1, ACE_player, "ACE_WaterBottle_empty"] call acex_field_rations_fnc_refillItem
 *
 * Public: No
 */
#include "script_component.hpp"

#define DEFAULT_REFILL_TIME 6

params ["_waterSource", "_player", "_originalItem"];
TRACE_3("Refill Item",_waterSource,_player,_originalItem);

// Get relevant config values
private _cfg = configFile >> "CfgWeapons" >> _originalItem;

private _onRefillItem = getText (_cfg >> QGVAR(onRefill));
if (_onRefillItem == "") then {
    ERROR_1("No onRefill string",_onRefillItem);
};

private _refillTime = getNumber (_cfg >> QGVAR(refillTime));

// Refill time not defined, use default
if (_refillTime isEqualTo 0) then {
    _refillTime = DEFAULT_REFILL_TIME;
    TRACE_2("Refill time not defined. Using default",_originalItem,_refillTime);
};

private _progressBarText = localize LSTRING(Refilling);

private _onFinish = {
    (_this select 0) params ["_waterSource", "_player", "_originalItem", "_onRefillItem"];
    TRACE_4("Refill Finished",_waterSource,_player,_originalItem,_onRefillItem);

    // Switch old item for refilled one
    _player removeItem _originalItem;
    [_player, _onRefillItem] call ACEFUNC(common,addToInventory);
};

private _onFailure = {
    TRACE_1("Refill Interrupted",_this);
};

[
    _refillTime,
    [_waterSource, _player, _originalItem, _onRefillItem],
    _onFinish,
    _onFailure,
    _progressBarText,
    {true}
] call ACEFUNC(common,progressBar)
