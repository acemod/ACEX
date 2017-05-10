#include "script_component.hpp"

if (!hasInterface) exitWith {};

[west, 1000, [
    ["Land_HBarrier_01_tower_green_F", 10],
    ["Land_BagBunker_01_small_green_F", 10],
    ["Land_BagBunker_01_large_green_F", 10],
    ["Land_BagFence_01_long_green_F", 10],
    ["Land_BagFence_01_round_green_F", 10],
    ["Land_PillboxBunker_01_big_F", 10],
    ["Land_PillboxBunker_01_hex_F", 10],
    ["Land_PillboxBunker_01_rectangle_F", 10],
    ["Land_WoodenShelter_01_F", 10],
    ["Land_Razorwire_F", 10],
    ["CamoNet_BLUFOR_open_F", 10]
]] call acex_fortify_fnc_registerObjects;

["ace_interactMenuOpened", {
    if (ace_player getVariable [QGVAR(isDeploying), false]) then {
        [ace_player] call FUNC(deployCancel);
    };
}] call CBA_fnc_addEventHandler;
