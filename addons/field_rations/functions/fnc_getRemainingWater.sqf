/*
 * Author: mharis001
 * Returns the remaining water in a source.
 *
 * Arguments:
 * 0: Water source <OBJECT>
 *
 * Return Value:
 * Remaining water <NUMBER>
 *
 * Example:
 * [_source] call acex_field_rations_fnc_getRemainingWater
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_source", objNull, [objNull]]];

if (isNull _source) exitWith {0};

private _water = _source getVariable QGVAR(currentWaterSupply);

if (isNil "_water") then {
    _water = getNumber (configFile >> "CfgVehicles" >> typeOf _source >> QGVAR(waterSupply));
    _source setVariable [QGVAR(currentWaterSupply), _water, true];
};

_water
