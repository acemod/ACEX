/*
 * Author: PabstMirror
 * Returns if player pickup intel object.
 *
 * Arguments:
 * 0: Target <Object>
 * 1: Player <Object>
 *
 * Return Value:
 * <BOOL>
 *
 * Example:
 * [cursorTarget, player] call acex_intelitems_fnc_canPickupIntelObject
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_intelObject", "_unit"];
TRACE_2("params",_intelObject,_unit);

private _magClassname = switch (true) do {
case (typeOf _intelObject == QGVAR(DocumentObject)): {QGVAR(Document);};
case (typeOf _intelObject == QGVAR(PhotoObject)): {QGVAR(Photo);};
case (typeOf _intelObject == QGVAR(NotepadObject)): {QGVAR(Notepad);};
    default {""};
};

if (_magClassname == "") exitWith {
    ERROR_2("Bad Type? [%1-%2]",_intelObject, typeOf _intelObject);
    false
};

_unit canAdd _magClassname
