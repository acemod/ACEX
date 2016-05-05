#include "script_component.hpp"

if !(hasInterface) exitWith {};

["SettingsInitialized", {
    //If not enabled, dont't add PFEH or actions
    if (!GVAR(systemEnabled)) exitWith {};

    GVAR(hudInteractionHover) = false;
    GVAR(hudIsShowing) = false;

    if ((GVAR(timeWithoutWater) == 0) || {GVAR(timeWithoutFood) == 0}) exitWith {
        ERROR("Bad Time Setting [div/0]");
    };

    [] call FUNC(addRefillActionsToObjects);

    [{_this call DFUNC(updateFieldRations)}, 10, [ACE_time, (ACE_time + 60)]] call CBA_fnc_addPerFrameHandler;

    ["interactMenuClosed", {
        if (GVAR(hudInteractionHover)) then {
            GVAR(hudInteractionHover) = false;
            [3] call FUNC(showOverlay);
        };
    }] call ace_common_fnc_addEventHandler;

}] call ace_common_fnc_addEventHandler;
