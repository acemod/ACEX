#include "script_component.hpp"

if !(hasInterface) exitWith {};

["ace_settingsInitialized", {
    // Exit if not enabled
    if (!GVAR(enabled)) exitWith {};

    // Add Advanced Fatigue duty factor
    if (GVAR(affectAdvancedFatigue) && {missionNamespace getVariable [QACEGVAR(advanced_fatigue,enabled), false]}) then {
        [QUOTE(ADDON), {
            linearConversion [50, 100, _this getVariable [QGVAR(thirst), 0], 1, 1.4, true] * linearConversion [50, 100, _this getVariable [QGVAR(hunger), 0], 1, 1.1, true]
        }] call ACEFUNC(advanced_fatigue,addDutyFactor);
        TRACE_1("Added duty factor",GVAR(affectAdvancedFatigue));
    };

    // Compile water source actions
    private _mainAction = [
        QGVAR(waterSource),
        localize LSTRING(WaterSource),
        QPATHTOF(ui\icon_water_tap.paa),
        {true},
        {
            private _waterSource = _target getVariable [QGVAR(waterSource), objNull];
            alive _waterSource
            && {_waterSource call FUNC(getRemainingWater) != REFILL_WATER_DISABLED}
            && {[_player, _waterSource] call ACEFUNC(common,canInteractWith)}
        },
        {
            private _waterSource = _target getVariable [QGVAR(waterSource), objNull];
            [_waterSource, _player] call FUNC(getRefillChildren);
        },
        [],
        {[0, 0, 0]},
        2,
        [false, false, false, false, true]
    ] call ACEFUNC(interact_menu,createAction);

    private _subActions = [
        [
            QGVAR(checkWater),
            localize LSTRING(CheckWater),
            QPATHTOF(ui\icon_water_tap.paa),
            {
                private _waterSource = _target getVariable [QGVAR(waterSource), objNull];
                [_player, _waterSource] call FUNC(checkWater);
            },
            {
                private _waterSource = _target getVariable [QGVAR(waterSource), objNull];
                (_waterSource call FUNC(getRemainingWater)) != REFILL_WATER_INFINITE
            }
        ] call ACEFUNC(interact_menu,createAction)
        /*
        [
            QGVAR(drinkDirectly),
            localize LSTRING(DrinkDirectly),
            QPATHTOF(ui\icon_water_tap.paa),
            {systemChat "x"},
            {true}
        ] call ACEFUNC(interact_menu,createAction),
        */
    ];

    // Add water source actions to helper
    [QGVAR(helper), 0, [], _mainAction] call ACEFUNC(interact_menu,addActionToClass);
    {
        [QGVAR(helper), 0, [QGVAR(waterSource)], _x] call ACEFUNC(interact_menu,addActionToClass);
    } forEach _subActions;

    // Add water source helpers when interaction menu is opened
    ["ace_interactMenuOpened", {call FUNC(addWaterSourceInteractions)}] call CBA_fnc_addEventHandler;

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

    GVAR(hudInteractionHover) = false;

    ["ace_interactMenuClosed", {
        GVAR(hudInteractionHover) = false;
    }] call CBA_fnc_addEventHandler;

    // Add respawn eventhandler to reset necessary variables, done through script so only added if field rations is enabled
    ["CAManBase", "respawn", LINKFUNC(handleRespawn)] call CBA_fnc_addClassEventHandler;

    // Start update loop
    [FUNC(update), CBA_missionTime + MP_SYNC_INTERVAL, 1] call CBA_fnc_waitAndExecute;

    #ifdef DEBUG_MODE_FULL
        ["ACE_player thirst", {ACE_player getVariable [QGVAR(thirst), 0]}, [true, 0, 100]] call ACEFUNC(common,watchVariable);
        ["ACE_player hunger", {ACE_player getVariable [QGVAR(hunger), 0]}, [true, 0, 100]] call ACEFUNC(common,watchVariable);
    #endif
}] call CBA_fnc_addEventHandler;
