/*
 * Author: PabstMirror
 * Toggle or open an intel display.
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Force open dialog <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cg, false] call acex_intelitems_fnc_onIntelButtonClick
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_ctrl", "_force"];
TRACE_2("params",_ctrl,_force);

if (dialog) exitWith {TRACE_1("dialog open",dialog);};

private _intelIndex = _ctrl getVariable [QGVAR(intelIndex), -1];
TRACE_1("",_intelIndex);
if (_intelIndex < 0) exitWith {ERROR_1("Bad data on ctrl",_intelIndex);};

private _justToggle = false;
//If we just hit the bottom buttons, just toggle off if already displayed:
if (!_force) then {
    GVAR(mapDisplays) = GVAR(mapDisplays) select {
        _x params ["_localData", "_mapCtrl"];
        _localData params ["_xIntelIndex"];

        if (_xIntelIndex == _intelIndex) exitWith {
            _justToggle = true;

            TRACE_2("closing display, dialog open",_xIntelIndex,_mapCtrl);
            ctrlDelete _mapCtrl;
            false
        };
        true
    };
};
if (_justToggle) exitWith {};

[_intelIndex] call FUNC(dialogOpen);
