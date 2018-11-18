#include "script_component.hpp"
/*
 * Author: Jonpas, vabene1111
 * Check if the player can sit down.
 *
 * Arguments:
 * 0: Seat <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Can Sit Down <BOOL>
 *
 * Example:
 * [seat, player] call acex_sitting_fnc_canSit
 *
 * Public: No
 */

params ["_seat", "_player"];

// Sitting enabled, is seat object, not occupied and standing up (or not on a big slope)
GVAR(enable) &&
{isNil {_player getVariable QGVAR(sittingStatus)}} &&
{(_seat getVariable [QGVAR(seatsClaimed), []]) find true == -1} &&
{round (vectorUp _seat select 0) == 0 && {round (vectorUp _seat select 1) == 0} && {round (vectorUp _seat select 2) == 1}}
