/*
 * Author: Glowbal, PabstMirror
 * Eats/Drinks an item
 *
 * Arguments:
 * 0: Target (not used) <OBJECT>
 * 1: Player <OBJECT>
 * 2: Item Classname <STRING>
 *
 * Return Value:
 * Can Be Disarmed <BOOL>
 *
 * Example:
 * [player, player, "ACE_waterbottle_half"] call ace_field_rations_fnc_actionConsumeItem
 *
 * Public: No
 */
#include "script_component.hpp"

params ["", "_player", "_itemClassname"];
TRACE_2("params",_player,_itemClassname);

if (!(_this call FUNC(canConsumeItem))) exitWith {TRACE_1("canConsumeItem check failed", _this);};

local _cfg = ConfigFile >> "CfgWeapons" >> _itemClassname;

local _consumeTime = getNumber (_cfg >> QGVAR(consumeTime));
local _displayName = getText (_cfg >> "displayName");
local _hungerRestored = getNumber (_cfg >> QGVAR(isEatable));
local _thirstRestored = getNumber (_cfg >> QGVAR(isDrinkable));
local _replacementItem = getText (_cfg >> QGVAR(replacementItem));

local _progressBarText = if (_hungerRestored > 0) then {
    format [localize LSTRING(EatingX), _displayName];
} else {
    format [localize LSTRING(DrinkingX), _displayName];
};

local _onFinish = {
    (_this select 0) params ["", "_player", "_itemClassname", "_hungerRestored", "_thirstRestored", "_replacementItem"];
    TRACE_4("Consume Finish",_itemClassname,_hungerRestored,_thirstRestored,_replacementItem);

    _player removeItem _itemClassname;
    if (_replacementItem != "") then {
        [_player, _replacementItem] call ace_common_fnc_addToInventory;
    };

    if (_hungerRestored > 0) then {
        local _currentLevel = _player getvariable [QGVAR(hungerStatus), 100];
        _player setvariable [QGVAR(hungerStatus), ((_currentLevel + _hungerRestored) min 100)];
    };
    if (_thirstRestored > 0) then {
        local _currentLevel = _player getvariable [QGVAR(thirstStatus), 100];
        _player setvariable [QGVAR(thirstStatus), ((_currentLevel + _thirstRestored) min 100)];
    };
};

local _onFailure = {
    TRACE_1("Consume Interrupted", _this);
};

[
    _consumeTime,
    [_player, _player, _itemClassname, _hungerRestored, _thirstRestored, _replacementItem],
    _onFinish,
    _onFailure,
    _progressBarText,
    {(_this select 0) call FUNC(canConsumeItem)},
    ["isNotInside"]
] call ace_common_fnc_progressBar;
