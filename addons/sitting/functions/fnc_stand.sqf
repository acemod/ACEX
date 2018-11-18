#include "script_component.hpp"
/*
 * Author: Jonpas
 * Stands up the player.
 *
 * Arguments:
 * Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call acex_sitting_fnc_stand;
 *
 * Public: No
 */

params ["_player"];

(_player getVariable QGVAR(isSitting)) params ["_seat", "_actionID"];

// If MultiSitting unclaim seat
private _seatPos = _player getVariable [QGVAR(seatPos),""];
if !(_seatPos isEqualTo "") then {
    _seat setVariable [format["%1%2",QGVAR(pos_),_seatPos],false,true];
};

// Remove scroll-wheel action
_player removeAction _actionID;

// Restore animation
private _animation = switch (currentWeapon _player) do {
    case "": {"amovpercmstpsnonwnondnon"};
    case (primaryWeapon _player): {"amovpercmstpslowwrfldnon"};
    case (handgunWeapon _player): {"amovpercmstpslowwpstdnon"};
    default {"amovpercmstpsnonwnondnon"};
};

[_player, _animation, 2] call ACEFUNC(common,doAnimation);

// Set variables to nil
_player setVariable [QGVAR(isSitting), nil];

["ace_stoodUp", [_player, _seat]] call CBA_fnc_localEvent;

if (isNull _seat) exitWith {};
[objNull, _seat] call ACEFUNC(common,claim);
