/*
 * Author: Kingsley
 * Checks whether the given player can fortify.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Boolean
 *
 * Example:
 * [player] call acex_fortify_fnc_canFortify;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

private _budget = [side group _unit] call FUNC(getBudget);

("ACE_FortifyPickaxe" in (items _unit)) &&
{(_budget == -1 || _budget > 0)}
