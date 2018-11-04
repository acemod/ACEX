/*
 * Author: PabstMirror, mharis001
 * Dynamically adds water actions to nearby water objects when interact_menu is opened.
 * Called by the "ace_interactMenuOpened" event.
 *
 * Arguments:
 * Interact Menu Type (0 - World, 1 - Self) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call acex_field_rations_fnc_addWaterSourceInteractions
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_interactionType"];
TRACE_1("addWaterSourceInteractions",_interactionType);

// Ignore self-interaction menu or mounted vehicle interaction
if (_interactionType != 0 || {vehicle ACE_player != ACE_player}) exitWith {};
TRACE_1("Starting interact PFH",_interactionType);

[{
    BEGIN_COUNTER(interactEH);
    params ["_args", "_pfhID"];
    _args params ["_setPosition", "_addedHelpers", "_fencesHelped"];

    if (!ACEGVAR(interact_menu,keyDown)) then {
        TRACE_1("Ending interact PFH",_pfhID);
        {deleteVehicle _x} forEach _addedHelpers;
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    } else {
        // Prevent rare error when ending mission with interact key down
        if (isNull ACE_player) exitWith {};

        // Rescan if player has moved more than 5 meters from last position
        if (getPosASL ACE_player distanceSqr _setPosition > 25) then {
            BEGIN_COUNTER(updatePosition);
            {
                if (!(_x in _fencesHelped)) then {
                    private _waterRemaining = [_x] call FUNC(getRemainingWater);
                    if ((_waterRemaining == REFILL_WATER_INFINITE) || {_waterRemaining > 0}) then {
                        _fencesHelped pushBack _x;
                        private _helper = QGVAR(helper) createVehicleLocal [0, 0, 0];
                        _helper setVariable [QGVAR(waterSource), _x];
                        // private _offset = getArray (configFile >> "CfgVehicles" >> (typeOf _x) >> QGVAR(offset));
                        // if (_offset isEqualTo []) then {_offset = [0,0,0]};
                        _helper setPosASL AGLtoASL (_x modelToWorld [0,0,0]);
                        _addedHelpers pushBack _helper;
                        TRACE_3("added interaction helper",_x,typeOf _x,_waterRemaining);
                    };
                };
            } forEach nearestObjects [ACE_player, [], 15];

            _args set [0, getPosASL ACE_player];
            END_COUNTER(updatePosition);
        };
    };
    END_COUNTER(interactEH);
}, 0.5, [getPosASL ACE_player vectorAdd [-100, 0, 0], [], []]] call CBA_fnc_addPerFrameHandler;
