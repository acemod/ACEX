/*
 * Author: Kingsley
 * Mount the player in the vehicle they are directly looking at based on their distance.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call acex_quickmount_fnc_getInNearest;
 *
 * Public: No
 */

#include "script_component.hpp"

if (
    !GVAR(enabled) ||
    {isNull ACE_player} ||
    {vehicle ACE_player != ACE_player} ||
    {!alive ACE_player} ||
    {ACE_player getVariable ["ace_unconscious", false]}
) exitWith {};

private _start = AGLtoASL positionCameraToWorld [0, 0, 0];
private _end = (_start vectorAdd (getCameraViewDirection ACE_player vectorMultiply GVAR(distance)));
private _objects = lineIntersectsSurfaces [_start, _end, ACE_player];
private _target = (_objects param [0, []]) param [2, objNull];

if (
    !isNull _target &&
    {alive _target} &&
    {{_target isKindOf _x} count ["Air","LandVehicle","Ship","StaticMortar"] > 0} &&
    {locked _target in [0, 1]} &&
    {([ACE_player, _target] call ACEFUNC(common,canInteractWith))}
) then {
    private _hasAction = false;

    {
        private _unit = _target call compile format ["assigned%1 _this", _x];

        if (!isNull _unit && {!alive _unit}) exitWith {
            if (!_hasAction) then {
                ACE_player action ["GetIn" + _x, _target];
                _hasAction = true;
            };
        };

        if (_target emptyPositions _x > 0) exitWith {
            if (!_hasAction) then {
                if (_forEachIndex == 3) then {
                    private _crew = fullCrew [_target, "turret", true];
                    private _turretSeat = (_crew select {isNull (_x select 0)}) param [0, []];
                    if (_turretSeat isEqualTo []) then {
                        ACE_player action ["GetIn" + _x, _target];
                    } else {
                        ACE_player action ["GetInTurret", _target, _turretSeat select 3];
                    };
                    _hasAction = true;
                } else {
                    ACE_player action ["GetIn" + _x, _target];
                };
                _hasAction = true;
            };
        };

        if (_forEachIndex == 3) then {
            [localize LSTRING(VehicleFull)] call ACEFUNC(common,displayTextStructured);
        };
    } forEach ["Driver", "Gunner", "Commander", "Cargo"];
};

nil
