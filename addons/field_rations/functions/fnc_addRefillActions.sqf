#include "script_component.hpp"

// Get config based classes for water sources to allow addition of more sources
private _filter = QUOTE(getNumber (_x >> 'scope') == 2 && {getNumber (_x >> QQGVAR(refillSource)) > 0});
private _waterSources = _filter configClasses (configFile >> "CfgVehicles");

private _fnc_getChildren = {
    params ["", "_player"];

    private _actions = [];
    {
        private _cfg = configFile >> "CfgWeapons" >> _x;

        // Every item that can be refilled, will have an action
        if (isClass _cfg && {getText (_cfg >> QGVAR(onRefill)) != ""}) then {
            private _displayName = getText (_cfg >> "displayName");
            private _picture = getText (_cfg >> "picture");
            private _actionText = format ["Refill %1", _displayName]; // TODO: localize
            private _action = [_x, _actionText, _picture, LINKFUNC(refillItem), LINKFUNC(canRefillItem), {}, _x] call ACEFUNC(interact_menu,createAction);
            _actions pushBack [_action, [], _player];
        };
    } forEach (items _player);

    _actions
};

{
    private _classname = configName _x;
    private _refillLocation = if (isArray (_x >> QGVAR(refillLocation))) then {getArray (_x >> QGVAR(refillLocation))} else {[0, 0, 0]};

    LOG_2("Adding refill action to %1 at %2",_classname,_refillLocation);
    private _action = [QGVAR(refill), "Refill", "", {}, {true}, _fnc_getChildren, [], _refillLocation, 4] call ACEFUNC(interact_menu,createAction); // TODO: localize
    [_classname, 0, [], _action] call ACEFUNC(interact_menu,addActionToClass);
} forEach _waterSources;
