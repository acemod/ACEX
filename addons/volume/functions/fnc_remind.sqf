/*
 * Author: Kingsley
 * Reminds about lowered volume.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call acex_volume_fnc_remind;
 *
 * Public: No
 */
#include "script_component.hpp"

// Exit if reminder not enabled or not lowered
if (!GVAR(remindIfLowered) || {!GVAR(isLowered)}) exitWith {};

[localize LSTRING(LoweredReminder)] call ACEFUNC(common,displayTextStructured);

// Fire another reminder in 60s
[FUNC(remind), [], REMINDER_DELAY] call CBA_fnc_waitAndExecute;
