/*
 * Author: Glowbal, PabstMirror
 * Opens the overlay when hovering over the surviaval actions in the interaction menu.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_field_rations_fnc_onHoverDisplay
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(hudInteractionHover) = true;
[0.25] call FUNC(showOverlay);
