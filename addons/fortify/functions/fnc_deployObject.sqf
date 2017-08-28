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
 * [player, player, [west, "Land_BagBunker_Small_F"]] call acex_fortify_fnc_deployObject
 *
 * Public: No
 */

#include "script_component.hpp"

params ["", "_player", "_params"];
_params params [["_side", sideUnknown, [sideUnknown]], ["_classname", "", [""]], ["_rotations", [0,0,0]]];
TRACE_4("deployObject",_player,_side,_classname,_rotations);

// TODO Needs a better way to check if the objects has any "seats" the AI/players can use
private _isStatic = getArray (configFile >> "CfgVehicles" >> _classname >> "weapons") isEqualTo [];

// TODO Needs a more reliable way to check if the object is lamp / has light sources
private _isLamp = getText (configFile >> "CfgVehicles" >> _classname >> "editorSubcategory") == "EdSubcat_Lamps";

private _budget = [_side] call FUNC(getBudget);
private _cost = [_side, _classname] call FUNC(getCost);
private _object = _classname createVehicle [0, 0, 0];

if (_isStatic && {!_isLamp}) then {
    [QACEGVAR(common,enableSimulationGlobal), [_object, false]] call CBA_fnc_serverEvent;
};

_object disableCollisionWith _player;

GVAR(objectRotationX) = _rotations select 0;
GVAR(objectRotationY) = _rotations select 1;
GVAR(objectRotationZ) = _rotations select 2;

GVAR(isPlacing) = PLACE_WAITING;
[([format ["Confirm -$%1", _cost], "Confirm"] select (_budget == -1)), "Cancel", "Rotation"] call ACEFUNC(interaction,showMouseHint);
private _mouseClickID = [_player, "DefaultAction", {GVAR(isPlacing) == PLACE_WAITING}, {GVAR(isPlacing) = PLACE_APPROVE}] call ACEFUNC(common,addActionEventHandler);

[{
    params ["_args", "_pfID"];
    _args params ["_unit", "_object", "_cost", "_mouseClickID"];

    if ((_unit != ACE_player) || {!([_unit, _object, []] call EFUNC(common,canInteractWith))} || {!([_unit, _cost] call FUNC(canFortify))}) then {
        GVAR(isPlacing) = PLACE_CANCEL;
    };
    if (GVAR(isPlacing) != PLACE_WAITING) exitWith {
        TRACE_3("exiting PFEH",GVAR(isPlacing),_pfID,_mouseClickID);
        [_pfID] call CBA_fnc_removePerFrameHandler;
        call ACEFUNC(interaction,hideMouseHint);
        [_unit, "DefaultAction", _mouseClickID] call ACEFUNC(common,removeActionEventHandler);

        if (GVAR(isPlacing) == PLACE_APPROVE) then {
            TRACE_1("deploying object",_object);
            GVAR(isPlacing) = PLACE_CANCEL;
            [_unit, _object] call FUNC(deployConfirm);
        } else {
            TRACE_1("deleting object",_object);
            deleteVehicle _object;
        };
    };


    ([_object] call FUNC(axisLengths)) params ["_width", "_length", "_height"];

    private _distance = _width max _length;
    private _start = eyePos _unit;
    private _camViewDir = getCameraViewDirection _unit;
    private _basePos = (_start vectorAdd (_camViewDir vectorMultiply _distance));
    _basePos set [2, ((_basePos select 2) - (_height / 2)) max ((getTerrainHeightASL _basePos) - 0.05)];

    _object setPosASL _basePos;

    private _vZ =  180 + GVAR(objectRotationZ) + getDir _unit;
    if (cba_events_alt) then {
        // Snap to terrain surface dir
        _object setDir _vZ;
        _object setVectorUp (surfaceNormal _basePos);
    } else {
        [_object, GVAR(objectRotationX), GVAR(objectRotationY), _vZ] call ACEFUNC(common,setPitchBankYaw);
    };
    #ifdef DEBUG_MODE_FULL
    hintSilent format ["Rotation:\nX: %1\nY: %2\nZ: %3", GVAR(objectRotationX), GVAR(objectRotationY), GVAR(objectRotationZ)];
    #endif
}, 0, [_player, _object, _cost, _mouseClickID]] call CBA_fnc_addPerFrameHandler;

