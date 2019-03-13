#include "script_component.hpp"

// Don't bother checking all mags if we aren't on the map and don't have anything open
["loadout", {
    if ((!visibleMap) && {GVAR(controlsGroups) isEqualTo []}) exitWith {};
    call FUNC(handleLoadout);
}, true] call CBA_fnc_addPlayerEventHandler;
["visibleMap", {
    params ["", "_data"]; // visibleMap is updated one frame later
    if (!_data) exitWith {};
    call FUNC(handleLoadout);
}, true] call CBA_fnc_addPlayerEventHandler;
