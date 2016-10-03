/*
 * Author: PabstMirror
 * Opens an interactive dialog
 *
 * Arguments:
 * 0: Intel Index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1] call acex_intelitems_fnc_dialogOpen
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;

params ["_intelIndex"];
TRACE_1("params",_intelIndex);

//Close map display if open (need to delay a frame!)
[{
    params ["_intelIndex"];
    TRACE_1("closing display if exists",_intelIndex);
    GVAR(mapDisplays) = GVAR(mapDisplays) select {
        _x params ["_localData", "_mapCtrl"];
        _localData params ["_xIntelIndex"];
        if (_xIntelIndex == _intelIndex) then {
            TRACE_2("closing display, dialog open",_xIntelIndex,_mapCtrl);
            ctrlDelete _mapCtrl;
            false
        } else {
            true
        };
    };
}, [_intelIndex]] call CBA_fnc_execNextFrame;

private _controlGroupPosX = 0 * safezoneW + safezoneX;
private _controlGroupPosY = 0.25 * safezoneH + safezoneY;
private _found = false;
{
    _x params ["_xIntelIndex", "_xControlGroupPosX", "_xControlGroupPosY"];
    if (_intelIndex == _xIntelIndex) exitWith {
        TRACE_1("Found Entry For Intel",_intelIndex);
        _found = true;
        _controlGroupPosX = _xControlGroupPosX;
        _controlGroupPosY = _xControlGroupPosY;
    };
} forEach GVAR(localDataInfo);

if (!_found) then {
    TRACE_1("New Local Entry For Intel",_intelIndex);
    GVAR(localDataInfo) pushBack [_intelIndex, _controlGroupPosX, _controlGroupPosY];
};

createDialog QGVAR(dialog);

_display = uiNamespace getVariable [QGVAR(dialog), displayNull];
_display setVariable [QGVAR(intelIndex), _intelIndex];
TRACE_1("setting up dialog",_display);

private _ctrlGroup = _display displayCtrl IDC_CG;

//Set control Group with data, and pos, it will return it's width
private _width = [_ctrlGroup, _intelIndex, true, _controlGroupPosX, _controlGroupPosY] call FUNC(displayDataInControlGroup);

//Top Bar
private _pos = [_controlGroupPosX, _controlGroupPosY - 16 * pixelH, _width, 17 * pixelH];
(_display displayCtrl IDC_TOPBAR) ctrlSetPosition _pos;
switch ((missionNamespace getVariable (format [QGVAR(intel_%1), _intelIndex])) select 0) do {
    case (TYPE_DOCUMENT): {(_display displayCtrl IDC_TOPBAR) ctrlSetText localize LSTRING(Document_displayName)};
    case (TYPE_PHOTO): {(_display displayCtrl IDC_TOPBAR) ctrlSetText localize LSTRING(Photo_displayName)};
    case (TYPE_NOTEPAD): {(_display displayCtrl IDC_TOPBAR) ctrlSetText localize LSTRING(Notepad_displayName)};
};
(_display displayCtrl IDC_TOPBAR) ctrlSetFontHeight (17 * pixelH);
(_display displayCtrl IDC_TOPBAR) ctrlCommit 0;

//Close Button:
_pos = [_controlGroupPosX + _width - 17 * pixelW, _controlGroupPosY - 16 * pixelH, 17 * pixelW, 17 * pixelH];
(_display displayCtrl IDC_CLOSEBUTTON) ctrlSetPosition _pos;
(_display displayCtrl IDC_CLOSEBUTTON) ctrlCommit 0;
