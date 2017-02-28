/*
 * Author: Glowbal, PabstMirror
 * Update the player's thirst and hunger, update the overlay and appy status effects
 *
 * Arguments:
 * 0: Next Mp Sync Time
 *
 * Return Value:
 * None
 *
 * Example:
 * [100] call acex_field_rations_fnc_updateFieldRations
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_nextMpSync"];

if ((isNull ACE_player) || {!alive ACE_player}) then {
    [0] call FUNC(showOverlay);
} else {

    private _drinkStatus = ACE_player getVariable [QGVAR(thirstStatus), 100];
    private _foodStatus = ACE_player getVariable [QGVAR(hungerStatus), 100];

    private _workMultipler = 1;
    if (((vehicle ACE_player) == ACE_player) && {isTouchingGround ACE_player}) then {
        private _absSpeed = vectorMagnitude (velocity ACE_player);
        _workMultipler = linearConversion [1, 7, (vectorMagnitude (velocity ACE_player)), 1, 2, true];
        _descentWater = _descentWater + (_absSpeed / 400);
        _descentFood = _descentFood + (_absSpeed / 1200);
    };

    // 10 sec (interval) * 100 (percent) / 3600 (sec in hour) = 0.2777778
    private _descentWater = _workMultipler * 0.2777778 / GVAR(timeWithoutWater);
    private _descentFood = _workMultipler * 0.2777778 / GVAR(timeWithoutFood);

    TRACE_6("update", CBA_missionTime, _drinkStatus, _descentWater, _foodStatus, _descentFood, _workMultipler);

    // Decrease both food and drink status based upon the decent rate
    _drinkStatus = (_drinkStatus - _descentWater) max 0;
    _foodStatus = (_foodStatus - _descentFood) max 0;

    // Check if we want to do a new sync across MP for the ACE_player
    private _doSync = false;
    if (CBA_missionTime > _nextMpSync) then {
        _doSync = true;
        _nextMpSync = CBA_missionTime + 60;
    };

    // Store the hunger and thirst values
    ACE_player setVariable [QGVAR(thirstStatus), _drinkStatus, _doSync];
    ACE_player setVariable [QGVAR(hungerStatus), _foodStatus, _doSync];

    // Update UI
    [10] call FUNC(showOverlay);

    // Low hunger or thirst consequences
    // If the unit runs out of either the drinking of food status, kill the unit
    if ((_drinkStatus < 1) || {_foodStatus < 1}) then {
        if ((random 1) > 0.2) then {
            TRACE_1("death from hunger/thirst", ACE_player);
            if (["ACE_Medical"] call ACEFUNC(common,isModLoaded)) then {
                [ACE_player] call ACEFUNC(medical,setDead);
            } else {
                ACE_player setDamage 1;
            };
        };
    };

    // No point continueing if the unit is not awake or alive. Below are all animation consequounces
    if (!([ACE_player] call ACEFUNC(common,isAwake))) exitwith {};

    if ((_drinkStatus < 20) || {_foodStatus < 20}) then {
        private _passOutChance = linearConversion [20, 0, (_drinkStatus min _foodStatus), 0.05, 0.20];
        if ((random 1) < _passOutChance) then {
            TRACE_1("setUnconscious from hunger/thirst", _passOutChance);
            if (["ACE_Medical"] call ACEFUNC(common,isModLoaded)) then {
                [ACE_player, true, 5] call ACEFUNC(medical,setUnconscious);
            };
        };
    };

    if ((_drinkStatus < 7) || {_foodStatus < 7}) then {
        if ((speed ACE_player > 1) && {vehicle ACE_player == ACE_player}) then {
            TRACE_1("force prone from hunger/thirst", _animState);
            [ACE_player, "down"] call ACEFUNC(common,doGesture);
        };
    };
};

[LINKFUNC(updateFieldRations), [_nextMpSync], 10] call CBA_fnc_waitAndExecute;
