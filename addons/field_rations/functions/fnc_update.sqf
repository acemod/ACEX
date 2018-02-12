/*
 * Author: mharis001, Glowbal, PabstMirror
 * Main looping update function for thirst/hunger status. Updates the HUD and applies relevant effects (consequences).
 *
 * Arguments:
 * 0: Next MP sync <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [10] call acex_field_rations_fnc_update
 *
 * Public: No
 */
#include "script_component.hpp"

// 10 sec (interval) * 100 (percent) / 3600 (sec in hour) = 0.2777778
#define DESCENT_CONSTANT 0.2777778

params ["_nextMpSync"];

if (isNull ACE_player || {!alive ACE_player}) then {
    // Hide HUD if player dead or doesn't exist
    [0] call FUNC(showHud);
} else {
    private _thirstStatus = ACE_player getVariable [QGVAR(thirst), 100];
    private _hungerStatus = ACE_player getVariable [QGVAR(hunger), 100];

    private _workMultiplier = 1;
    if (vehicle ACE_player == ACE_player && {isTouchingGround ACE_player}) then {
        private _absSpeed = vectorMagnitude (velocity ACE_player);
        _workMultiplier = linearConversion [1, 7, _absSpeed, 1, 2, true];
    };

    // TODO: account for temperature. more water loss when hot
    // TODO: account for ivBags from ace_medical? less _descentWater

    private _descentWater = _workMultiplier * DESCENT_CONSTANT / GVAR(timeWithoutWater);
    private _descentFood = _workMultiplier * DESCENT_CONSTANT / GVAR(timeWithoutFood);

    // Decrease food and water based on descent rate
    _thirstStatus = (_thirstStatus - _descentWater) max 0;
    _hungerStatus = (_hungerStatus - _descentFood) max 0;

    // Check if we want to do a MP sync for ACE_player
    private _doSync = false;
    if (CBA_missionTime >= _nextMpSync) then {
        _doSync = true;
        _nextMpSync = CBA_missionTime + 60;
    };

    // Store hunger and thirst values
    ACE_player setVariable [QGVAR(thirst), _thirstStatus, _doSync];
    ACE_player setVariable [QGVAR(hunger), _hungerStatus, _doSync];

    // Update HUD
    [10] call FUNC(showHud);

    // --- Consequences of low hunger or thirst
    // Kill unit if out of hunger or thirst
    if (_thirstStatus < 1 || {_hungerStatus < 1}) then {
        if (random 1 > 0.2) then {
            TRACE_1("Killing unit due to no thirst/hunger",ACE_player);
            if (["ace_medical"] call ACEFUNC(common,isModLoaded)) then {
                [ACE_player] call ACEFUNC(medical,setDead);
            } else {
                ACE_player setDamage 1;
            };
        };
    };

    // Exit if unit is not awake or alive, below are animation based consequences
    if (!([ACE_player] call ACEFUNC(common,isAwake))) exitWith {};

    // Set unconscious with chance based on how low values are
    if (_thirstStatus < 15 || {_hungerStatus < 15}) then {
        private _passOutChance = linearConversion [15, 0, _thirstStatus min _hungerStatus, 0.05, 0.1, true];
        if (random 1 > _passOutChance) then {
            if (["ace_medical"] call ACEFUNC(common,isModLoaded)) then {
                [ACE_player, true, 5] call ACEFUNC(medical,setUnconscious);
                TRACE_1("Unit set unconscious from thirst/hunger",ACE_player);
            };
        };
    };

    // Make unit fall if moving fast and crucially low values
    if (_thirstStatus < 7 || {_hungerStatus < 7}) then {
        if (speed ACE_player > 1 && {vehicle ACE_player == ACE_player}) then {
            [ACE_player, "down"] call ACEFUNC(common,doGesture);
            TRACE_1("Force unit to prone from thirst/hunger",ACE_player);
        };
    };
};

[LINKFUNC(update), _nextMpSync, 10] call CBA_fnc_waitAndExecute;
