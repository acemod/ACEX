/*
 * Author: PabstMirror
 * Creates a new intel entry and returns the index
 *
 * Arguments:
 * 0: Type <NUMBER>
 * 1: Data <STRING>
 *
 * Return Value:
 * Intel Index <NUMBER>
 *
 * Example:
 * [cursorTarget, player] call acex_intelitems_fnc_server_createIntelEntry
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_type", 0, [0]], ["_data", "", [""]]];
TRACE_2("params",_type,_data);

private _intelIndex = GVAR(intelCount);
GVAR(intelCount) = GVAR(intelCount) + 1;

missionNamespace setVariable [(format [QGVAR(intel_%1), _intelIndex]), [_type, _data], true];

TRACE_1("new data entry created",_intelIndex);
_intelIndex
