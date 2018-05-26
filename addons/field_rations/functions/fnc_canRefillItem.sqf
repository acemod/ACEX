/*
 * Author: mharis001, Glowbal, PabstMirror
 * Checks whether a player can refill an item from given water source.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 * 2: Item classname <STRING>
 *
 * Return Value:
 * Can refill item <BOOL>
 *
 * Example:
 * [_target, _player, "ACE_WaterBottle"] call acex_field_rations_fnc_canRefillItem
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_player", "_item"];

getText (configFile >> "CfgWeapons" >> _item >> QGVAR(onRefill)) != ""
&& {[_player, _target] call ACEFUNC(common,canInteractWith)}
