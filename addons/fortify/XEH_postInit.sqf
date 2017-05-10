#include "script_component.hpp"

if (!hasInterface) exitWith {};

private _onChange = {
    if (ace_player getVariable [QGVAR(isDeploying), false]) then {
        [ace_player] call FUNC(deployCancel);
    };
};

["ace_interactMenuOpened", _onChange] call CBA_fnc_addEventHandler;
["unit", _onChange] call CBA_fnc_addPlayerEventHandler;
["loadout", _onChange] call CBA_fnc_addPlayerEventHandler;
["vehicle", _onChange] call CBA_fnc_addPlayerEventHandler;
["ace_unconscious", _onChange] call CBA_fnc_addEventHandler;
