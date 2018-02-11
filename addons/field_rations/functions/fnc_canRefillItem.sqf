#include "script_component.hpp"

params ["_waterSource", "_player", "_itemClass"];

private _cfg = configFile >> "CfgWeapons" >> _itemClass;

[_player, _waterSource, []] call ACEFUNC(common,canInteractWith)
&& {getText (_cfg >> QGVAR(onRefill)) != ""}
