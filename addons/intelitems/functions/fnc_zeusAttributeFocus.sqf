/*
 * Author: PabstMirror
 * UI handler for the zeus attribute system (called from onSetFocus via the zeus attribute system)
 *
 * Arguments:
 * 0: Attribute Group Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [control] call acex_intelitems_fnc_zeusAttributeFocus
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;

params ["_control"];
TRACE_1("params",_control);

//Generic Init:
private _display = ctrlparent _control;
private _ctrlButtonOK = _display displayctrl 1; //IDC_OK
private _intelObject = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target", objnull];

_control ctrlRemoveAllEventHandlers "setFocus";

//Specific on-load stuff:
if (typeOf _intelObject == QGVAR(PhotoObject)) then {
    (_display displayCtrl 26468) ctrlSetText localize LSTRING(edit_photo);
};

private _intelIndex = _intelObject getVariable [QGVAR(intelIndex), -1];
TRACE_2("",_intelObject,_intelIndex);
if (_intelIndex != -1) then {
    (missionNamespace getVariable [format [QGVAR(intel_%1), _intelIndex], [-1,"-1"]]) params ["", "_data"];
    (_display displayCtrl 26469) ctrlSetText _data;
};

//Ok Button Confirm:
private _fnc_onConfirm = {
    params ["_ctrlButtonOK"];
    private _display = ctrlparent _ctrlButtonOK;
    private _intelObject = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target", objnull];
    private _newText = ctrlText (_display displayCtrl 26469);
    TRACE_2("onConfirm",_intelObject,_newText);

    //Send event to server:
    [QGVAR(setObjectData), [_intelObject, _newText]] call CBA_fnc_serverEvent;
};
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", _fnc_onConfirm];
