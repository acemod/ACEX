/*
 * Author: PabstMirror
 * Handles setup module.
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [logic, [], true] call acex_fortify_fnc_setupModule
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic", "", "_activated"];
TRACE_2("setupModule",_logic,_activated);

// Note: no changes needed here for cba-setting switch
if (!isServer) exitWith {};
if (!_activated) exitWith {};


private _side = _logic getVariable ["Side", 1];
_side = switch (_side) do {
    case (1): {west};
    case (2): {east};
    case (3): {resistance};
    default {sideUnknown};
};

private _preset = _logic getVariable ["Preset", "small"];
_preset = switch (_preset) do {
    case (1): {"small"};
    case (2): {"medium"};
    case (3): {"big"};
    default {"?"};
};

private _budget = _logic getVariable ["Budget", -1];
if (!(_budget isEqualType 0)) then {_budget = 1234};

private _addToolItem = _logic getVariable ["AddToolItem", false];
if (!(_addToolItem isEqualType false)) then {_addToolItem = false};


private _objects = [_preset] call FUNC(getPlaceableSet);
[QGVAR(registerObjects), [_side, _budget, _objects]] call CBA_fnc_serverEvent;

if (_addToolItem) then {
    [{
        params ["_side"];
        TRACE_1("Adding tool",_side);
        {
            if (((side group _x) == _side) && {!("ACE_Fortify" in (items _x))}) then {
                _x addItem "ACE_Fortify";
            };
        } forEach allUnits;
    }, [_side], 3] call CBA_fnc_waitAndExecute;
};

INFO_4("Fortify Module Actived [Side: %1][Preset: %2][Budget: %3][AutoAdd: %4]",_side,_preset,_budget,_addToolItem);
