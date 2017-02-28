/*
 * Author: Glowbal, PabstMirror
 * Show the food and water status overlay
 *
 * Arguments:
 * 0: Hud Transistion Time (second) <NUMBER>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [1] call acex_field_rations_fnc_showOverlay
 *
 * Public: No
 */
#include "script_component.hpp"

#define DEFAULT_ALPHA_LEVEL 0.9

params [["_transistionTime", 10]];

disableSerialization;
private _playerStatusUI = uiNamespace getVariable [QGVAR(PlayerStatusUI), displayNull];

private _drinkStatus = ACE_player getVariable [QGVAR(thirstStatus), 100];
private _foodStatus = ACE_player getVariable [QGVAR(hungerStatus), 100];
private _hudForceShow = ((_drinkStatus < 30) || {_foodStatus < 30});

if ((!isNull ACE_player) && {alive ACE_player} && {_hudForceShow || GVAR(hudInteractionHover)}) then {
    if ((!GVAR(hudIsShowing)) || {isNull _playerStatusUI}) then {
        //If we are not currently showing, open it up with the given transistion time
        GVAR(hudIsShowing) = true;
        (QGVAR(PlayerStatusUI) call BIS_fnc_rscLayer) cutRsc [QGVAR(PlayerStatusUI), "PLAIN", _transistionTime, false];
    };

    private _playerStatusUI = uiNamespace getVariable [QGVAR(PlayerStatusUI), displayNull];

    private _greenFood = _foodStatus/100;
    private _redFood = 1.0 - _greenFood;
    private _blueFood = 0;
    (_playerStatusUI displayCtrl 11112) ctrlSetTextColor [_redFood, _greenFood, _blueFood, DEFAULT_ALPHA_LEVEL];

    private _greenDrink = _drinkStatus/100;
    private _redDrink = 1.0 - _greenDrink;
    private _blueDrink = 0;
    (_playerStatusUI displayCtrl 11113) ctrlSetTextColor [_redDrink, _greenDrink, _blueDrink, DEFAULT_ALPHA_LEVEL];
} else {
    if (GVAR(hudIsShowing)) then {
        GVAR(hudIsShowing) = false;
        (QGVAR(PlayerStatusUI) call BIS_fnc_rscLayer) cutFadeOut _transistionTime;
    };
};
