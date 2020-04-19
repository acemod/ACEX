#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

// Init arrays of status modifiers
GVAR(thirstModifiers) = [];
GVAR(hungerModifiers) = [];

private _cache = call (uiNamespace getVariable [QGVAR(cacheP3Ds), {ERROR("no cache")}]); // cache built at preStart
// List of p3d water sources (case sensitive) for objects that report `typeOf == ""`
GVAR(waterSourceP3Ds) = _cache select 0;
// List of refill action offsets corresponding to the p3ds in the array above
GVAR(waterSourceOffsets) = _cache select 1;

// ContextMenuOption
["ACE_fieldRationsItems", ["CONTAINER"], "Eat/Drink", [], QPATHTOF(ui\icon_survival.paa), [{GVAR(enabled)}, {GVAR(enabled)}], {
        params ["_unit", "_container", "_item", "_slot", "_params"];
        [objNull, _unit, _item] call acex_field_rations_fnc_consumeItem;
        false
    }, false, []] call CBA_fnc_addItemContextMenuOption;

ADDON = true;
