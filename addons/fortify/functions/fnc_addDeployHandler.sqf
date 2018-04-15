/*
 * Author: Cuel
 * Register a custom deployment validator
 * Provided code is passed [unit, object, cost]
 * Code needs to return BOOL: true(allowed) / false(blocked)
 *
 * Arguments:
 * 0: Code <CODE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [{alive param [0]}] call acex_fortify_fnc_addDeployValidator;
 *
 * Public: Yes
 */

#include "script_component.hpp"
params [["_code", {true}, [{}]]];

GVAR(deployHandlers) pushBack _code;
