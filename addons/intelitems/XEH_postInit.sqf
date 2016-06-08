#include "script_component.hpp"

GVAR(intelMap) = call CBA_fnc_createNamespace;

if (isServer) then {
    [QGVAR(requestMagIndex), FUNC(server_handleRequestMagIndex)] call CBA_fnc_addEventHandler;
    [QGVAR(setObjectData), FUNC(server_setObjectData)] call CBA_fnc_addEventHandler;
};

[QGVAR(recieveMagIndex), {
    params ["_magID", "_intelIndex"];
    TRACE_2("recieveMagIndex eh",_magID,_intelIndex);
    GVAR(intelMap) setVariable [_magID, _intelIndex];
}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
    GVAR(dataRequested) = [];
    GVAR(nextMapUpdate) = 0;
    GVAR(mapIcons) = [];
    GVAR(mapDisplays) = [];
    GVAR(localDataInfo) = [];

    [{ !isNull findDisplay 12 },
    {
        TRACE_1("Adding Main Map EH",_this);
        ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", FUNC(onMapDraw)];
    }, []] call CBA_fnc_waitUntilAndExecute;
};
