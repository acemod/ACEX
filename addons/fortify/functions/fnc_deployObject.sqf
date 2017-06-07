/*
 * Author: Kingsley
 * Deploys the object to the player for them to move it around.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 * 2: Params <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * TODO
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_target", "_player", "_params"];

_params params [
    ["_side", sideUnknown, [sideUnknown]],
    ["_classname", "", [""]],
    ["_rotations", [0,0,0]]
];

// TODO Needs a better way to check if the objects has any "seats" the AI/players can use
private _isStatic = getArray (configFile >> "CfgVehicles" >> _classname >> "weapons") isEqualTo [];

// TODO Needs a more reliable way to check if the object is lamp / has light sources
private _isLamp = getText (configFile >> "CfgVehicles" >> _classname >> "editorSubcategory") == "EdSubcat_Lamps";

private _budget = [_side] call FUNC(getBudget);
private _cost = [_side, _classname] call FUNC(getCost);
private _object = _classname createVehicle [0, 0, 0];

_player setVariable [QGVAR(deployedObject), _object];
_player setVariable [QGVAR(isDeploying), true];

if (_isStatic && !_isLamp) then {
    [QACEGVAR(common,enableSimulationGlobal), [_object, false]] call CBA_fnc_serverEvent;
};

_object disableCollisionWith _player;

GVAR(objectRotationX) = _rotations select 0;
GVAR(objectRotationY) = _rotations select 1;
GVAR(objectRotationZ) = _rotations select 2;

GVAR(deployPFH) = [{
    (_this select 0) params ["_unit", "_object"];

    private _lengths = [_object] call FUNC(axisLengths);
    _lengths params ["_width", "_length", "_height"];

    private _distance = _width max _length;
    private _start = AGLtoASL positionCameraToWorld [0, 0, 0];
    private _basePos = (_start vectorAdd (getCameraViewDirection _unit vectorMultiply _distance));
    _basePos set [2, ((_basePos select 2) - (_height / 2)) max getTerrainHeightASL _basePos];

    _object setPosASL _basePos;
    [_object, GVAR(objectRotationX), GVAR(objectRotationY), GVAR(objectRotationZ) + getDir _unit] call ACEFUNC(common,setPitchBankYaw);

    #ifdef DEBUG_MODE_FULL
        hintSilent format ["Rotation:\nX: %1\nY: %2\nZ: %3", GVAR(objectRotationX), GVAR(objectRotationY), GVAR(objectRotationZ)];
    #endif
}, 0, [_player, _object]] call CBA_fnc_addPerFrameHandler;

[([format ["Confirm -$%1", _cost], "Confirm"] select (_budget == -1)), "Cancel", "Rotation"] call ACEFUNC(interaction,showMouseHint);

_player setVariable [
    QGVAR(Confirm),
    [
        _player,
        "DefaultAction",
        {GVAR(deployPFH) != -1},
        {[_this select 0] call FUNC(deployConfirm)}
    ] call ACEFUNC(common,addActionEventHandler)
];
