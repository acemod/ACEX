/*
 * Author: mharis001, Glowbal, PabstMirror
 * Shows the thirst and hunger status HUD. Will fade out HUD if not necessary.
 *
 * Arguments:
 * 0: Transition time (seconds) <NUMBER> (default: 10)
 * 1: Force <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [3] call acex_field_rations_fnc_showHud
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_transitionTime", 10], ["_force", false]];

// Check if values are low enough to force showing of HUD
private _thirstStatus = ACE_player getVariable [QGVAR(thirst), 100];
private _hungerStatus = ACE_player getVariable [QGVAR(hunger), 100];
private _hudForceShow = _thirstStatus <= GVAR(hudShowLevel) || {_hungerStatus <= GVAR(hudShowLevel)};

if (!(isNull ACE_player) && {alive ACE_player} && {_hudForceShow || {GVAR(hudInteractionHover)} || {_force}}) then {
    private _displayHud = uiNamespace getVariable [QGVAR(hud), displayNull];

    // Create HUD if currently not showing
    if (!GVAR(hudIsShowing) || {isNull _displayHud}) then {
        GVAR(hudIsShowing) = true;
        (QGVAR(hud) call BIS_fnc_rscLayer) cutRsc [QGVAR(hud), "PLAIN", _transitionTime, false];
        LOG("HUD display created");

        _displayHud = uiNamespace getVariable [QGVAR(hud), displayNull];
    };

    // Get HUD transparency based on setting
    private _alpha = if (GVAR(hudTransparency) == -1) then {
        linearConversion [100, 30, _thirstStatus min _hungerStatus, 0.2, 1, true];
    } else {
        GVAR(hudTransparency);
    };

    // Update control colours based on thirst and hunger value (White -> Yellow -> Orange -> Red)
    private _thirstGreen = linearConversion [10, 65, _thirstStatus, 0, 1, true];
    private _thirstBlue = linearConversion [60, 100, _thirstStatus, 0, 1, true];
    (_displayHud displayCtrl IDC_THIRST) ctrlSetTextColor [1, _thirstGreen, _thirstBlue, _alpha];

    private _hungerGreen = linearConversion [10, 65, _hungerStatus, 0, 1, true];
    private _hungerBlue = linearConversion [60, 100, _hungerStatus, 0, 1, true];
    (_displayHud displayCtrl IDC_HUNGER) ctrlSetTextColor [1, _hungerGreen, _hungerBlue, _alpha];
} else {
    if (GVAR(hudIsShowing)) then {
        GVAR(hudIsShowing) = false;
        (QGVAR(hud) call BIS_fnc_rscLayer) cutFadeOut 0.5; // cutFadeOut is weird, using _transitionTime isn't reliable
        LOG("HUD display closed");
    };
};
