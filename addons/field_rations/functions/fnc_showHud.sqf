/*
 * Author: mharis001, Glowbal, PabstMirror
 * Shows the thirst and hunger status HUD. Will fade out HUD if not necessary.
 *
 * Arguments:
 * 0: Transition time (seconds) <NUMBER>
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
private _hudForceShow = _thirstStatus < 30 || {_hungerStatus < 30};

if (!(isNull ACE_player) && {alive ACE_player} && {_hudForceShow || {GVAR(hudInteractionHover)} || {_force}}) then {
    private _displayHud = uiNamespace getVariable [QGVAR(hud), displayNull];

    // Create HUD if currently not showing
    if (!GVAR(hudIsShowing) || {isNull _displayHud}) then {
        GVAR(hudIsShowing) = true;
        (QGVAR(hud) call BIS_fnc_rscLayer) cutRsc [QGVAR(hud), "PLAIN", _transitionTime, false];
        LOG("HUD display created");

        _displayHud = uiNamespace getVariable [QGVAR(hud), displayNull];
    };

    // Update control colours based on thirst and hunger value (White -> Yellow -> Orange -> Red)
    private _thirstRed = 1;
    private _thirstGreen = linearConversion [10, 65, _thirstStatus, 0, 1, true];
    private _thirstBlue = linearConversion [60, 100, _thirstStatus, 0, 1, true];
    (_displayHud displayCtrl IDC_THIRST) ctrlSetTextColor [_thirstRed, _thirstGreen, _thirstBlue, 0.7];

    private _hungerRed = 1;
    private _hungerGreen = linearConversion [10, 65, _hungerStatus, 0, 1, true];
    private _hungerBlue = linearConversion [60, 100, _hungerStatus, 0, 1, true];
    (_displayHud displayCtrl IDC_HUNGER) ctrlSetTextColor [_hungerRed, _hungerGreen, _hungerBlue, 0.7];
} else {
    if (GVAR(hudIsShowing)) then {
        GVAR(hudIsShowing) = false;
        (QGVAR(hud) call BIS_fnc_rscLayer) cutFadeOut 0.5; // cutFadeOut is weird, using _transitionTime isn't reliable
        LOG("HUD display closed");
    };
};
