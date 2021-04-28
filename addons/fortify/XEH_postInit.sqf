#include "script_component.hpp"

if (isServer) then {
    GVAR(markerObjectHashmap) = createHashMap;
    publicVariable QGVAR(markerObjectHashmap);
    [QGVAR(registerObjects), LINKFUNC(registerObjects)] call CBA_fnc_addEventHandler;
    [QGVAR(objectPlaced), {
        params ["_unit", "_side", "_object"];
        TRACE_3("objectPlaced",_unit,_side,_object);
        private _jipID = [QGVAR(addActionToObject), [_side, _object]] call CBA_fnc_globalEventJIP;
        [_jipID, _object] call CBA_fnc_removeGlobalEventJIP; // idealy this function should be called on the server
        if (GVAR(markObjectsOnMap) isNotEqualTo 0 && {_object isKindOf "Static"}) then {
            // Wait ensures correct marker pos/rot as object is moved into position after creation
            [
                {_this call FUNC(createObjectMarker)}, 
                _object,
                1
            ] call CBA_fnc_waitAndExecute;
        };
    }] call CBA_fnc_addEventHandler;
};

if (!hasInterface) exitWith {};

GVAR(isPlacing) = PLACE_CANCEL;
["ace_interactMenuOpened", {GVAR(isPlacing) = PLACE_CANCEL}] call CBA_fnc_addEventHandler;

GVAR(objectRotationX) = 0;
GVAR(objectRotationY) = 0;
GVAR(objectRotationZ) = 0;

// Register CBA Chat command for admins (Example: #ace-fortify west small 200)
["ace-fortify", LINKFUNC(handleChatCommand), "admin"] call CBA_fnc_registerChatCommand;

[QGVAR(sideBudgetHint), {
    params ["_side"];
    if (_side isEqualTo side group ACE_player && {GVAR(settingHint) isEqualTo 2 || {GVAR(settingHint) isEqualTo 1 && {"ACE_Fortify" in (ACE_player call ACEFUNC(common,uniqueItems))}}}) then {
        private _budget = [_side] call FUNC(getBudget);
        TRACE_2("sideBudgetHint",_side,_budget);
        [format ["%1 $%2", LLSTRING(Budget), _budget]] call ACEFUNC(common,displayTextStructured);
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(addActionToObject), {
    params ["_side", "_object"];
    TRACE_2("addActionToObject EH",_side,_object);
    if (isNull _object) exitWith {};
    if (_side isEqualTo side group ace_player) then {
        private _budget = [_side] call FUNC(getBudget);
        private _cost = [_side, typeOf _object] call FUNC(getCost);
        private _text = [format ["Remove Object +$%1", _cost], "Remove Object"] select (_budget == -1);

        // Remove object action
        private _removeAction = [
            QGVAR(removeObject),
            _text,
            "",
            {
                params ["_target", "_player", "_params"];
                _params params ["_side"];
                TRACE_2("deleting placed object",_target,_params);
                [QGVAR(objectDeleted), [_player, _side, _target]] call CBA_fnc_globalEvent;
                deleteVehicle _target;
                _params call FUNC(updateBudget);
            },
            {(missionNamespace getVariable [QGVAR(fortifyAllowed), true]) && {"ACE_Fortify" in (_player call ACEFUNC(common,uniqueItems))}},
            {},
            [_side, _cost],
            {[0, 0, 0]},
            5
        ] call ACEFUNC(interact_menu,createAction);

        [_object, 0, ["ACE_MainActions"], _removeAction] call ACEFUNC(interact_menu,addActionToObject);
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(setMarkerVisible), {
    params ["_object"];
    [
        {!isNull player},
        {
            params ["_object"];
            private _currentUnit = call CBA_fnc_currentUnit;
            private _objectSide = _object getVariable QGVAR(objectSide);
            private _playerSide = side group _currentUnit;
            private _marker = _object getVariable QGVAR(mapMarker);
            // If enemy placed object, hide marker, else set visible
            private _alpha = if (GVAR(markObjectsOnMap) isEqualTo 1 && {_objectSide getFriend _playerSide < 0.6}) then {0} else {1};
            _marker setMarkerAlphaLocal _alpha;
        }, 
        _object
    ] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;


// Reset map marker alphas when the side of the controlled unit changes.
["group", {
    {
        private _object = _y;
        [QGVAR(setMarkerVisible), _object] call CBA_fnc_localEvent;
    } forEach GVAR(markerObjectHashmap);
}] call CBA_fnc_addPlayerEventHandler;