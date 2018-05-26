/*
 * Author: mharis001, Glowbal, PabstMirror
 * Adds refill water actions to water sources from config.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call acex_field_rations_fnc_addRefillActions
 *
 * Public: No
 */
#include "script_component.hpp"

// Scan config for water source classes
private _filter = QUOTE(getNumber (_x >> 'scope') == 2 && {getNumber (_x >> QQGVAR(refillSource)) > 0});
private _waterSources = _filter configClasses (configFile >> "CfgVehicles");

{
    private _classname = configName _x;
    LOG_1("Adding refill action to %1",_classname);

    private _action = [QGVAR(refill), localize LSTRING(Refill), "", {true}, {true}, LINKFUNC(getRefillChildren)] call ACEFUNC(interact_menu,createAction);
    [_classname, 0, ["ACE_MainActions"], _action] call ACEFUNC(interact_menu,addActionToClass);
} forEach _waterSources;
