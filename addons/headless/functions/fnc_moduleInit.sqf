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

[_logic, QGVAR(Enabled), "Enabled"] call ACEFUNC(common,readSettingFromModule);
[_logic, QGVAR(Delay), "Delay"] call ACEFUNC(common,readSettingFromModule);
[_logic, QGVAR(Log), "Log"] call ACEFUNC(common,readSettingFromModule);

ACE_LOGINFO("Headless Module Initialized.");
