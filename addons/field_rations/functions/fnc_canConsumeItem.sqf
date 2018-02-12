/*
 * Author: mharis001, Glowbal, PabstMirror
 * Checks whether a player can consume an item.
 *
 * Arguments:
 * 0: Target (not used) <OBJECT>
 * 1: Player <OBJECT>
 * 2: Item classname <STRING>
 *
 * Return Value:
 * Can consume item <BOOL>
 *
 * Example:
 * [objNull, ACE_player, "ACE_WaterBottle"] call acex_field_rations_fnc_canConsumeItem
 *
 * Public: No
 */
#include "script_component.hpp"

params ["", "_player", "_itemClass"];

// Check: can interact, player still has item, in vehicle or not moving (fast)
[_player, _player, ["isNotInside"]] call ACEFUNC(common,canInteractWith)
&& {_itemClass in (items _player)}
&& {vehicle _player != _player || {vectorMagnitude (velocity _player) < 1}}
