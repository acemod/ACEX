/*
 * Author: Kingsley
 * Checks whether the given player can fortify.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Cost <NUMBER> (default: 0)
 *
 * Return Value:
 * Can Fortify <BOOL>
 *
 * Example:
 * [player] call acex_fortify_fnc_canFortify
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_player", ["_cost", 0]];

(missionNamespace getVariable [QGVAR(fortifyAllowed), true]) &&
{("ACE_Fortify" in (items _player))} &&
{
    private _budget = [side group _player] call FUNC(getBudget);
    ((_budget == -1) || {_budget > _cost})
}
