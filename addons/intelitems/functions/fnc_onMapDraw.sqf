/*
 * Author: PabstMirror
 * Handles the map draw event, sets up intel buttons.
 *
 * Arguments:
 * 0: Map Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call acex_intelitems_fnc_onMapDraw
 *
 * Public: No
 */
#include "script_component.hpp"

//Don't need to run every frame:
if (diag_tickTime < GVAR(nextMapUpdate)) exitWith {};
GVAR(nextMapUpdate) = diag_tickTime + 5;

disableSerialization;

private _intelMagazines = [];
_intelMagazines append (([ACE_player, QGVAR(document)] call CBA_fnc_getMagazineIndex) apply {[_x, TYPE_DOCUMENT]});
_intelMagazines append (([ACE_player, QGVAR(photo)] call CBA_fnc_getMagazineIndex) apply {[_x, TYPE_PHOTO]});
_intelMagazines append (([ACE_player, QGVAR(notepad)] call CBA_fnc_getMagazineIndex) apply {[_x, TYPE_NOTEPAD]});
TRACE_1("",_intelMagazines);

//Fast exit for common case:
if ((_intelMagazines isEqualTo []) && {GVAR(mapIcons) isEqualTo []} && {GVAR(mapDisplays) isEqualTo []}) exitWith {};

//Get Intel from magIds:
private _missingData = false;
private _intelArray = [];
{
    _x params ["_xMagID", "_xType"];
    private _intelIndex = GVAR(intelMap) getVariable _xMagID;
    if (isNil "_intelIndex") then {
        _missingData = true;
        if (!(_xMagID in GVAR(dataRequested))) then {
            GVAR(dataRequested) pushBack _xMagID;
            TRACE_1("sending request for index",_xMagID);
            [QGVAR(requestMagIndex), [_xMagID, _xType]] call CBA_fnc_serverEvent;
        };
    } else {
        private _intel = missionNamespace getVariable (format [QGVAR(intel_%1), _intelIndex]);
        if (isNil "_intel") exitWith {ACE_LOGERROR_1("Bad data on intel index [%1]",_intelIndex);};
        _intel params ["_type", "_data"];
        TRACE_2("intel",_type,_data);
        _intelArray pushBack [_x, _intelIndex, _type, _data];
    };
} forEach _intelMagazines;

if (_missingData) exitWith {
    TRACE_1("Waiting On Data",_missingData);
    GVAR(nextMapUpdate) = diag_tickTime + 0.1;
};

//Set and create new Icons:
{
    _x params ["_magID", "_intelIndex", "_type", "_data"];

    if (_forEachIndex >= (count GVAR(mapIcons))) then {
        private _icon = (findDisplay 12) ctrlCreate ["ctrlButtonToolbar", -1];
        TRACE_2("creating icon",_forEachIndex,_icon);
        _icon ctrlAddEventHandler ["ButtonClick", {[_this select 0, false] call FUNC(onIntelButtonClick);}];
        GVAR(mapIcons) pushBack _icon;
    };

    private _icon = GVAR(mapIcons) select _forEachIndex;
    private _iconImage = switch (_type) do {
    case (TYPE_DOCUMENT): {QUOTE(PATHTOF(UI\document_ca.paa))};
    case (TYPE_PHOTO): {QUOTE(PATHTOF(UI\photo_ca.paa))};
    case (TYPE_NOTEPAD): {QUOTE(PATHTOF(UI\notepad_ca.paa))};
    };

    _icon setVariable [QGVAR(intelIndex), _intelIndex];
    _icon ctrlSetText _iconImage;
    _icon ctrlSetPosition [safeZoneX + _forEachIndex * 105 * pixelW,  safeZoneY + safezoneH - 100 * pixelH, 100 * pixelW, 100 * pixelH];
    _icon ctrlCommit 0;
} forEach _intelArray;
//Cleanup Extra Icons:
while {(count _intelArray) > (count GVAR(mapIcons))} do {
    TRACE_2("removing icon",count _intelArray,count GVAR(mapIcons));
    private _icon = GVAR(mapIcons) deleteAt ((count GVAR(mapIcons)) - 1);
    ctrlDelete _icon;
};

//Update Map Displays:
GVAR(mapDisplays) = GVAR(mapDisplays) select {
    _x params ["_localData", "_mapCtrl"];
    _localData params ["_xIntelIndex", "_xControlGroupPosX", "_xControlGroupPosY"];

    if (({(_x select 1) == _xIntelIndex} count  _intelArray) == 0) then {
        //If intel is dropped, remove display
        TRACE_2("does not have matching mag, del ctrl",_xIntelIndex,_mapCtrl);
        ctrlDelete _mapCtrl;
        false
    } else {
        if (isNull _mapCtrl) then {
            private _ctrlGroup = (findDisplay 12) ctrlCreate [QGVAR(controlGroup), -1];
            TRACE_2("add map display",_xIntelIndex,_ctrlGroup);
            _x set [1, _ctrlGroup];

            _ctrlGroup setVariable [QGVAR(intelIndex), _xIntelIndex];
            [_ctrlGroup, _xIntelIndex, false, _xControlGroupPosX, _xControlGroupPosY] call FUNC(displayDataInControlGroup);
        };
        true
    };
};
