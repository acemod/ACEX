/*
 * Author: Kingsley
 * Handles the object direction.
 *
 * Arguments:
 * 0: Scroll <NUMERIC>
 *
 * Return Value:
 * Bool
 *
 * Example:
 * TODO
 *
 * Public: No
 */

#include "script_component.hpp"

if (GVAR(deployPFH) == -1) exitWith {false};

params ["_scroll"];

if (!GVAR(keyShift) && {!GVAR(keyCtrl)} && {!GVAR(keyAlt)}) exitWith {
    GVAR(objectRotationZ) = GVAR(objectRotationZ) + (_scroll * 5);
    true
};

if (GVAR(keyShift)) exitWith {
    GVAR(objectRotationX) = GVAR(objectRotationX) + (_scroll * 5);
    true
};

if (GVAR(keyCtrl)) exitWith {
    GVAR(objectRotationY) = GVAR(objectRotationY) + (_scroll * 5);
    true
};

if (GVAR(keyAlt)) exitWith {
    GVAR(objectRotationZ) = GVAR(objectRotationZ) + (_scroll * 5);
    true
};

true
