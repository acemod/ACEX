/*
 * Author: PabstMirror
 * On interactive dialog close
 *
 * Arguments:
 * 0: Attribute Group Control <DISPLAY>
 * 1: Exit Code <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [display, 55] call acex_intelitems_fnc_dialogClose
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;

params ["_display", "_exitCode"];
TRACE_2("params",_display,_exitCode);
//0 is close/X button, 2 when hitting escape, 55 is off click

private _intelIndex = _display getVariable [QGVAR(intelIndex), -1];
private _intel = missionNamespace getVariable (format [QGVAR(intel_%1), _intelIndex]);
if (isNil "_intel") exitWith {ERROR_1("Bad data on intel index [%1]",_intelIndex);};
_intel params ["_type", "_data"];
TRACE_3("intel",_intelIndex,_type,_data);

private _localData = [];
{
    _x params ["_xIntelIndex", "_xControlGroupPosX", "_xControlGroupPosY"];
    if (_intelIndex == _xIntelIndex) exitWith {
        TRACE_1("Found Entry For Intel",_intelIndex);
        _localData = _x;
    };
} forEach GVAR(localDataInfo);
if (_localData isEqualTo []) exitWith {ERROR_1("No Local Data on Index [%1]",_intelIndex);};

//Update Data (if changed)
if (_type == TYPE_NOTEPAD) then { //Only notepads can update their data
    private _ctrlText = ctrlText (_display displayCtrl IDC_CONTENTEDIT);
    if (_data != _ctrlText) then {
        TRACE_2("updating data",_ctrlText,_data);
        missionNamespace setVariable [(format [QGVAR(intel_%1), _intelIndex]), [_type, _ctrlText], true];
    };
};

//Update Position:
private _pos = ctrlPosition (_display displayCtrl IDC_CG);
_localData set [1, _pos select 0];
_localData set [2, _pos select 1];
TRACE_1("",_localData);

private _shownAsDisplay = (_exitCode == 55);
TRACE_2("",_exitCode,_shownAsDisplay);
if (_shownAsDisplay) then {
    GVAR(mapDisplays) pushBack [_localData, controlNull];
};

GVAR(nextMapUpdate) = 0; //Trigger an immiediate map redraw
