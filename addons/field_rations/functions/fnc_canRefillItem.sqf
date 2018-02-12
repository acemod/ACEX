/*
 * Author: mharis001, Glowbal, PabstMirror
 * Checks whether a player can refill an item from given water source.
 *
 * Arguments:
 * 0: Water source <OBJECT>
 * 1: Player <OBJECT>
 * 2: Item classname <STRING>
 *
 * Return Value:
 * Can refill item from source <BOOL>
 *
 * Example:
 * [waterSource1, ACE_player, "ACE_WaterBottle"] call acex_field_rations_fnc_canRefillItem
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_waterSource", "_player", "_itemClass"];

private _cfg = configFile >> "CfgWeapons" >> _itemClass;

[_player, _waterSource, []] call ACEFUNC(common,canInteractWith)
&& {getText (_cfg >> QGVAR(onRefill)) != ""}
