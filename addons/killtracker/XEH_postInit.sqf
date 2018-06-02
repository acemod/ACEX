/*
 * Author: PabstMirror
 * Tracks deaths/kills and logs to the end mission disaplay
 * Attemps to log kills from ace_medical by using ace_medical_lastDamageSource
 *
 * Note: Requires config setup in a mission's description.ext
 * Has no effect if mission is not setup correctly
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

// place the following in a misison's description.ext:
/*
    class CfgDebriefingSections {
        class acex_killTracker {
            title = "Acex Killed Events";
            variable = "acex_killTracker_outputText";
        };
    };
 */
if ((getText (missionconfigfile >> "CfgDebriefingSections" >> QUOTE(ADDON) >> "variable")) != QGVAR(outputText)) exitWith {
    TRACE_1("no mission debriefing config",_this);
};

INFO("Running Kill Tracking");

// Variables:
GVAR(eventsArray) = [];
GVAR(outputText) = "Total Kills: 0";
GVAR(killCount) = 0;

// Add Event Handlers:
[QGVAR(kill), {
    params ["_name", "_killInfo"];
    TRACE_2("kill eh",_name,_killInfo);
    // Increment kill counter
    GVAR(killCount) = GVAR(killCount) + 1;
    GVAR(eventsArray) pushBack format ["Killed: %1 %2", _name, _killInfo];
    GVAR(outputText) = (format ["Total Kills: %1<br/>", GVAR(killCount)]) + (GVAR(eventsArray) joinString "<br/>");
}] call CBA_fnc_addEventHandler;

[QGVAR(death), {
    params ["_name", "_killInfo"];
    TRACE_2("death eh",_name,_killInfo);
    GVAR(eventsArray) pushBack format ["Died: %1 %2", _name, _killInfo];
    GVAR(outputText) = (format ["Total Kills: %1<br/>", GVAR(killCount)]) + (GVAR(eventsArray) joinString "<br/>");
}] call CBA_fnc_addEventHandler;

// Add Killed Event Handler - killed EH and lastDamageSource var are local only
["CAManBase", "killed", {
    params ["_unit", ["_killer", objNull]];
    TRACE_2("killed",_unit,_killer);

    private _killInfo = [];
    if ((isNull _killer) || {_killer == _unit}) then {
        private _aceSource = _unit getVariable ["ace_medical_lastDamageSource", objNull];
        TRACE_1("",_aceSource);
        if ((!isNull _aceSource) && {_aceSource != _unit}) then {
            _killInfo pushBack "Last damage";
            _killer = _aceSource;
        };
    };

    // If killer is a vehicle get the commander (this is how vanilla does it?) and log the vehicle type
    if ((!isNull _killer) && {!(_killer isKindof "CAManBase")}) then {
        _killInfo pushBack format ["Vehicle: %1", getText (configfile >> "CfgVehicles" >> (typeOf _killer) >> "displayName")];
        _killer = effectiveCommander _killer;
    };

    private _unitIsPlayer = hasInterface && {_unit == ace_player}; // isPlayer check will fail at this point
    private _killerIsPlayer = (!isNull _killer) && {_unit != _killer} && {[_killer] call ACEFUNC(common,isPlayer)};
    TRACE_2("",_unitIsPlayer,_killerIsPlayer);

    // Don't do anything if neither are players
    if (!(_unitIsPlayer || _killerIsPlayer)) exitWith {};

    // Log firendly fire
    private _fnc_getSideFromConfig = {
        params ["_object"];
        switch (getNumber (configFile >> "CfgVehicles" >> (typeOf _object) >> "side")) do {
            case (0): {east};
            case (1): {west};
            case (2): {resistance};
            default {civilian};
        };
    };
    if ((!isNull _killer) && {_unit != _killer} && {_killer isKindOf "CAManBase"}) then {
        // Because of unconscious group switching/captives it's probably best to just use unit's config side
        private _unitSide = [_unit] call _fnc_getSideFromConfig;
        private _killerSide = [_killer] call _fnc_getSideFromConfig;
        if ([_unitSide, _killerSide] call BIS_fnc_areFriendly) then {
            _killInfo pushBack "<t color='#ff0000'>Friendly Fire</t>";
        };
    };

    // Log bleed out - ToDo: could change setDead to log the specific medical cause (e.g. blood loss / cardiac arrest / overdose)
    private _bloodVolume = _unit getVariable ["ace_medical_bloodVolume", 100];
    if (_bloodVolume <= 60) then {
        _killInfo pushBack format ["Blood %1%2", floor _bloodVolume, "%"];
    };

    // Parse info into text
    _killInfo = if (_killInfo isEqualTo []) then {
        ""
    } else {
        format [" - [%1]", (_killInfo joinString ", ")];
    };

    // If unit was player then send event to self
    if (_unitIsPlayer) then {
        private _killerName = "Self?";
        if ((!isNull _killer) && {_unit != _killer}) then {
            if (_killerIsPlayer) then {
                _killerName = [_killer, true, false] call ACEFUNC(common,getName);
            } else {
                _killerName = format ["*AI* - %1", getText (configfile >> "CfgVehicles" >> (typeOf _killer) >> "displayName")];
            };
        };
        TRACE_3("send death event",_unit,_killerName,_killInfo);
        [QGVAR(death), [_killerName, _killInfo]] call CBA_fnc_localEvent;
    };

    // If killer was player then send event to killer
    if (_killerIsPlayer) then {
        private _unitName = if (_unitIsPlayer) then {
            [_unit, true, false] call ACEFUNC(common,getName); // should be same as profileName
        } else {
            format ["*AI* - %1", getText (configfile >> "CfgVehicles" >> (typeOf _unit) >> "displayName")];
        };
        TRACE_3("send kill event",_killer,_unitName,_killInfo);
        [QGVAR(kill), [_unitName, _killInfo], _killer] call CBA_fnc_targetEvent;
    };
}] call CBA_fnc_addClassEventHandler;
