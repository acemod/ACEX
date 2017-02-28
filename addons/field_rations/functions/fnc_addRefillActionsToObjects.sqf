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
            private _action = [_x, _actionText, _picture, LINKFUNC(actionRefillFromWaterSource), LINKFUNC(canRefillFromWaterSource), {}, _x] call ACEFUNC(interact_menu,createAction);
            _actions pushBack [_action, [], _player];
        };
    } forEach (items _player);
    _actions
};

{
    _x params ["_classname", ["_tapLocation", [0,0,0]]];

    private _cfg = configFile >> "CfgVehicles" >> _classname;
    TRACE_3("Adding refil action",isClass _cfg,_classname,_tapLocation);

    if (isClass _cfg) then {
        _action = [QGVAR(refill), (format [localize LSTRING(RefillX), ""]), QUOTE(PATHTOF(ui\hud_drinkstatus2.paa)), {}, {true}, _fncGetChildren, [], _tapLocation, 4] call ACEFUNC(interact_menu,createAction);
        [_classname, 0, [], _action] call ACEFUNC(interact_menu,addActionToClass);
    };
} forEach WATER_SOURCES;
