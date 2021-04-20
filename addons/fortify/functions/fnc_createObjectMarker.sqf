#include "script_component.hpp"

/*
 * Author: Seb
 * Creates a map marker for a created static object but only for sides friendly to the creator side
 *
 * Arguments:
 * 0: Created fortify object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * _object call acex_fortify_fnc_createObjectMarker
 *
 * Public: Yes
 */

params ["_object"];

// Get Object size and direction
private _bbr = 0 boundingBoxReal _object;
private _p1 = _bbr select 0;
private _p2 = _bbr select 1;
private _maxWidth = abs ((_p2 select 0) - (_p1 select 0));
private _maxLength = abs ((_p2 select 1) - (_p1 select 1));
private _direction = getDir _object;

// Marker name unique to this object
private _markerNameStr = format ["acex_fortify_marker_%1", _object];

// Create marker, set alpha using global event
private _marker = createMarker [_markerNameStr, _object];
_marker setMarkerShapeLocal "RECTANGLE";
_marker setMarkerBrushLocal "SolidFull";
_marker setMarkerSizeLocal [(_maxWidth / 2),(_maxLength / 2)];
_marker setMarkerDirLocal _direction;
_marker setMarkerColor "ColorGrey";
_object setVariable [QGVAR(mapMarker), _marker, true];
// Marker Alpha set in EH:
private _jipID = [QGVAR(setMarkerVisible), _object] call CBA_fnc_globalEventJIP;
[_jipID, _object] call CBA_fnc_removeGlobalEventJIP;

_object addEventHandler ["Deleted", {
    params ["_object"];
    private _marker = _object getVariable QGVAR(mapMarker);
    deleteMarker _marker;
}];
