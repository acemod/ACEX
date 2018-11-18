#include "script_component.hpp"
/*
 * Author: Jonpas
 * Adds sit actions.
 *
 * Arguments:
 * 0: Seat <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [seat] call acex_sitting_fnc_addSitActions
 *
 * Public: No
 */

params ["_seat"];

private "_type";
if((typeName _seat) isEqualTo "OBJECT") then {
    _type = typeOf _seat;
} else {
    _type = _seat;
};

// Exit if sitting disabled or the object is not specified as a seat
if (!GVAR(enable) || {getNumber (configFile >> "CfgVehicles" >> _type >> QGVAR(canSit)) != 1}) exitWith {};

// Exit if class already initialized
if (_type in GVAR(initializedClasses)) exitWith {};
GVAR(initializedClasses) pushBack _type;

TRACE_1("Adding Sit Action",_type);

private _configFile = configFile >> "CfgVehicles" >> _type;
private _sitPosition = getArray (_configFile >> QGVAR(sitPosition));
private _interactPosition = getArray (_configFile >> QGVAR(interactPosition));

if (typeName (_sitPosition select 0) isEqualTo "ARRAY") then {

    {
        private "_menuPosition";
        private "_menuType";
        if(count _interactPosition >= _forEachIndex) then {
            _menuPosition = _interactPosition select _forEachIndex;
            _menuType = [];
        } else {
            _menuPosition = [0,0,0];
            _menuType = ["ACE_MainActions"];
        };

        TRACE_3("Menu Position",_menuPosition,_menuType,_forEachIndex);

        private _sitAction = [
            format["%1_pos_%2",QGVAR(Sit),_forEachIndex],
            localize LSTRING(Sit),
            QUOTE(PATHTOF(UI\sit_ca.paa)),
            { _this call FUNC(sitMultiPos)},
            { _this call FUNC(canSitMultiPos)},
            {},
            _forEachIndex,
            _menuPosition,
            1.5
        ] call ACEFUNC(interact_menu,createAction);
        [_type, 0, _menuType, _sitAction] call ACEFUNC(interact_menu,addActionToClass);

    } forEach _sitPosition;

} else {

    private "_menuPosition";
    private "_menuType";
    if !(_interactPosition isEqualTo []) then {
        _menuPosition = _interactPosition;
        _menuType = [];
    } else {
        _menuPosition = [0,0,0];
        _menuType = ["ACE_MainActions"];
    };

    private _sitAction = [
        QGVAR(Sit),
        localize LSTRING(Sit),
        QUOTE(PATHTOF(UI\sit_ca.paa)),
        {_this call FUNC(sit)},
        {_this call FUNC(canSit)},
        {},
        [],
        _menuPosition,
        1.5
    ] call ACEFUNC(interact_menu,createAction);
    [_type, 0, _menuType, _sitAction] call ACEFUNC(interact_menu,addActionToClass);
};