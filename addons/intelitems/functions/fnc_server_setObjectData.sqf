/*
 * Author: PabstMirror
 * Stores intel data on an object; storing attibutes from either 3den or zeus
 * Handles the QGVAR(setObjectData) event.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Data <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object, "x"] call acex_intelitems_fnc_server_setObjectData
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_intelObject", "_data"];
TRACE_2("params",_intelObject,_data);

private _type =  switch (true) do {
    case (typeOf _intelObject == QGVAR(DocumentObject)): {TYPE_DOCUMENT};
    case (typeOf _intelObject == QGVAR(PhotoObject)): {TYPE_PHOTO};
    case (typeOf _intelObject == QGVAR(NotepadObject)): {TYPE_NOTEPAD};
};

private _intelIndex = _intelObject getVariable [QGVAR(intelIndex), -1];

if (_intelIndex == -1) then {
    _intelIndex = [_type, _data] call FUNC(server_createIntelEntry);
    TRACE_1("Creating new index",_intelIndex);
    _intelObject setVariable [QGVAR(intelIndex), _intelIndex, true];
} else {
    TRACE_1("Updating existing index",_intelIndex);
    missionNamespace setVariable [(format [QGVAR(intel_%1), _intelIndex]), [_type, _data], true];
};
