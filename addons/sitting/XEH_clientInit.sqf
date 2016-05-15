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
    ["medical_onUnconscious", {_this call DFUNC(handleInterrupt)}] call ACEFUNC(common,addEventhandler);
    ["SetHandcuffed", {_this call DFUNC(handleInterrupt)}] call ACEFUNC(common,addEventhandler);
};

["SettingsInitialized", {
    call FUNC(onInitEvent);
}] call ACEFUNC(common,addEventHandler);

["SettingChanged", {
    params ["_name", "_value", "_force"];
    call FUNC(onInitEvent);
}] call ACEFUNC(common,addEventhandler);
