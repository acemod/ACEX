#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

GVAR(isEnabled) = false;
DFUNC(onInitEvent) = {
    TRACE_1("SettingInit", GVAR(enable));

    //If not enabled, then do not add CanInteractWith Condition or event handlers:
    if (!GVAR(enable) || GVAR(isEnabled)) exitWith {};
    GVAR(isEnabled) = true;

    // Add interaction menu exception
    ["isNotSitting", {isNil {(_this select 0) getVariable QGVAR(isSitting)}}] call ACEFUNC(common,addCanInteractWithCondition);

    // Handle interruptions
    ["ace_unconscious", {_this call DFUNC(handleInterrupt)}] call CBA_fnc_addEventHandler;
    ["ace_captives_SetHandcuffed", {_this call DFUNC(handleInterrupt)}] call CBA_fnc_addEventHandler;
};

["ace_settingsInitialized", {
    call FUNC(onInitEvent);
}] call CBA_fnc_addEventHandler;

["ace_settingChanged", {
    params ["_name", "_value", "_force"];
    call FUNC(onInitEvent);
}] call CBA_fnc_addEventHandler;
