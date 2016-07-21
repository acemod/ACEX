/*
 * Author: Jonpas
 * Checks if camera can be changed.
 *
 * Arguments:
 * 0: New Camera View <STRING>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * Can Change Camera <BOOL>
 *
 * Example:
 * ["INTERNAL", vehicle] call acex_viewrestriction_fnc_canChangeCamera
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_newCameraView", "_cameraOn"];

// Remote control hates switchCamera (control returns to player, camera is left on remotely controlled object/unit), make sure remote controlled units are not impacted

!(_newCameraView in ["GUNNER", "GROUP"]) &&
{!isNull ACE_player} &&
{player == ACE_player} &&
{alive ACE_player} &&
{ACE_player == _cameraOn || vehicle ACE_player == _cameraOn} &&
{!call ACEFUNC(common,isFeatureCameraActive)} &&
{!(_cameraOn isKindOf "UAV" || _cameraOn isKindOf "UAV_01_base_F")} // UAVs are remote controlled
