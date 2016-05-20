/*
 * Author: PabstMirror
 * Picks up an intel object and converts it into a unique magazine
 *
 * Arguments:
 * 0: Target <Object>
 * 1: Player <Object>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget, player] call acex_intelitems_fnc_pickupIntelObject
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_intelObject", "_unit"];
TRACE_2("params",_intelObject,_unit);

private _type = -1;
private _magClassname = "";
switch (true) do {
case (typeOf _intelObject == QGVAR(DocumentObject)): {
        _type = TYPE_DOCUMENT;
        _magClassname = QGVAR(Document);
    };
case (typeOf _intelObject == QGVAR(PhotoObject)): {
        _type = TYPE_PHOTO;
        _magClassname = QGVAR(Photo);
    };
case (typeOf _intelObject == QGVAR(NotepadObject)): {
        _type = TYPE_NOTEPAD;
        _magClassname = QGVAR(Notepad);
    };
};

private _intelIndex = _intelObject getVariable [QGVAR(intelIndex), -1];

private _before = [_unit, _magClassname] call CBA_fnc_getMagazineIndex;
_unit addMagazine _magClassname;
private _after = [_unit, _magClassname] call CBA_fnc_getMagazineIndex;

private _new = _after - _before;
if ((count _new) != 1) exitWith {ACE_LOGERROR_2("MAG NOT ADDED - Before[%1] After[%2]",_before,_after);};
private _newMagID = _new select 0;


deleteVehicle _intelObject; //Delete the object as it now exists as a magazine

if (_intelIndex < 0) then {
    TRACE_2("no index on object",_intelObject,_intelIndex);
    GVAR(dataRequested) pushBack _newMagID;
    TRACE_1("sending request for index",_newMagID); //Will create a new intel entry
    [QGVAR(requestMagIndex), [_newMagID, _type]] call CBA_fnc_serverEvent;
} else {
    //Send mag id to everyone
    [QGVAR(recieveMagIndex), [_newMagID, _intelIndex]] call CBA_fnc_globalEvent;
};

GVAR(nextMapUpdate) = 0;
