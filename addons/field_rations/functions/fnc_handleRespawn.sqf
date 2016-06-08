/*
 * Author: Glowbal, PabstMirror
 * Handles when a unit is kill.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Corpse <OBJECT>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [bob1] call acex_field_rations_fnc_handleRespawn
 *
 * Public: No
 */
#include "script_component.hpp"

if (!GVAR(systemEnabled)) exitWith {};

params ["_unit", "_corpse"];
TRACE_2("params",_unit,_corpse);

diag_log text format ["Respawn ------------- %1 ==== %2", _this, _unit isEqualTo _corpse];

if (!local _unit) exitWith {};

// TODO implement? What do we want to do here again? Hide the Hud elements?
// Reset the variables?

if (true) exitWith {};
