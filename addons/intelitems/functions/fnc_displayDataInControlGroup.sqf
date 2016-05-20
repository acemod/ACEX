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
if (isNil "_intel") exitWith {ACE_LOGERROR_1("Bad data on intel index [%1]",_intelIndex);};
_intel params ["_type", "_data"];
TRACE_3("intel",_intelIndex,_type,_data);

private _cgPos = ctrlPosition _ctrlGroup;

switch (_type) do {
case (TYPE_DOCUMENT): {
        TRACE_1("Setting up document [contentText]",_data);
        (_ctrlGroup controlsGroupCtrl 724346) ctrlEnable false;
        (_ctrlGroup controlsGroupCtrl 724346) ctrlShow false;

        (_ctrlGroup controlsGroupCtrl 724347) ctrlSetText _data;

        (_ctrlGroup controlsGroupCtrl 724345) ctrlEnable false;
        (_ctrlGroup controlsGroupCtrl 724345) ctrlShow false;
    };
case (TYPE_PHOTO): {
        TRACE_1("Setting up photo [contentPicture]",_data);
        (_ctrlGroup controlsGroupCtrl 724346) ctrlEnable false;
        (_ctrlGroup controlsGroupCtrl 724346) ctrlShow false;

        //Show the contentText, so it can capture the mouse clicks
        (_ctrlGroup controlsGroupCtrl 724347) ctrlEnable true;
        (_ctrlGroup controlsGroupCtrl 724347) ctrlShow true;

        (_ctrlGroup controlsGroupCtrl 724345) ctrlSetText _data;

        //Photo shown as square (new width):
        {
            private _pos = ctrlPosition (_ctrlGroup controlsGroupCtrl _x);
            _pos set [2, (3/4) * 0.5 * safezoneH];
            (_ctrlGroup controlsGroupCtrl _x) ctrlSetPosition _pos;
            (_ctrlGroup controlsGroupCtrl _x) ctrlCommit 0;
        } forEach [724341, 724345, 724347]; //Set Paper, Picture and Dummy Text to same size
        _cgPos set [2, (3/4) * 0.5 * safezoneH]; //Update control group's width (and return)
    };
case (TYPE_NOTEPAD): {
        if (_isDialog) then {
            TRACE_2("Setting up notepad [contentEdit]",_data,_isDialog);
            (_ctrlGroup controlsGroupCtrl 724346) ctrlSetText _data;
            ctrlSetFocus (_ctrlGroup controlsGroupCtrl 724346);

            (_ctrlGroup controlsGroupCtrl 724347) ctrlEnable false;
            (_ctrlGroup controlsGroupCtrl 724347) ctrlShow false;
        } else {
            TRACE_2("Setting up notepad [contentText]",_data,_isDialog);
            (_ctrlGroup controlsGroupCtrl 724346) ctrlEnable false;
            (_ctrlGroup controlsGroupCtrl 724346) ctrlShow false;

            (_ctrlGroup controlsGroupCtrl 724347) ctrlSetText _data;
        };
        (_ctrlGroup controlsGroupCtrl 724345) ctrlEnable false;
        (_ctrlGroup controlsGroupCtrl 724345) ctrlShow false;

        _returnWidth = 1;
    };
};

_cgPos set [0, _cgPosX];
_cgPos set [1, _cgPosY];
_ctrlGroup ctrlSetPosition _cgPos;
_ctrlGroup ctrlCommit 0;

//Return width:
(_cgPos select 2)
