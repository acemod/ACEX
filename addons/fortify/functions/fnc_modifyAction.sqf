 /*
 * Author: PabstMirror
 * Modifies the fortify action, shows current budget.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 * 2: Args <ANY>
 * 3: Action Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, player, [], []] call acex_fortify_fnc_modifyAction
 *
 * Public: No
 */
#include "script_component.hpp"

params ["", "_player", "", "_actionData"];

private _budget = [side group _player] call FUNC(getBudget);
private _actionText = if (_budget > 0) then {
    format ["%1 [$%2]", localize LSTRING(fortify), _budget];
} else {
    localize LSTRING(fortify);
};

_actionData set [1, _actionText];
