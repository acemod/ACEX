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
    ["_classname", "", [""]]
];

private _object = createVehicle [_classname, [0, 0, 0], [], 0, "NONE"];

_player setVariable [QGVAR(deployedObject), _object];
_player setVariable [QGVAR(isDeploying), true];

[QACEGVAR(common,enableSimulationGlobal), [_object, false]] call CBA_fnc_serverEvent;

GVAR(deployDirection) = 0;

GVAR(deployPFH) = [{
    (_this select 0) params ["_unit", "_object"];

    private _boundingBox = boundingBoxReal _object;
    _boundingBox params ["_p1", "_p2"];
    private _maxWidth = abs ((_p2 select 0) - (_p1 select 0));
    private _maxLength = abs ((_p2 select 1) - (_p1 select 1));
    private _distance = _maxWidth max _maxLength;

    private _basePos = eyePos _unit vectorAdd ([
        sin getDir _unit,
        +cos getDir _unit,
        (getCameraViewDirection _unit select 2)
    ] vectorMultiply _distance);

    private _angle = (GVAR(deployDirection) + getDir _unit);
    private _v3 = surfaceNormal _basePos;
    private _v2 = [sin _angle, +cos _angle, 0] vectorCrossProduct _v3;
    private _v1 = _v3 vectorCrossProduct _v2;

    _basePos set [2, getTerrainHeightASL _basePos];
    _object setPosASL _basePos;
    _object setVectorDirAndUp [_v1, _v3];
}, 0, [_player, _object]] call CBA_fnc_addPerFrameHandler;

["Confirm", "Cancel", "Direction"] call ACEFUNC(interaction,showMouseHint);

_player setVariable [
    QGVAR(Confirm),
    [
        _player,
        "DefaultAction",
        {GVAR(deployPFH) != -1},
        {[_this select 0] call FUNC(deployConfirm)}
    ] call ACEFUNC(common,addActionEventHandler)
];
