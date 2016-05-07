#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isServer) then {
    GVAR(headlessClients) = [];
    GVAR(inRebalance) = false;
    ["ACE_HeadlessClientJoined", FUNC(handleConnectHC)] call ace_common_fnc_addEventHandler;
};

ADDON = true;
