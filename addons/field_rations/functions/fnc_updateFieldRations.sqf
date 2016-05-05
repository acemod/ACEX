/*
 * Author: Glowbal, PabstMirror
 * Update the player's thirst and hunger, update the overlay and appy status effects
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call acex_field_rations_fnc_updateFieldRations
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_args"];
_args params ["_lastUpdateTime", "_nextMpSync"];

if ((isNull ACE_player) || {!alive ACE_player}) exitWith {
    [0] call FUNC(showOverlay);
};

local _deltaTime = ACE_time - _lastUpdateTime;
_args set [0, ACE_time];

local _drinkStatus = ACE_player getVariable [QGVAR(thirstStatus), 100];
local _foodStatus = ACE_player getVariable [QGVAR(hungerStatus), 100];

local _descentWater = _deltaTime / (36.0 * GVAR(timeWithoutWater));
local _descentFood = _deltaTime / (36.0 * GVAR(timeWithoutFood));

local _absSpeed = vectorMagnitude (velocity ACE_player);

// TODO add in weight calculation and effect
// If unit is not inside a vehicle, adjust waterlevels based on movement speed
if (((vehicle ACE_player) == ACE_player) && {_absSpeed > 1} && {((getPos ACE_player) select 2) < 10}) then {
    _descentWater = _descentWater + (_absSpeed / 400);
    _descentFood = _descentFood + (_absSpeed / 1200);
};

TRACE_5("update", ace_time, _drinkStatus, _descentWater, _foodStatus, _descentFood);

// Decrease both food and drink status based upon the decent rate
_drinkStatus = (_drinkStatus - _descentWater) max 0;
_foodStatus = (_foodStatus - _descentFood) max 0;

// Check if we want to do a new sync across MP for the ACE_player
local _doSync = false;
if (ACE_time > _nextMpSync) then {
    _doSync = true;
    _args set [1, (ACE_time + 60)];
};

// Store the hunger and thirst values
ACE_player setVariable [QGVAR(thirstStatus), _drinkStatus, _doSync];
ACE_player setVariable [QGVAR(hungerStatus), _foodStatus, _doSync];

// Update UI
[10] call FUNC(showOverlay);

// Low hunger or thirst consequences
// If the unit runs out of either the drinking of food status, kill the unit
if ((_drinkStatus < 1) || {_foodStatus < 1}) then {
    if (random(1) > 0.2) then {
        TRACE_1("death from hunger/thirst", ACE_player);
        if (["ACE_Medical"] call ace_common_fnc_isModLoaded) then {
            [ACE_player] call ace_medical_fnc_setDead;
        } else {
            ACE_player setDamage 1;
        };
    };
};

// No point continueing if the unit is not awake or alive. Below are all animation consequounces
if !([ACE_player] call ace_common_fnc_isAwake) exitwith {};

local _animState = animationState ACE_player;
local _isProne = ((count _animState > 8) && {(_animState select [5, 3]) == "pne"});
local _proneAnim = "amovppnemstpsraswrfldnon"; //TODO: handle pistol/launcher/unarmed animation BS

if ((_drinkStatus < 25) || {_foodStatus < 25}) then {
    if ((speed ACE_player > 12) && {vehicle ACE_player == ACE_player} && {random(1) >= 0.3}) then {
        TRACE_1("Falldown from hunger/thirst",ACE_player);
        [ACE_player, _proneAnim, 2] call ace_common_fnc_doAnimation;
    };
};

if ((_drinkStatus < 20) || {_foodStatus < 20}) then {
    local _passOutChance = linearConversion [20, 0, (_drinkStatus max _foodStatus), 0.05, 0.20];
    if ((random 1) < _passOutChance) then {
        TRACE_1("setUnconscious from hunger/thirst", _passOutChance);
        if (["ACE_Medical"] call ace_common_fnc_isModLoaded) then {
            [ACE_player, true, 5] call ace_medical_fnc_setUnconscious;
        };
    };
};


if ((_drinkStatus < 7) || {_foodStatus < 7}) then {
    if ((speed ACE_player > 1) && {vehicle ACE_player == ACE_player} && {!_isProne}) then {
        TRACE_1("force prone from hunger/thirst", _animState);
        [ACE_player, _proneAnim, 2] call ace_common_fnc_doAnimation;
    };
};
