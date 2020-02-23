/*
 * Author: mharis001, Glowbal, PabstMirror
 * Checks whether the player can refill an item from given water source.
 *
 * Arguments:
 * 0: Water source <OBJECT>
 * 1: Player <OBJECT>
 * 2: Item classname <STRING>
 *
 * Return Value:
 * Can refill item <BOOL>
 *
 * Example:
 * [_source, _player, "ACE_WaterBottle_Empty"] call acex_field_rations_fnc_canRefillItem
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_source", "_player", "_item"];

alive _source
&& {GVAR(waterSourceActions) != 0}
&& {_item in (_player call ACEFUNC(common,uniqueItems))}
&& {
    private _water = _source call FUNC(getRemainingWater);
    _water == REFILL_WATER_INFINITE || {_water >= getNumber (configFile >> "CfgWeapons" >> _item >> QGVAR(refillAmount))}
}
