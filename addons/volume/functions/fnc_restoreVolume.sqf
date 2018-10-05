#include "script_component.hpp"
/*
 * Author: Kingsley
 * Restores the game and music volume to what it was when the mission first started,
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call acex_volume_fnc_restoreVolume;
 *
 * Public: No
 */

ACEGVAR(hearing,disableVolumeUpdate) = false;

GVAR(fadeDelay) fadeSound GVAR(initialGameVolume);
GVAR(fadeDelay) fadeMusic GVAR(initialMusicVolume);

GVAR(isLowered) = false;

if (GVAR(showNotification)) then {
    [localize LSTRING(Restored)] call ACEFUNC(common,displayTextStructured);
};
