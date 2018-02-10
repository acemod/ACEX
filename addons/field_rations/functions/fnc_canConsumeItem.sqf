#include "script_component.hpp"

params ["", "_player", "_itemClass"];

// Check: can interact, player still has item, in vehicle or not moving (fast)
[_player, _player, ["isNotInside"]] call ACEFUNC(common,canInteractWith)
&& {_itemClass in (items _player)}
&& {vehicle _player != _player || {vectorMagnitude (velocity _player) < 1}}
