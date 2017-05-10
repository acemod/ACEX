/*
 * Author: Kingsley
 * Cancels the deployment.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Button key <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * TODO
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_key"];

if (_key != 1 || {GVAR(deployPFH) == -1}) exitWith {};

private _object = _unit getVariable [QGVAR(deployedObject), objNull];

deleteVehicle _object;

_unit setVariable [QGVAR(deployedObject), nil];
_unit setVariable [QGVAR(isDeploying), false];

[GVAR(deployPFH)] call CBA_fnc_removePerFrameHandler;
GVAR(deployPFH) = -1;

call ACEFUNC(interaction,hideMouseHint);

[_unit, "DefaultAction", _unit getVariable [QGVAR(Confirm), -1]] call ACEFUNC(common,removeActionEventHandler);
