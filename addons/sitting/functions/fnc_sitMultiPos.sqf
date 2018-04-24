/*
 * Author: Jonpas for ACEX Sitting fnc_sit, modified by vabene1111
 * Sits down the player on an object supporting multiple positions
 *
 * Arguments:
 * 0: Seat <OBJECT>
 * 1: Player <OBJECT>
 * 2: Seat Position <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [seat,player,1] call acex_sitting_fnc_sitMultiPos;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_seat","_player","_seatPos"];
life_test = _this;

// Overwrite weird position, because Arma decides to set it differently based on current animation/stance...
_player switchMove "amovpknlmstpsraswrfldnon";

// Add scroll-wheel action to stand up
private _actionID = _player addAction [
    format ["<t color='#FFFF00'>%1</t>", localize LSTRING(Stand)],
    QUOTE((_this select 0) call FUNC(stand)),
    nil,
    20,
    false,
    true,
    "GetOut",
    QUOTE(_this call FUNC(canStand))
];

// Read config
private _configFile = configFile >> "CfgVehicles" >> typeOf _seat;

private _sitDirection = (getDir _seat) + getNumber (_configFile >> QGVAR(sitDirection));
private _sitPositionAll = getArray (_configFile >> QGVAR(sitPosition));

private _sitPosition = _sitPositionAll select _seatPos;

// Get random animation and perform it (before moving player to ensure correct placement)
[_player, call FUNC(getRandomAnimation), 2] call ACEFUNC(common,doAnimation); // Correctly places when using non-transitional animations
[_player, "", 1] call ACEFUNC(common,doAnimation); // Correctly applies animation's config values (such as disallow throwing of grenades, intercept keybinds... etc).

// Set direction and position
_player setDir _sitDirection;
//modelToWorld returns AGL
_player setPosASL (AGLtoASL (_seat modelToWorld _sitPosition));

// Set variables, save seat object on player
_player setVariable [QGVAR(isSitting), [_seat, _actionID]];
_player setVariable [QGVAR(seatPos), _seatPos];
_seat setVariable [format["%1%2",QGVAR(pos_),_seatPos],true,true];

// Add automatical stand PFH in case of interruptions
private _seatPosOrig = getPosASL _seat;
[{
    params ["_args", "_pfhId"];
    _args params ["_player", "_seat", "_seatPosOrig","_seatPosConfig"];

    // Remove PFH if not sitting any more
    if (isNil {_player getVariable QGVAR(isSitting)}) exitWith {
        [_pfhId] call CBA_fnc_removePerFrameHandler;
        TRACE_1("Remove PFH",_player getVariable [ARR_2(QGVAR(isSitting), false)]);
    };

    //  Stand up if chair gets deleted or moved
    if (isNull _seat || {getPosASL _player distance _seatPosOrig > 1} || {((getPosASL _seat) vectorDistance _seatPosOrig) > 0.01}) exitWith {
        _player call FUNC(stand);
        TRACE_2("Chair moved",getPosASL _seat,_seatPosOrig);
    };
}, 0, [_player, _seat, _seatPosOrig]] call CBA_fnc_addPerFrameHandler;

["ace_satDown", [_player, _seat]] call CBA_fnc_localEvent;
