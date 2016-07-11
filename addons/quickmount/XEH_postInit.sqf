#include "script_component.hpp"

["ACEX", QGVAR(actionID), [CSTRING(KeybindName), CSTRING(KeybindDescription)], "", {
    [ace_player] call FUNC(doMount);
}] call CBA_fnc_addKeybind;

[{
    private _start = eyePos ace_player;
    private _end = (_start vectorAdd (getCameraViewDirection ace_player vectorMultiply GVAR(distance)));
    
    hintSilent format ["Distance: %1m", _start distance _end];

    drawLine3D [
        ASLtoAGL _start,
        ASLtoAGL _end,
        [1,0,0,1]
    ];
}, 0, []] call CBA_fnc_addPerFrameHandler;