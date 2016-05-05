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
 * [] call ace_field_rations_fnc_addRefillActionsToObjects
 *
 * Public: No
 */
#include "script_component.hpp"

#define WATER_SOURCES [\
    ["Land_Barrel_water"],\
    ["Land_BarrelWater_F"],\
    ["Land_stand_waterl_EP1"],\
    ["Land_Reservoir_EP1"],\
    ["Land_Misc_Well_C_EP1"],\
    ["Land_Misc_Well_L_EP1"]]

//Function to get the refil actiosn for all water containers:
local _fncGetChildren = {
    params ["", "_player"];

    local _actions = [];
    {
        local _cfg = configFile >> "CfgWeapons" >> _x;

        // Construct the children actions. Every item that we can refill, will receive a refill action.
        if ((isClass _cfg) && {(getText (_cfg >> QGVAR(onRefill))) != ""}) then {
            local _displayName = getText (_cfg >> "displayName");
            local _picture = getText (_cfg >> "picture");
            local _actionText = format [localize LSTRING(RefillX), _displayName];
            local _action = [_x, _actionText, _picture, {_this call FUNC(actionRefillFromWaterSource)}, {_this call FUNC(canRefillFromWaterSource)}, {}, _x] call EFUNC(interact_menu,createAction);
            _actions pushBack [_action, [], _player];
        };
    } forEach (items _player);
    _actions
};

{
    _x params ["_classname", ["_tapLocation", [0,0,0]]];

    local _cfg = configFile >> "CfgVehicles" >> _classname;
    TRACE_3("Adding refil action", (isClass _cfg), _classname, _tapLocation);

    if (isClass _cfg) then {
        _action = [QGVAR(refill), (localize LSTRING(refillWater)), QUOTE(PATHTOF(ui\hud_drinkstatus2.paa)), {}, {true}, _fncGetChildren, [], _tapLocation, 4] call EFUNC(interact_menu,createAction);
        [_classname, 0, [], _action] call EFUNC(interact_menu,addActionToClass);
    };
} forEach WATER_SOURCES;
