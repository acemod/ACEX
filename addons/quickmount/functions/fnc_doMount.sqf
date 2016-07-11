/*
 * Author: Kingsley
 * Mount the given player in the nearest eligible vehicle based on their distance and direction to the vehicle
 *
 * Arguments:
 * 0: Player unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_player] call acex_quickmount_fnc_doMount;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

if (isNull _unit || {!alive _unit} || {!isPlayer _unit}) exitWith {};

