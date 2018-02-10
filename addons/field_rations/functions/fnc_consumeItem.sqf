#include "script_component.hpp"

params ["", "_player", "_itemClass"];
TRACE_2("Consume Item",_player,_itemClass);

// Get relevant config values
private _cfg = configFile >> "CfgWeapons" >> _itemClass;

private _displayName = getText (_cfg >> "displayName");
private _consumeTime = getNumber (_cfg >> QGVAR(consumeTime));
private _consumeEffect = getText (_cfg >> QGVAR(consumeEffect));
private _thirstRestored = getNumber (_cfg >> QGVAR(isDrinkable));
private _hungerRestored = getNumber (_cfg >> QGVAR(isEatable));
private _replacementItem = getText (_cfg >> QGVAR(replacementItem));

TRACE_6("Consume Item Config",_displayName,_consumeTime,_consumeEffect,_thirstRestored,_hungerRestored,_replacementItem);

// Progress bar based on restored value
private _progressBarText = if (_hungerRestored > 0) then {
    format ["%1 %2", "Eating", _displayName]; // TODO: Localize
} else {
    format ["%1 %2", "Drinking", _displayName]; // TODO: Localize
};

// Play sound if defined
if (_consumeEffect != "") then {
    playSound _consumeEffect;
};

// Create progress bar
private _onFinish = {
    (_this select 0) params ["_player", "_itemClass", "_thirstRestored", "_hungerRestored", "_replacementItem"];
    TRACE_4("Consume Finished",_itemClass,_thirstRestored,_hungerRestored,_replacementItem);

    // Add replacement item if defined
    _player removeItem _itemClass;
    if (_replacementItem != "") then {
        [_player, _replacementItem] call ACEFUNC(common,addToInventory);
    };

    // Add relevant thirst/hunger values
    if (_thirstRestored > 0) then {
        private _thirstStatus = _player getVariable [QGVAR(thirst), 100];
        _player setVariable [QGVAR(thirst), (_thirstStatus + _thirstRestored) min 100];
    };
    if (_hungerRestored > 0) then {
        private _hungerStatus = _player getVariable [QGVAR(hunger), 100];
        _player setVariable [QGVAR(hunger), (_hungerStatus + _hungerRestored) min 100];
    };
};

private _onFailure = {
    TRACE_1("Consume Interrupted",_this);
};

[
    _consumeTime,
    [_player, _itemClass, _thirstRestored, _hungerRestored, _replacementItem],
    _onFinish,
    _onFailure,
    _progressBarText,
    {true},
    ["isNotInside"]
] call ACEFUNC(common,progressBar);
