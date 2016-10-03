/*
 * Author: PabstMirror
 * Sets data in the data control group.  Used in both dialog and display modes.
 *
 * Arguments:
 * 0: Control Group <CONTROL>
 * 0: Intel Index <NUMBER>
 * 0: Is a interactive dialog <BOOL>
 * 0: Desired X Pos <NUMBER>
 * 0: Desired Y Pos <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cg, 1, false, 0.5, 0.5] call acex_intelitems_fnc_displayDataInControlGroup
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;

params ["_ctrlGroup", "_intelIndex", "_isDialog", "_cgPosX", "_cgPosY"];
TRACE_5("params",_ctrlGroup,_intelIndex,_isDialog,_cgPosX,_cgPosY);

private _intel = missionNamespace getVariable (format [QGVAR(intel_%1), _intelIndex]);
if (isNil "_intel") exitWith {ERROR_1("Bad data on intel index [%1]",_intelIndex);};
_intel params ["_type", "_data"];
TRACE_3("intel",_intelIndex,_type,_data);

private _cgPos = ctrlPosition _ctrlGroup;
_cgPos set [0, _cgPosX];
_cgPos set [1, _cgPosY];

switch (_type) do {
case (TYPE_DOCUMENT): {
        TRACE_1("Setting up document [contentText]",_data);
        (_ctrlGroup controlsGroupCtrl IDC_CONTENTEDIT) ctrlEnable false;
        (_ctrlGroup controlsGroupCtrl IDC_CONTENTEDIT) ctrlShow false;

        //For some reason, we need to delay a frame or the line spacing will be broken
        [{
            params ["_ctrl", "_data"];
            TRACE_2("delaySet",_ctrl,_data);
            _ctrl ctrlSetText _data;
        }, [(_ctrlGroup controlsGroupCtrl IDC_CONTENTTEXT), _data]] call CBA_fnc_execNextFrame;

        (_ctrlGroup controlsGroupCtrl IDC_CONTENTPICTURE) ctrlEnable false;
        (_ctrlGroup controlsGroupCtrl IDC_CONTENTPICTURE) ctrlShow false;
    };
case (TYPE_PHOTO): {
        TRACE_1("Setting up photo [contentPicture]",_data);
        (_ctrlGroup controlsGroupCtrl IDC_CONTENTEDIT) ctrlEnable false;
        (_ctrlGroup controlsGroupCtrl IDC_CONTENTEDIT) ctrlShow false;

        //Show the contentText, so it can capture the mouse clicks
        (_ctrlGroup controlsGroupCtrl IDC_CONTENTTEXT) ctrlEnable true;
        (_ctrlGroup controlsGroupCtrl IDC_CONTENTTEXT) ctrlShow true;

        (_ctrlGroup controlsGroupCtrl IDC_CONTENTPICTURE) ctrlSetText _data;

        //Photo shown as square (new width):
        _cgPos set [2, (3/4) * 0.5 * safezoneH]; //Update control group's width (and return)
    };
case (TYPE_NOTEPAD): {
        if (_isDialog) then {
            TRACE_2("Setting up notepad [contentEdit]",_data,_isDialog);
            [{
                params ["_ctrl", "_data"];
                TRACE_2("delaySet",_ctrl,_data);
                _ctrl ctrlSetText _data;
                ctrlSetFocus _ctrl;
            }, [(_ctrlGroup controlsGroupCtrl IDC_CONTENTEDIT), _data]] call CBA_fnc_execNextFrame;

            (_ctrlGroup controlsGroupCtrl IDC_CONTENTTEXT) ctrlEnable false;
            (_ctrlGroup controlsGroupCtrl IDC_CONTENTTEXT) ctrlShow false;
        } else {
            TRACE_2("Setting up notepad [contentText]",_data,_isDialog);
            (_ctrlGroup controlsGroupCtrl IDC_CONTENTEDIT) ctrlEnable false;
            (_ctrlGroup controlsGroupCtrl IDC_CONTENTEDIT) ctrlShow false;

            [{
                params ["_ctrl", "_data"];
                TRACE_2("delaySet",_ctrl,_data);
                _ctrl ctrlSetText _data;
                ctrlSetFocus _ctrl;
            }, [(_ctrlGroup controlsGroupCtrl IDC_CONTENTTEXT), _data]] call CBA_fnc_execNextFrame;
        };
        (_ctrlGroup controlsGroupCtrl IDC_CONTENTPICTURE) ctrlEnable false;
        (_ctrlGroup controlsGroupCtrl IDC_CONTENTPICTURE) ctrlShow false;

        (_ctrlGroup controlsGroupCtrl IDC_PAPERBACKGROUND) ctrlSetText "#(argb,8,8,3)color(0.97,0.91,0.77,1)";
    };
};

//Set the cg to it' size:
_ctrlGroup ctrlSetPosition _cgPos;
_ctrlGroup ctrlCommit 0;

//Set the cg elements to the correct size for the cg:
{
    private _ctrlPos = if (_x == IDC_BORDER) then {
        [0, 0, _cgPos select 2, _cgPos select 3]
    } else {
        [1*pixelW, 1*pixelH, (_cgPos select 2) - (2 * pixelW), (_cgPos select 3) - (2 * pixelH)]
    };
    (_ctrlGroup controlsGroupCtrl _x) ctrlSetPosition _ctrlPos;
    (_ctrlGroup controlsGroupCtrl _x) ctrlCommit 0;
} forEach [IDC_BORDER, IDC_PAPERBACKGROUND, IDC_CONTENTPICTURE, IDC_CONTENTEDIT, IDC_CONTENTTEXT]; //Set Paper, Picture and Dummy Text to same size


(_ctrlGroup controlsGroupCtrl IDC_BORDER) ctrlSetText "#(argb,8,8,3)color(0,0,0,1)";

//Return width of cg:
(_cgPos select 2)
