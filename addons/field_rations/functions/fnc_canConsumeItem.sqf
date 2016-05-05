/*
 * Author: Glowbal, PabstMirror
 * Tests if player can consume item.
 *
 * Arguments:
 * 0: Target (not used) <OBJECT>
 * 1: Player <OBJECT>
 * 2: Item Classname <STRING>
 *
 * Return Value:
 * Can Player Consume Item <BOOL>
 *
 * Example:
 * [player, player, "ACE_waterbottle_half"] call ace_field_rations_fnc_canConsumeItem
 *
 * Public: No
 */
#include "script_component.hpp"

params ["", "_player", "_itemClassname"];

([_player, _player, ["isNotInside"]] call ace_common_fnc_canInteractWith)
&& {(_itemClassname in (items _player))}
&& {((vehicle _player) != _player) || {(vectorMagnitude (velocity _player)) < 1}}
