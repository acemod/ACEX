#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isServer) then {
    GVAR(headlessClients) = [];
    GVAR(inRebalance) = false;
    GVAR(endMissionCheckDelayed) = false;
    [QGVAR(headlessClientJoined), FUNC(handleConnectHC)] call CBA_fnc_addEventHandler;
};

ADDON = true;
