#include "script_component.hpp"

if !(hasInterface) exitWith {};

["ace_settingsInitialized", {
    // Exit if not enabled
    if (!GVAR(enabled)) exitWith {};

    // Add Advanced Fatigue duty factor
    if (missionNamespace getVariable [QACEGVAR(advanced_fatigue,enabled), false]) then {
        LOG("Adding Duty Factor");
        [QUOTE(ADDON), {
            (linearConversion [0, 75, _this getVariable [QGVAR(thirst), 0], 1, 2, true]) * (linearConversion [0, 60, _this getVariable [QGVAR(hunger), 0], 1, 1.5, true])
        }] call ACEFUNC(advanced_fatigue,addDutyFactor);
    };

    // Compile water source actions
    GVAR(mainAction) = [
        QGVAR(waterSource),
        localize LSTRING(WaterSource),
        QPATHTOF(ui\icon_water_tap.paa),
        {true},
        {
            alive _target
            && {_target call FUNC(getRemainingWater) != REFILL_WATER_DISABLED}
            && {[_player, _target] call ACEFUNC(common,canInteractWith)}
        }
    ] call ACEFUNC(interact_menu,createAction);

    GVAR(subActions) = [
        [
            QGVAR(checkWater),
            localize LSTRING(CheckWater),
            QPATHTOF(ui\icon_water_tap.paa),
            {[_player, _target] call FUNC(checkWater)},
            {_target call FUNC(getRemainingWater) != REFILL_WATER_INFINITE}
        ] call ACEFUNC(interact_menu,createAction),
        [
            QGVAR(drinkDirectly),
            localize LSTRING(DrinkDirectly),
            QPATHTOF(ui\icon_water_tap.paa),
            {},
            {}
        ] call ACEFUNC(interact_menu,createAction),
        [
            QGVAR(refill),
            localize LSTRING(Refill),
            QPATHTOF(ui\icon_water_tap.paa),
            {},
            {true},
            LINKFUNC(getRefillChildren)
        ] call ACEFUNC(interact_menu,createAction)
    ];

    // Add refill water actions to water sources from compiled list
    {
        private _classname = _x;
        [_classname, 0, ["ACE_MainActions"], GVAR(mainAction)] call ACEFUNC(interact_menu,addActionToClass);
        {
            [_classname, 0, ["ACE_MainActions", QGVAR(waterSource)], _x] call ACEFUNC(interact_menu,addActionToClass);
        } forEach GVAR(subActions);
        LOG_1("Added water source actions to %1 from config",_classname);
    } forEach GETUVAR(GVAR(waterSources),[]);

    // Add status modifiers
    if (["ace_medical"] call ACEFUNC(common,isModLoaded)) then {
        [0, {
            if (_this getVariable [QACEGVAR(medical,isBleeding), false]) exitWith {
                0.5
            };
            -1 * count (_this getVariable [QACEGVAR(medical,ivBags), []]);
        }] call FUNC(addStatusModifier);
    };
    if (["ace_weather"] call ACEFUNC(common,isModLoaded)) then {
        [0, {
            linearConversion [40, 60, missionNamespace getVariable [QACEGVAR(weather,currentTemperature), 25], 0, 1.5, true];
        }] call FUNC(addStatusModifier);
    };
    if (["ace_dragging"] call ACEFUNC(common,isModLoaded)) then {
        [2, {
            if (_this getVariable [QACEGVAR(dragging,isDragging), false] || {_this getVariable [QACEGVAR(dragging,isCarrying), false]}) exitWith {
                1
            };
            0
        }] call FUNC(addStatusModifier);
    };

    // Add respawn eventhandler to reset necessary variables, done through script so only added if field rations is enabled
    ["CAManBase", "respawn", LINKFUNC(handleRespawn)] call CBA_fnc_addClassEventHandler;

    // Start update loop
    [FUNC(update), CBA_missionTime + MP_SYNC_INTERVAL, 1] call CBA_fnc_waitAndExecute;

    #ifdef DEBUG_MODE_FULL
        ["ACE_player thirst", {ACE_player getVariable [QGVAR(thirst), 0]}, [true, 0, 100]] call ACEFUNC(common,watchVariable);
        ["ACE_player hunger", {ACE_player getVariable [QGVAR(hunger), 0]}, [true, 0, 100]] call ACEFUNC(common,watchVariable);
    #endif
}] call CBA_fnc_addEventHandler;
