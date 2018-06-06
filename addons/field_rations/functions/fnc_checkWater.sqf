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

private _water = _source call FUNC(getRemainingWater);

[
    CHECK_WATER_TIME,
    [_player, _water],
    {
        (_this select 0) params ["_player", "_water"];
        if (_water > 0) then {
            if (_water == 1) then {
                [LSTRING(RemainingWaterLitre), 1.5, _player] call ACEFUNC(common,displayTextStructured);
            } else {
                [[LSTRING(RemainingWaterLitres), _water], 1.5, _player] call ACEFUNC(common,displayTextStructured);
            };
        } else {
            [LSTRING(NoWaterRemaining), 1.5, _player] call ACEFUNC(common,displayTextStructured);
        };
    },
    {},
    localize LSTRING(CheckingWater)
] call ACEFUNC(common,progressBar);
