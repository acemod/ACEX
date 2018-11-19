/*
 * Author: mharis001
 * Displays the remaining water in the given water source.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Water source <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _source] call acex_field_rations_fnc_checkWater
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_source"];

[
    CHECK_WATER_TIME,
    [_player, _source],
    {
        params ["_args"];
        _args params ["_player", "_source"];

        private _water = _source call FUNC(getRemainingWater);

        if (_water > 0) then {
            [[LSTRING(RemainingWater), _water], 1.5, _player] call ACEFUNC(common,displayTextStructured);
        } else {
            [LSTRING(NoWaterRemaining), 1.5, _player] call ACEFUNC(common,displayTextStructured);
        };
    },
    {},
    localize LSTRING(CheckingWater)
] call ACEFUNC(common,progressBar);
