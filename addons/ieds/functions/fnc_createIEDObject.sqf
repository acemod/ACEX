
#include "script_component.hpp"

#define LAND_IEDS ["ACE_IEDLandBig_Range", "ACE_IEDLandSmall_Range"]
#define URBAN_IEDS ["ACE_IEDUrbanBig_Range", "ACE_IEDUrbanSmall_Range"]

params ["_logic"];

if (isNull _logic) exitwith {};

private _typeOfIED = _logic getvariable ["typeOfIED", 0];
private _sizeOfIED = _logic getvariable ["sizeOfIED", 0];
private _heightOfIED = _logic getvariable ["heightOfIED", 0];

_heightOfIED = switch (_heightOfIED) do {
    case 1: {-0.01};
    case 2: {-0.05};
    case 3: {-0.075};
    case 4: {-0.25};
    default {_heightOfIED};
};

private _iedClass = switch (_typeOfIED) do {
    case 0: { LAND_IEDS select _sizeOfIED };
    case 1: { URBAN_IEDS select _sizeOfIED };
};

private _iedCreated = _iedClass createVehicle [0,0,0];
_iedCreated setPos [getPos _Logic select 0, getPos _Logic select 1, (getPos _Logic select 2) + _heightOfIED];

if (_logic getvariable ["iedActivationType", 0] == 0) then {
    private _mine = createMine [_iedClass, getPos _iedCreated, [], 0];
    _mine setDir ((getDir _iedCreated) + 90);
    _mine setPos _iedCreated;
    _iedCreated setvariable [QGVAR(pressurePlate), _mine];
    hideObjectGlobal _mine;
};

_logic setvariable [QGVAR(linkedIED), _iedCreated, true]; // TODO do we need a global flag here?
_iedCreated setvariable [QGVAR(linkedIED), _logic, true]; // TODO do we need a global flag here?

_iedCreated addEventHandler ["Killed", {
    params ["_ied", "_killer"];

    private _logic = _ied getvariable [QGVAR(linkedIED), objNull];
    private _activationType = _logic getvariable ["iedActivationType", 0];
    [_logic] call FUNC(onIEDActivated);

    private _pressurePlate = _ied getvariable [QGVAR(pressurePlate), objNull];
    if (!isNull _pressurePlate) then {
        deleteVehicle _pressurePlate;
    };

    if (_activationType == -1) then {
        private _iedClass = typeOf _ied;
        private _iedPos = getPos _ied;
        private _ammoClass = getText(configFile >> "CfgVehicles" >> _iedClass >> "ammo");
        private _dummyIed = _ammoClass createVehicle _iedPos;
        _dummyIed setPos _iedPos;

        if (!isNil "ace_frag_fnc_addPfhRound") then {
            [objNull, _ammoClass, _dummyIed, true] call ace_frag_fnc_addPfhRound;
        };
        _dummyIed setDamage 1;
    };
    deleteVehicle _ied;
}];

["acex_iedCreated", [_iedCreated, _typeOfIED, _sizeOfIED, _heightOfIED]] call CBA_fnc_localEvent;

_iedCreated;
