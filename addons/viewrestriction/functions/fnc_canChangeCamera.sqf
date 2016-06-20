/*
 * Author: Jonpas
 * Checks if camera can be changed.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Can Change Camera <BOOL>
 *
 * Example:
 * [] call acex_viewrestriction_fnc_canChangeCamera
 *
 * Public: No
 */
#include "script_component.hpp"

// Remote control hates switchCamera (control returns to player, camera is left on remotely controlled object/unit), make sure remote controlled units are not impacted

{!isNull ACE_player} &&
(player == ACE_player) &&
{alive ACE_player} &&
{ACE_player == cameraOn || vehicle ACE_player == cameraOn} &&
{!call ACEFUNC(common,isFeatureCameraActive)} &&
{!(cameraOn isKindOf "UAV" || cameraOn isKindOf "UAV_01_base_F")} // UAVs are remote controlled
