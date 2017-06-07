/*
 * Author: Kingsley
 * Handles the chat command usage by admin.
 *
 * Arguments:
 * 0: Args <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_args"];

_args = _args splitString " ";
private _command = toLower (_args select 0);
_args deleteAt 0;

private _hasApex = 395180 in (getDLCs 1);

switch (_command) do {
    // Turns fortify mode on
    case "on": {
        GVAR(mode) = true;
        publicVariable QGVAR(mode);
    };

    // Turns fortify mode off
    case "off": {
        GVAR(mode) = false;
        publicVariable QGVAR(mode);
    };

    // Registers fortify presets for given side
    default {
        _args params [["_preset", "small"], ["_budget", "-1"]];

        private _side = [_command] call FUNC(parseSide);
        _budget = parseNumber _budget;

        private _objects = switch (_preset) do {
            case "small": {[[
                ["Land_BagFence_Short_F", 5],
                ["Land_BagFence_Round_F", 5],
                ["Land_BagFence_Long_F", 5],
                ["Land_BagFence_End_F", 5],
                ["Land_BagFence_Corner_F", 5],
                ["Land_BagBunker_Small_F", 25]
            ], [
                ["Land_BagFence_01_corner_green_F", 5],
                ["Land_BagFence_01_end_green_F", 5],
                ["Land_BagFence_01_long_green_F", 5],
                ["Land_BagFence_01_round_green_F", 5],
                ["Land_BagFence_01_short_green_F", 5],
                ["Land_Plank_01_4m_F", 10],
                ["Land_WoodenShelter_01_F", 25]
            ]] select _hasApex};

            case "medium": {[[
                ["Land_HBarrierTower_F", 100],
                ["Land_HBarrierWall4_F", 25],
                ["Land_HBarrierWall_corner_F", 25],
                ["Land_HBarrierWall_corridor_F", 25],
                ["Land_HBarrier_1_F", 5]
            ], [
                ["Land_HBarrier_01_big_tower_green_F", 100],
                ["Land_HBarrier_01_wall_4_green_F", 25],
                ["Land_HBarrier_01_wall_corner_green_F", 25],
                ["Land_HBarrier_01_wall_corridor_green_F", 25],
                ["Land_HBarrier_01_line_1_green_F", 5]
            ]] select _hasApex};

            case "big": {[[
                ["Land_BagBunker_Tower_F", 50],
                ["Land_BagBunker_Large_F", 100],
                ["Land_BagBunker_Small_F", 25],
                ["Land_Cargo_Patrol_V1_F", 100],
                ["Land_BagFence_Short_F", 5],
                ["Land_BagFence_Round_F", 5],
                ["Land_BagFence_Long_F", 5],
                ["Land_BagFence_End_F", 5],
                ["Land_BagFence_Corner_F", 5]
            ], [
                ["Land_PillboxBunker_01_big_F", 100],
                ["Land_PillboxWall_01_3m_F", 10],
                ["Land_PillboxWall_01_6m_F", 15],
                ["Land_PillboxBunker_01_hex_F", 50],
                ["Land_PillboxBunker_01_rectangle_F", 50],
                ["Land_Plank_01_8m_F", 10],
                ["Land_Plank_01_4m_F", 5],
                ["Land_BagFence_01_corner_green_F", 5],
                ["Land_BagFence_01_end_green_F", 5],
                ["Land_BagFence_01_long_green_F", 5],
                ["Land_BagFence_01_round_green_F", 5],
                ["Land_BagFence_01_short_green_F", 5]
            ]] select _hasApex};

            default {[]};
        };

        [QGVAR(registerObjects), [_side, _budget, _objects]] call CBA_fnc_serverEvent;
    };
};
