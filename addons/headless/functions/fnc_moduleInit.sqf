/*
 * Author: Jonpas
 * Initializes the Headless module.
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: Units <ARRAY> (Unused)
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

if (!isServer) exitWith {};

params ["_logic", "", "_activated"];

if (!_activated) exitWith {};

[_logic, QGVAR(enabled), "enabled"] call ACEFUNC(common,readSettingFromModule);
[_logic, QGVAR(delay), "delay"] call ACEFUNC(common,readSettingFromModule);
[_logic, QGVAR(endMission), "endMission"] call ACEFUNC(common,readSettingFromModule);
[_logic, QGVAR(log), "log"] call ACEFUNC(common,readSettingFromModule);

INFO("Headless Module Initialized.");
