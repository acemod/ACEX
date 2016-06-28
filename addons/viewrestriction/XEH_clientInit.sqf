#include "script_component.hpp"

// Exit on Headless Client
if !(hasInterface) exitWith {};

["ace_settingsInitialized", {
    // Exit if module is disabled
    if (GVAR(mode) == 0) exitWith {};

    // Exit if all Selective Modes are Disabled
    if (GVAR(mode) == 3 &&
        {GVAR(modeSelectiveFoot) == 0} &&
        {GVAR(modeSelectiveLand) == 0} &&
        {GVAR(modeSelectiveAir) == 0} &&
        {GVAR(modeSelectiveSea) == 0}/* &&
        {GVAR(modeSelectiveUAV) == 0}*/
    ) exitWith {
        ACE_LOGWARNING("Selective mode enabled, but all sub-modes are disabled.")
    };

    // Exit if third person view is not available
    if (difficultyOption "thirdPersonView" == 0) exitWith {
        ACE_LOGWARNING("View Restriction is enabled, but 3rd person is disabled with server difficulty.");
    };

    // Add Event Handler for changing camera - also happens on spawn
    ["ace_cameraViewChanged", {
        call FUNC(changeCamera);
    }] call CBA_fnc_addEventHandler;

    // Add Event Hander for exiting and entering a vehicle when on Selective mode
    if (GVAR(mode) == 3) then {
        ["ace_playerVehicleChanged", {
            call FUNC(changeCamera);
        }] call CBA_fnc_addEventHandler;
    };
}] call CBA_fnc_addEventHandler;
