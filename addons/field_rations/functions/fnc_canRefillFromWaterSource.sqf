/*
 * Author: Glowbal, PabstMirror
 * Checks the conditions for being able to disarm a unit
 *
 * Arguments:
 * 0: Water Source <OBJECT>
 * 1: Player <OBJECT>
 * 2: Item Classname <STRING>
 *
 * Return Value:
 * Can Be Item Refilled From Source <BOOL>
 *
 * Example:
 * [barrel, player, "ACE_waterbottle_half"] call acex_field_rations_fnc_canRefillFromWaterSource
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_waterSource", "_player", "_itemClassname"];

private _cfg = configFile >> "CfgWeapons" >> _itemClassname;

([_player, _waterSource, []] call ACEFUNC(common,canInteractWith)) && {((getText (_cfg >> QGVAR(onRefill))) != "")};
