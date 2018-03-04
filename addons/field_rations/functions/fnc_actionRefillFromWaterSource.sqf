/*
 * Author: Glowbal, PabstMirror
 * Starts a progressBar for refilling from a source, and adds the filled item.
 *
 * Arguments:
 * 0: Water Source <OBJECT>
 * 1: Player <OBJECT>
 * 2: Item Classname <STRING>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [barrel, player, "ACE_waterbottle_half"] call acex_field_rations_fnc_actionRefillFromWaterSource
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_waterSource", "_player", "_originalItem"];

// Prepare all info necessary for completing the action
private _onRefillItem = getText (configFile >> "CfgWeapons" >> _originalItem >> QGVAR(onRefill));
if (_onRefillItem == "") exitwith {ERROR_1("No onRefill string", _originalItem);};

private _progressBarText = localize LSTRING(Refilling);

private _onFinish = {
    (_this select 0) params ["_waterSource", "_player", "_oldItem", "_onRefillItem"];
    TRACE_3("Refil Finish",_player,_oldItem,_onRefillItem);

    // Switch out the old item by the newly refilled item
    _player removeItem _oldItem;
    [_player, _onRefillItem] call ACEFUNC(common,addToInventory);
};

private _onFailure = {
    TRACE_1("Refil Interrupted", _this);
};

[
    6,
    [_waterSource,_player,_originalItem,_onRefillItem],
    _onFinish,
    _onFailure,
    _progressBarText,
    {(_this select 0) call FUNC(canRefillFromWaterSource)}
] call ACEFUNC(common,progressBar);
