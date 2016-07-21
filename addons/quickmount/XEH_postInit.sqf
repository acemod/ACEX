#include "script_component.hpp"

if (!hasInterface) exitWith {};

[QUOTE(ACEX_TAG), QGVAR(actionID), [localize LSTRING(KeybindName), localize LSTRING(KeybindDescription)], "", {
    if (!dialog) then {
        [] call FUNC(getInNearest);
    };
    
    false
}] call CBA_fnc_addKeybind;
