/*
 * Author: Glowbal, PabstMirror
 * Adds refill water actions to water sources
 * Needs to be done dynamicly as these map objects may not exist depending on mods
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None <Nil>
 *
 * Example:
 * [] call acex_field_rations_fnc_addRefillActionsToObjects
 *
 * Public: No
 */
#include "script_component.hpp"

//Function to get the refil actiosn for all water containers:
private _fncGetChildren = {
    params ["", "_player"];

    private _actions = [];
    {
        private _cfg = configFile >> "CfgWeapons" >> _x;

        // Construct the children actions. Every item that we can refill, will receive a refill action.
        if ((isClass _cfg) && {(getText (_cfg >> QGVAR(onRefill))) != ""}) then {
            private _displayName = getText (_cfg >> "displayName");
            private _picture = getText (_cfg >> "picture");
            private _actionText = format [localize LSTRING(RefillX), _displayName];
            private _action = [_x, _actionText, _picture, {_this call FUNC(actionRefillFromWaterSource)}, {_this call FUNC(canRefillFromWaterSource)}, {}, _x] call ace_interact_menu_fnc_createAction;
            _actions pushBack [_action, [], _player];
        };
    } forEach (items _player);
    _actions
};

{
    _x params ["_classname", ["_tapLocation", [0,0,0]]];

    private _cfg = configFile >> "CfgVehicles" >> _classname;
    TRACE_3("Adding refil action", (isClass _cfg), _classname, _tapLocation);

    if (isClass _cfg) then {
        _action = [QGVAR(refill), (localize LSTRING(refillWater)), QUOTE(PATHTOF(ui\hud_drinkstatus2.paa)), {}, {true}, _fncGetChildren, [], _tapLocation, 4] call ace_interact_menu_fnc_createAction;
        [_classname, 0, [], _action] call ace_interact_menu_fnc_addActionToClass;
    };
} forEach WATER_SOURCES;
