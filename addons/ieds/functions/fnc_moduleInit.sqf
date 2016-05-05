/*
 * Author: Glowbal
 *
 * Arguments:
 * 0:  <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if (!local _logic) exitwith {};

private _collectObjects = {
    params ["_logic"];

    private _collection = synchronizedObjects _logic;
    {
        if !(_x in _totalCollection) then {
            if (typeOf _x == QGVAR(createIed)) then {
                if !(_x getvariable [QGVAR(masterIED), false]) then {
                    _x setvariable [QGVAR(subIED), true];
                    _x setvariable [QGVAR(controlledByIED), _logic];
                    _totalCollection pushback _x;
                    [_x] call _collectObjects;
                };
            } else {
                if (typeOf _x == "cseModule_triggerManLinkIEDS") then {
                    _list = _x getvariable ["EnableList",""];
                    _list = "[" + _list + "]";
                    _parsedList = [] call compile _list;
                    _triggerManList = (_logic getvariable [QGVAR(triggerManUnits), []]) + _parsedList;
                    _logic setvariable [QGVAR(triggerManUnits), _triggerManList];
                };
            };
        };
    }foreach _collection;
};

if !(_logic getvariable [QGVAR(subIED),false]) then {
    _logic setvariable [QGVAR(masterIED), true];
    private _totalCollection = [_logic];
    [_logic] call _collectObjects;
    _logic setvariable [QGVAR(collection), _totalCollection];
};

[_logic] call FUNC(createIEDObject);

private _activatedTargets = switch (_logic getvariable ["activatedForTargets", -1]) do {
    case 0: {["CaManBase", "Air", "Car", "Motorcycle", "Tank"]};
    case 1: {["Air", "Car", "Motorcycle", "Tank"]};
    case 2: {["Car", "Motorcycle", "Tank"]};
    case 3: {["Air"]};
    case 4: {["CaManBase"]};
    default {[]};
};
_logic setvariable ["activatedForTargets", _activatedTargets];

private _activatedSides = switch (_logic getvariable ["activatedForSides", -1]) do {
    case 0: {[west, east, independent, civilian, sideEnemy, sideFriendly]};
    case 1: {[west, sideEnemy]};
    case 2: {[east, sideEnemy]};
    case 3: {[independent, sideEnemy]};
    case 4: {[civilian, sideEnemy]};
    default {[]};
};

_logic setvariable ["activatedForSides", _activatedSides, true];
_logic setvariable ["iedActivationType", _logic getvariable ["iedActivationType", 0], true];
