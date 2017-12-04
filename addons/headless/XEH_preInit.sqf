#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (isServer) then {
    GVAR(headlessClients) = [];
    GVAR(inRebalance) = false;
    GVAR(endMissionCheckDelayed) = false;
    [QGVAR(headlessClientJoined), FUNC(handleConnectHC)] call CBA_fnc_addEventHandler;
};

GVAR(kindOfBlackList) = ["UAV", "UAV_AI_base_F", "B_UAV_AI", "O_UAV_AI", "I_UAV_AI"];

ADDON = true;
