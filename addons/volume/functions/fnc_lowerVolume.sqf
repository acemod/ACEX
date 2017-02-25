/*
 * Author: Kingsley
 * Lowers the game and music volume with values from ACE settings.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call acex_volume_fnc_lowerVolume;
 *
 * Public: No
 */
#include "script_component.hpp"

ACEGVAR(hearing,disableVolumeUpdate) = true;

private _coef = GVAR(reduction) / 10;
private _reductionGame = _coef * GVAR(initialGameVolume);
private _reductionMusic = _coef * GVAR(initialMusicVolume);

GVAR(fadeDelay) fadeSound (GVAR(initialGameVolume) - _reductionGame);
GVAR(fadeDelay) fadeMusic (GVAR(initialMusicVolume) - _reductionMusic);

GVAR(isLowered) = true;

if (GVAR(showNotification)) then {
    [localize LSTRING(Lowered)] call ACEFUNC(common,displayTextStructured);
};
