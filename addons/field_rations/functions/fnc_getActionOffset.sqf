/*
 * Author: mharis001
 * Returns the refill action offset for given object.
 *
 * Arguments:
 * 0: Water source <OBJECT>
 *
 * Return Value:
 * Action offset <ARRAY>
 *
 * Example:
 * [cursorObject] call acex_field_rations_fnc_getActionOffset
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object"];

private _typeOf = typeOf _object;
if (_typeOf != "") then {
    // Check for offset in config since we have valid typeOf
    private _offset = getArray (configFile >> "CfgVehicles" >> _typeOf >> QGVAR(offset));
    if (_offset isEqualTo []) then {[0, 0, 0]} else {_offset};
} else {
    // Check for offset corresponding to p3d list
    GVAR(waterSourceOffsets) param [GVAR(waterSourceP3ds) find (getModelInfo _object select 0), [0, 0, 0], [[]]];
};
