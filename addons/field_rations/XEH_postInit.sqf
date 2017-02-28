#include "script_component.hpp"

if !(hasInterface) exitWith {};

["ace_settingsInitialized", {
    TRACE_3("ace_settingsInitialized eh",GVAR(systemEnabled),GVAR(timeWithoutWater),GVAR(timeWithoutFood));

    //If not enabled, dont't add PFEH or actions
    if (!GVAR(systemEnabled)) exitWith {};

    if (missionNamespace getVariable ["ACE_advanced_fatigue_enabled", false]) then {
        TRACE_1("Adding Duty Factor",ACE_advanced_fatigue_enabled);
        [QUOTE(ADDON), {
            // todo?
            1
        }] call ACEFUNC(advanced_fatigue,addDutyFactor);
    };

    GVAR(hudInteractionHover) = false;
    GVAR(hudIsShowing) = false;

    if ((GVAR(timeWithoutWater) == 0) || {GVAR(timeWithoutFood) == 0}) exitWith {
        ERROR("Bad Time Setting [div/0]");
    };

    [] call FUNC(addRefillActionsToObjects);

    [LINKFUNC(updateFieldRations), [(CBA_missionTime + 60)], 10] call CBA_fnc_waitAndExecute;

    ["ace_interactMenuClosed", {
        if (GVAR(hudInteractionHover)) then {
            GVAR(hudInteractionHover) = false;
            [3] call FUNC(showOverlay);
        };
    }] call CBA_fnc_addEventHandler;

}] call CBA_fnc_addEventHandler;
