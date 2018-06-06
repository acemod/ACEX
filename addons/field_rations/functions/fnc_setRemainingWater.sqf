/*
 * Author: mharis001
 * Sets the remaining water supply for given water source.
 *
 * Arguments:
 * 0: Water source <OBJECT>
 * 1: Amount (-10 - Infinite, -1 - Disabled) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_source, 1000] call acex_field_rations_fnc_setRemainingWater
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_source", objNull, [objNull]], ["_water", nil, [0]]];

if (isNull _source || {isNil "_water"}) exitWith {};

_source setVariable [QGVAR(currentWaterSupply), _water, true];
