#include "script_component.hpp"

params ["_display"];

_display displayAddEventHandler ["KeyDown", {
    params ["", "_inputKey"];

    switch (true) do {
        case (_inputKey in [DIK_LSHIFT, DIK_RSHIFT]): {
            GVAR(keyShift) = true;
        };
        case (_inputKey in [DIK_LCONTROL, DIK_RCONTROL]): {
            GVAR(keyCtrl) = true;
        };
        case (_inputKey in [DIK_LMENU, DIK_RMENU]): {
            GVAR(keyAlt) = true;
        };
    };

    if !(_this select 2) then {
        GVAR(keyShift) = false;
    };

    if !(_this select 3) then {
        GVAR(keyCtrl) = false;
    };

    if !(_this select 4) then {
        GVAR(keyAlt) = false;
    };
}];

_display displayAddEventHandler ["KeyUp", {
    params ["", "_inputKey"];
    
    switch (true) do {
        case (_inputKey in [DIK_LSHIFT, DIK_RSHIFT]): {
            GVAR(keyShift) = false;
        };
        case (_inputKey in [DIK_LCONTROL, DIK_RCONTROL]): {
            GVAR(keyCtrl) = false;
        };
        case (_inputKey in [DIK_LMENU, DIK_RMENU]): {
            GVAR(keyAlt) = false;
        };
    };
}];

_display displayAddEventHandler ["MouseZChanged", {
    (_this select 1) call FUNC(handleScrollWheel);
}];

_display displayAddEventHandler ["MouseButtonDown", {
    [ace_player, _this select 1] call FUNC(deployCancel);
}];
