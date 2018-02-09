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

    [] call FUNC(addRefillActions);
}] call CBA_fnc_addEventHandler;
