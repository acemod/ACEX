/*
 * Author: Jonpas
 * Check if the player can sit down.
 *
 * Arguments:
 * 0: Seat <OBJECT>
 *
 * Return Value:
 * Can Sit Down <BOOL>
 *
 * Example:
 * [seat] call acex_sitting_fnc_canSit
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_seat"];

// Sitting enabled, is seat object, not occupied and standing up (or not on a big slope)
GVAR(enable) &&
{!(_seat call ACEFUNC(common,owned))} &&
{round (vectorUp _seat select 0) == 0 && {round (vectorUp _seat select 1) == 0} && {round (vectorUp _seat select 2) == 1}}
