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

[QGVAR(displayTextStructured), {
    params ["_side", "_args"];

    if (_side isEqualTo side group ace_player) then {
        _args call ACEFUNC(common,displayTextStructured);
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(addActionToObject), {
    params ["_side", "_object", "_action"];

    if (_side isEqualTo side group ace_player) then {
        [_object, 0, [], _action] call ACEFUNC(interact_menu,addActionToObject);
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(registerObjects), FUNC(registerObjects)] call CBA_fnc_addEventHandler;

["fortify", FUNC(handleChatCommand), "admin"] call CBA_fnc_registerChatCommand;
