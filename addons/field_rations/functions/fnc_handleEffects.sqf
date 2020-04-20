#include "script_component.hpp"
/*
 * Author: mharis001, Glowbal, PabstMirror
 * Handles the effects/consequences of high thirst/hunger.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Thirst <NUMBER>
 * 2: Hunger <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _thirst, _hunger] call acex_field_rations_fnc_handleEffects
 *
 * Public: No
 */

params ["_player", "_thirst", "_hunger"];

// Kill unit with max thirst or hunger
if ((_thirst > 99.9 || {_hunger > 99.9}) && {random 1 < 0.5}) exitWith {
    if (["ace_medical"] call ACEFUNC(common,isModLoaded)) then {
        [_player, "Hunger/Thirst empty"] call ACEFUNC(medical_status,setDead);
    } else {
        _player setDamage 1;
    };
};

// Exit if unit is not awake, below are animation based consequences
if !(_player call ACEFUNC(common,isAwake)) exitWith {};

// Set unit unconscious (chance based on how high thirst/hunger are)
if ((_thirst > 85 || {_hunger > 85}) && {random 1 < linearConversion [85, 100, _thirst max _hunger, 0.05, 0.1, true]}) exitWith {
    if (["ace_medical"] call ACEFUNC(common,isModLoaded)) then {
        [_player, true, 5, true] call ACEFUNC(medical,setUnconscious);
    };
};

// Make unit fall if moving fast
if ((_thirst > 93 || {_hunger > 93}) && {speed _player > 1} && {vehicle _player == _player}) exitWith {
    [_player, "down"] call ACEFUNC(common,doGesture);
};
