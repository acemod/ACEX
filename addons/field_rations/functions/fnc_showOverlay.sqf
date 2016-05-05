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
 * [1] call ace_field_rations_fnc_showOverlay
 *
 * Public: No
 */
#include "script_component.hpp"

#define DEFAULT_ALPHA_LEVEL 0.6

params [["_transistionTime", 10]];

disableSerialization;
local _playerStatusUI = uiNamespace getVariable [QGVAR(PlayerStatusUI), displayNull];

local _drinkStatus = ACE_player getVariable [QGVAR(thirstStatus), 100];
local _foodStatus = ACE_player getVariable [QGVAR(hungerStatus), 100];
local _hudForceShow = ((_drinkStatus < 30) || {_foodStatus < 30});

if ((!isNull ACE_player) && {alive ACE_player} && {_hudForceShow || GVAR(hudInteractionHover)}) then {
    if ((!GVAR(hudIsShowing)) || {isNull _playerStatusUI}) then {
        //If we are not currently showing, open it up with the given transistion time
        GVAR(hudIsShowing) = true;
        (QGVAR(PlayerStatusUI) call BIS_fnc_rscLayer) cutRsc [QGVAR(PlayerStatusUI), "PLAIN", _transistionTime, false];
    };

    local _playerStatusUI = uiNamespace getVariable [QGVAR(PlayerStatusUI), displayNull];

    local _greenFood = _foodStatus/100;
    local _redFood = 1.0 - _greenFood;
    local _blueFood = 0;
    (_playerStatusUI displayCtrl 11112) ctrlSetTextColor [_redFood, _greenFood, _blueFood, DEFAULT_ALPHA_LEVEL];

    local _greenDrink = _drinkStatus/100;
    local _redDrink = 1.0 - _greenDrink;
    local _blueDrink = 0;
    (_playerStatusUI displayCtrl 11113) ctrlSetTextColor [_redDrink, _greenDrink, _blueDrink, DEFAULT_ALPHA_LEVEL];
} else {
    if (GVAR(hudIsShowing)) then {
        GVAR(hudIsShowing) = false;
        (QGVAR(PlayerStatusUI) call BIS_fnc_rscLayer) cutFadeOut _transistionTime;
    };
};
