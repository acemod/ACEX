#include "script_component.hpp"

// 10 sec (interval) * 100 (percent) / 3600 (sec in hour) = 0.2777778
#define DESCENT_CONSTANT 0.2777778

params ["_nextMpSync"];

if (isNull ACE_player || {!alive ACE_player}) then {
    //code
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
};

[LINKFUNC(update), _nextMpSync, 10] call CBA_fnc_waitAndExecute;
