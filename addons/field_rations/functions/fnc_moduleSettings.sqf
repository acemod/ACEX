/*
 * Author: Glowbal, PabstMirror
 * Module for fieldRations settings
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [logic] call acex_field_rations_fnc_moduleSettings
 *
 * Public: No
 */

#include "script_component.hpp"

if (!isServer) exitWith {};

params ["_logic"];

[_logic, QGVAR(timeWithoutWater), "timeWithoutWater"] call ACEFUNC(common,readSettingFromModule);
[_logic, QGVAR(timeWithoutFood),  "timeWithoutFood"]  call ACEFUNC(common,readSettingFromModule);

if ((GVAR(timeWithoutWater) == 0) || {GVAR(timeWithoutFood) == 0}) exitWith {
    ERROR("Bad Time Setting");
};

[QGVAR(systemEnabled), true, true, true] call ACEFUNC(common,setSetting);

INFO("Module initialised.");
