#include "script_component.hpp"

if !(hasInterface) exitWith {};

["ace_settingsInitialized", {
    TRACE_3("ace_settingsInitialized eh",GVAR(systemEnabled),GVAR(timeWithoutWater),GVAR(timeWithoutFood));

    //If not enabled, dont't add PFEH or actions
    if (!GVAR(systemEnabled)) exitWith {};

    GVAR(hudInteractionHover) = false;
    GVAR(hudIsShowing) = false;

    if ((GVAR(timeWithoutWater) == 0) || {GVAR(timeWithoutFood) == 0}) exitWith {
        ERROR("Bad Time Setting [div/0]");
    };

    [] call FUNC(addRefillActionsToObjects);

    [FUNC(updateFieldRations), 10, [CBA_missionTime, (CBA_missionTime + 60)]] call CBA_fnc_addPerFrameHandler;

    ["ace_interactMenuClosed", {
        if (GVAR(hudInteractionHover)) then {
            GVAR(hudInteractionHover) = false;
            [3] call FUNC(showOverlay);
        };
    }] call CBA_fnc_addEventHandler;

}] call CBA_fnc_addEventHandler;
