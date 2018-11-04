/*
 * Author: mharis001, Glowbal, PabstMirror
 * Handles the respawning of a unit by resetting necessary variables.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Corpse <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [newUnit, oldUnit] call acex_field_rations_fnc_handleRespawn
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_corpse"];
TRACE_2("Handle Respawn",_unit,_corpse);

if !(local _unit) exitWith {};

_unit setVariable [QGVAR(thirst), 0];
_unit setVariable [QGVAR(hunger), 0];
