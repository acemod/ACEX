/*
 * Author: PabstMirror
 * Handles the QGVAR(requestMagIndex) request for info on a magazine ID
 * If the mag does not have a index, a new one is created
 *
 * Arguments:
 * 0: MagID <STRING>
 * 1: Type <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["x:2", 0] call acex_intelitems_fnc_server_handleRequestMagIndex
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_magID", "_type"];
TRACE_2("params",_magID,_type);

private _intelIndex = GVAR(intelMap) getVariable _magID;
if (isNil "_intelIndex") then {
    TRACE_1("Creating New Index with blank data",_magID);
    _intelIndex = [_type, ""] call FUNC(server_createIntelEntry);
    GVAR(intelMap) setVariable [_magID, _intelIndex];
};

[QGVAR(recieveMagIndex), [_magID, _intelIndex]] call CBA_fnc_globalEvent;
