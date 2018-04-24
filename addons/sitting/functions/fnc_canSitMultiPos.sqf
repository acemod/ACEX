/*
 * Author: Jonpas for ACEX Sitting fnc_canSit, modified by vabene1111 for multi position sitting
 * Check if the player can sit down.
 *
 * Arguments:
 * 0: Seat <OBJECT>
 * 1: Player <OBJECT>
 * 2: Seat Position <STRING>
 *
 * Return Value:
 * Can Sit Down <BOOL>
 *
 * Example:
 * [seat, player] call acex_sitting_fnc_canSit
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_seat", "_player","_seatPos"];

// Sitting enabled, is seat object, not occupied and standing up (or not on a big slope)
GVAR(enable) &&
{isNil {_player getVariable QGVAR(isSitting)}} &&
{!(_seat getVariable [format["%1%2",QGVAR(pos_),_seatPos],false])} &&
{round (vectorUp _seat select 0) == 0 && {round (vectorUp _seat select 1) == 0} && {round (vectorUp _seat select 2) == 1}}
