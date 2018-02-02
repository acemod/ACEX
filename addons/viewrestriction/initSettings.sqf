[
    QGVAR(preserveView),
    "CHECKBOX",
    [LSTRING(SettingPreserveViewName), LSTRING(SettingPreserveViewDesc)],
    "ACEX " + localize LSTRING(ModuleDisplayName),
    false,
    false,
    LINKFUNC(switchPreserveView)
] call CBA_settings_fnc_init;
