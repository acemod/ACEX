#include "script_component.hpp"

if !(hasInterface) exitWith {};

["ace_settingsInitialized", {
    TRACE_3("Settings Initialized",GVAR(enabled),GVAR(timeWithoutWater),GVAR(timeWithoutFood));

    if !(GVAR(enabled)) exitWith {};

    // Add Advanced Fatigue duty factor
    if (missionNamespace getVariable [QACEGVAR(advanced_fatigue,enabled), false]) then {
        LOG("Adding Duty Factor");
        [QUOTE(ADDON), {
            (linearConversion [75, 0, _this getVariable [QGVAR(thirst), 100], 1, 2, true]) * (linearConversion [60, 0, _this getVariable [QGVAR(hunger), 100], 1, 1.5, true])
        }] call ACEFUNC(advanced_fatigue,addDutyFactor);
    };

    // HUD variables
    GVAR(hudInteractionHover) = false;
    GVAR(hudIsShowing) = false;

    [] call FUNC(addRefillActions);

    // Start update loop with 10 second interval and 60 second MP sync
    [LINKFUNC(update), CBA_missionTime + 60, 10] call CBA_fnc_waitAndExecute;

    // Add event to hide HUD if it was shown through interact menu hover
    ["ace_interactMenuClosed", {
        if (GVAR(hudInteractionHover)) then {
            GVAR(hudInteractionHover) = false;
            [3] call FUNC(showHud);
        };
    }] call CBA_fnc_addEventHandler;

    #ifdef DEBUG_MODE_FULL
        ["ACE_player thirst", {ACE_player getVariable [QGVAR(thirst), 100]}, [true, 0, 100]] call ACEFUNC(common,watchVariable);
        ["ACE_player hunger", {ACE_player getVariable [QGVAR(hunger), 100]}, [true, 0, 100]] call ACEFUNC(common,watchVariable);
    #endif
}] call CBA_fnc_addEventHandler;
