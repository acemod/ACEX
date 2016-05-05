
#include "script_component.hpp"

params ["_logic"];

private _originalLogic = _logic;

private _getMasterIED = {
    if (_logic getvariable [QGVAR(subIED),false]) then {
        _logic = _logic getvariable [QGVAR(controlledByIED), _logic];
        if (_logic getvariable [QGVAR(subIED),false]) then {
            call _getMasterIED;
        };
    };
};
call _getMasterIED;

private _chain = _logic getvariable [QGVAR(collection), []];
{
    private _iedLogic = _x;
    if (_iedLogic != _originalLogic) then {
        _iedLogic setvariable ["iedActivationType", -1]; // disable all other activation methods, we are blowing the entire chain already anway
    };

    private _trigger = _iedLogic getvariable [QGVAR(linkedIED), objNull];
    if (!(isNull _trigger)) then {
        [_iedLogic, _trigger, _logic] spawn { // using a spawn because it doesn't matter to much if an ied isn't detonated at a reliable time
            params ["_iedLogic", "_trigger", "_master"];
            if (!isNull _trigger) then {
                if ((_iedLogic != _master) && {random(1)>0.1}) then {
                    uisleep (random(2));
                };
                _trigger setDamage 1;
            };
        };
    };
} forEach _chain;
