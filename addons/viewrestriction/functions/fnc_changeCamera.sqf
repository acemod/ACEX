#include "script_component.hpp"
/*
 * Author: Jonpas
 * Change camera based on setting.
 *
 * Arguments:
 * 0: New Camera View <STRING>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["INTERNAL", vehicle] call acex_viewrestriction_fnc_changeCamera
 *
 * Public: No
 */

params ["_newCameraView", "_cameraOn"];

if (! ([_newCameraView, _cameraOn] call FUNC(canChangeCamera))) exitWith {};

TRACE_1("View Restricted",GVAR(mode));

// FirstPerson
if (GVAR(mode) == 1) exitWith {
    _cameraOn switchCamera "INTERNAL";
};

// ThirdPerson
if (GVAR(mode) == 2) exitWith {
    _cameraOn switchCamera "EXTERNAL";
};

// Selective
if (GVAR(mode) == 3) exitWith {
    [_cameraOn] call FUNC(selectiveChangeCamera);
};
