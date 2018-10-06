/*
 * Author: mharis001, Glowbal, PabstMirror
 * Consumes (eat/drink) an item. Creates progress bar and restores relevant thirst/hunger values.
 *
 * Arguments:
 * 0: Target (not used) <OBJECT>
 * 1: Player <OBJECT>
 * 2: Item classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [objNull, ACE_player, "ACE_WaterBottle"] call acex_field_rations_fnc_consumeItem
 *
 * Public: No
 */
#include "script_component.hpp"

params ["", "_player", "_consumeItem"];
TRACE_2("Consume item started",_player,_consumeItem);

private _config = configFile >> "CfgWeapons" >> _consumeItem;

private _consumeTime = getNumber (_config >> QGVAR(consumeTime));
private _thirstRestored = getNumber (_config >> QGVAR(thirstRestored));
private _hungerRestored = getNumber (_config >> QGVAR(hungerRestored));

// Get consume text
private _displayName = getText (_config >> "displayName");
private _consumeText = getText (_config >> QGVAR(consumeText));

if (_consumeText == "") then {
    _consumeText = if (_hungerRestored > 0) then {LLSTRING(EatingX)} else {LLSTRING(DrinkingX)};
};

_consumeText = format [_consumeText, _displayName];

// Get consume animation and sound
private _stanceIndex = ["STAND", "CROUCH", "PRONE"] find stance _player;
private _consumeAnim = getArray (_config >> QGVAR(consumeAnims)) param [_stanceIndex, "", [""]];
private _consumeSound = getArray (_config >> QGVAR(consumeSounds)) param [_stanceIndex, "", [""]];

// Play animation if defined
if (_consumeAnim != "") then {
    // Store current animation state
    _player setVariable [QGVAR(previousAnim), animationState _player];
    [_player, _consumeAnim, 2] call ACEFUNC(common,doAnimation);
};

// Player sound if defined
if (_consumeSound != "") then {
    playSound _consumeSound;
};

private _fnc_onSuccess = {
    (_this select 0) params ["_player", "_consumeItem", "_replacementItem", "_thirstRestored", "_hungerRestored"];
    TRACE_5("Consume item successful",_player,_consumeItem,_replacementItem,_thirstRestored,_hungerRestored);

    // Remove consumed item and add replacement item if necessary
    _player removeItem _consumeItem;
    if (_replacementItem != "") then {
        [_player, _replacementItem] call ACEFUNC(common,addToInventory);
    };

    // Restore thirst and hunger values
    if (_thirstRestored > 0) then {
        private _thirst = _player getVariable [QGVAR(thirst), 0];
        _player setVariable [QGVAR(thirst), (_thirst - _thirstRestored) max 0];
    };
    if (_hungerRestored > 0) then {
        private _hunger = _player getVariable [QGVAR(hunger), 0];
        _player setVariable [QGVAR(hunger), (_hunger - _hungerRestored) max 0];
    };

    // Reset player's animation
    private _previousAnim = _player getVariable [QGVAR(previousAnim), ""];
    if (_previousAnim != "") then {
        [_player, _previousAnim, 2] call ACEFUNC(common,doAnimation);
    };
};

private _fnc_onFailure = {
    (_this select 0) params ["_player"];
    TRACE_1("Consume item failed",_player);

    // Reset player's animation
    private _previousAnim = _player getVariable [QGVAR(previousAnim), ""];
    if (_previousAnim != "") then {
        [_player, _previousAnim, 2] call ACEFUNC(common,doAnimation);
    };
};

private _fnc_condition = {
    (_this select 0) params ["_player", "_consumeItem"];

    _consumeItem in (_player call ACEFUNC(common,uniqueItems));
};

[
    _consumeTime,
    [_player, _consumeItem, _replacementItem, _thirstRestored, _hungerRestored],
    _fnc_onSuccess,
    _fnc_onFailure,
    _consumeText,
    _fnc_condition,
    ["isNotInside"]
] call ACEFUNC(common,progressBar);
