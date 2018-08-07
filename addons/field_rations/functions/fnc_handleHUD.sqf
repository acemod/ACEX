/*
 * Author: mharis001
 * Handles creating and updating the visuals of the HUD.
 *
 * Arguments:
 * 0: Thirst <NUMBER> (default: getVariable from ACE_player)
 * 1: Hunger <NUMBER> (default: getVariable from ACE_player)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_thirst, _hunger] call acex_field_rations_fnc_handleHUD
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_thirst", ACE_player getVariable [QGVAR(thirst), 0]], ["_hunger", ACE_player getVariable [QGVAR(hunger), 0]]];

private _display = GETUVAR(GVAR(hudDisplay),displayNull);

// Create HUD if display is null
if (isNull _display) then {
    private _rscType = [QGVAR(hudColoredIcons), QGVAR(hudDrainingIcons)] select GVAR(hudType);
    HUD_LAYER cutRsc [_rscType, "PLAIN", -1, false];
    _display = GETUVAR(GVAR(hudDisplay),displayNull);
};

if (GVAR(hudType) == 0) then {
    // Calculate HUD transparency based on setting
    private _alpha = if (GVAR(hudTransparency) == -1) then {
        linearConversion [0, 70, _thirst max _hunger, [0, 0.5] select GVAR(hudInteractionHover), 1, true];
    } else {
        GVAR(hudTransparency);
    };

    // Update HUD icon colors (White -> Yellow -> Orange -> Red)
    (_display displayCtrl IDC_COLORED_HUD_THIRST) ctrlSetTextColor [
        1,
        linearConversion [35, 90, _thirst, 1, 0, true],
        linearConversion [0, 40, _thirst, 1, 0, true],
        _alpha
    ];
    (_display displayCtrl IDC_COLORED_HUD_HUNGER) ctrlSetTextColor [
        1,
        linearConversion [35, 90, _hunger, 1, 0, true],
        linearConversion [0, 40, _hunger, 1, 0, true],
        _alpha
    ];
} else {
    // Reposition controls group and icon to create draining effect
    private _defaultY = profileNamespace getVariable [QUOTE(TRIPLES(IGUI,GVAR(grid),Y)), safeZoneY + safeZoneH - 2.2 * GUI_GRID_H];
    {
        _x params ["_status", "_groupIDC", "_iconIDC"];

        private _changeY = _status / 50 * GUI_GRID_H;

        private _groupCtrl = _display displayCtrl _groupIDC;
        private _groupPos = ctrlPosition _groupCtrl;
        _groupPos set [1, _defaultY + _changeY];
        _groupCtrl ctrlSetPosition _groupPos;
        _groupCtrl ctrlCommit 0;

        private _iconCtrl = _display displayCtrl _iconIDC;
        _iconCtrl ctrlSetPosition [0, -_changeY];
        _iconCtrl ctrlCommit 0;
    } forEach [
        [_thirst, IDC_DRAINING_HUD_THIRST_GROUP, IDC_DRAINING_HUD_THIRST_ICON],
        [_hunger, IDC_DRAINING_HUD_HUNGER_GROUP, IDC_DRAINING_HUD_HUNGER_ICON]
    ];
};
