/*
 * Author: Glowbal
 *
 * Arguments:
 * 0:  <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if (!local _logic) exitwith {};

[_logic] call FUNC(createIEDObject);
