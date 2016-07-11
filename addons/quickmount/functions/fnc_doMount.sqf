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

if (isNull _unit || {vehicle _unit != _unit} || {!alive _unit} || {!isPlayer _unit}) exitWith {};

private _start = eyePos _unit;
private _end = (_start vectorAdd (getCameraViewDirection _unit vectorMultiply GVAR(distance)));
private _objects = reverse (lineIntersectsWith [_start, _end, _unit, objNull, true]);
private _target = _objects param [0, objNull];

if (!isNull _target && {{_target isKindOf _x} count ["Air", "LandVehicle", "Ship"] > 0}) then {
    if (isNull gunner _target) then {
        _unit moveInGunner _target;
        // _unit action ["GetInGunner", _target];
    } else {
        if (isNull driver _target) then {
            _unit moveInDriver _target;
            // _unit action ["GetInDriver", _target];
        } else {
            if (isNull commander _target) then {
                _unit moveInCommander _target;
                // _unit action ["GetInCommander", _target];
            } else {
                if (_target emptyPositions "Cargo" > 0) then {
                    _unit moveInCargo _target;
                    // _unit action ["GetInCargo", _target];
                } else {
                    systemChat "Vehicle full.";
                };
            };
        };
    };
};
