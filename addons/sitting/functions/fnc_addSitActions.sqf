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
#define DEBUG_MODE_FULL
#include "script_component.hpp"
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
	private _sitAction = [
	    QGVAR(Sit),
	    localize LSTRING(Sit),
	    QUOTE(PATHTOF(UI\sit_ca.paa)),
	    {_this call FUNC(sit)},
	    {_this call FUNC(canSit)},
	    {},
	    [],
	    [0, 0, 0],
	    1.5
	] call ACEFUNC(interact_menu,createAction);
	[_type, 0, ["ACE_MainActions"], _sitAction] call ACEFUNC(interact_menu,addActionToClass);
};

/*
 * Arguments:
 * 0: Action name <STRING>
 * 1: Name of the action shown in the menu <STRING>
 * 2: Icon <STRING>
 * 3: Statement <CODE>
 * 4: Condition <CODE>
 * 5: Insert children code <CODE> (Optional)
 * 6: Action parameters <ANY> (Optional)
 * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
 * 8: Distance <NUMBER> (Optional)
 * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
 * 10: Modifier function <CODE> (Optional)
 */
