#include "script_component.hpp"

["ACEX", QGVAR(actionID), [CSTRING(KeybindName), CSTRING(KeybindDescription)], "", {
    [ace_player] call FUNC(doMount);
}] call CBA_fnc_addKeybind;