/*
 * Author: Kingsley
 * Gets placeable object classnames and values.
 *
 * Arguments:
 * 0: Size <STRING>
 *
 * Return Value:
 * <ARRAY>
 *
 * Example:
 * ["small"] call acex_fortify_fnc_getPlaceableSet
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_preset"];
TRACE_1("getPlaceableSet",_preset);

if (_preset == "small") exitWith {
    [
    ["Land_BagFence_Short_F", 5],
    ["Land_BagFence_Round_F", 5],
    ["Land_BagFence_Long_F", 5],
    ["Land_BagFence_End_F", 5],
    ["Land_BagFence_Corner_F", 5],
    ["Land_Plank_01_4m_F", 10],
    ["Land_BagBunker_Small_F", 25]
    ]
};
if (_preset == "smallGreen") exitWith {
    [
    ["Land_BagFence_01_corner_green_F", 5],
    ["Land_BagFence_01_end_green_F", 5],
    ["Land_BagFence_01_long_green_F", 5],
    ["Land_BagFence_01_round_green_F", 5],
    ["Land_BagFence_01_short_green_F", 5],
    ["Land_Plank_01_4m_F", 10],
    ["Land_WoodenShelter_01_F", 25]
    ]
};
if (_preset == "medium") exitWith {
    [
    ["Land_HBarrierTower_F", 100],
    ["Land_HBarrierWall4_F", 25],
    ["Land_HBarrierWall_corner_F", 25],
    ["Land_HBarrierWall_corridor_F", 25],
    ["Land_HBarrier_1_F", 5]
    ]
};
if (_preset == "mediumGreen") exitWith {
    [
    ["Land_HBarrier_01_big_tower_green_F", 100],
    ["Land_HBarrier_01_wall_4_green_F", 25],
    ["Land_HBarrier_01_wall_corner_green_F", 25],
    ["Land_HBarrier_01_wall_corridor_green_F", 25],
    ["Land_HBarrier_01_line_1_green_F", 5]
    ]
};
if (_preset == "big") exitWith {
    [
    ["Land_BagBunker_Tower_F", 50],
    ["Land_BagBunker_Large_F", 100],
    ["Land_BagBunker_Small_F", 25],
    ["Land_Cargo_Patrol_V1_F", 100],
    ["Land_BagFence_Short_F", 5],
    ["Land_BagFence_Round_F", 5],
    ["Land_BagFence_Long_F", 5],
    ["Land_BagFence_End_F", 5],
    ["Land_BagFence_Corner_F", 5]
    ]
};
if (_preset == "bigGreen") exitWith {
    [
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
    ]
};

WARNING_1("Preset [%1] not found in presets",_preset);

[]
