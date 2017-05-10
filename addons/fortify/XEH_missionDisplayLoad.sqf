#include "script_component.hpp"

params ["_display"];

_display displayAddEventHandler ["MouseZChanged", {
    (_this select 1) call FUNC(handleScrollWheel);
}];

_display displayAddEventHandler ["MouseButtonDown", {
    [ace_player, _this select 1] call FUNC(deployCancel);
}];
